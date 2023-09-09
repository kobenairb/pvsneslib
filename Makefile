# define variables
COMPILER_PATH       := compiler
TOOLS_PATH          := tools
SNES_EXAMPLES_PATH  := snes-examples
DEVKITSNES_PATH     := devkitsnes
PVSNESLIB_PATH      := pvsneslib
RELEASE_PATH        := release/pvsneslib

# Build the whole project, without documentation.
all:
# build compiler
	$(MAKE) -C $(COMPILER_PATH)
	$(MAKE) -C $(COMPILER_PATH) install

# build tools
	$(MAKE) -C $(TOOLS_PATH)
	$(MAKE) -C $(TOOLS_PATH) install

# build pvsneslib

	$(MAKE) -C $(PVSNESLIB_PATH)
	$(MAKE) -C $(PVSNESLIB_PATH) install

# build snes-examples and install them
	$(MAKE) -C $(SNES_EXAMPLES_PATH)
	$(MAKE) -C $(SNES_EXAMPLES_PATH) install

	@echo
	@echo "* Build finished successfully !"
	@echo

# Here we generate doc for a release, so we also install it.
# pvsneslib release directories are created here.
# DOCS_PDF_ON is set to 1 to enable the pdf creation.
docs:
	DOCS_PDF_ON=1 $(MAKE) -C $(PVSNESLIB_PATH) docs
	@mkdir -p $(RELEASE_PATH)/$(PVSNESLIB_PATH)/docs
	@cp -r $(PVSNESLIB_PATH)/docs/html $(RELEASE_PATH)/$(PVSNESLIB_PATH)/docs
	@cp $(PVSNESLIB_PATH)/docs/latex/refman.pdf $(RELEASE_PATH)/$(PVSNESLIB_PATH)/docs/pvsneslib_manual.pdf

# Create the release, call all and docs first.
release: clean all docs
	@cp -r $(DEVKITSNES_PATH) $(RELEASE_PATH)
	@cp -r $(PVSNESLIB_PATH)/include $(RELEASE_PATH)/$(PVSNESLIB_PATH)
	@cp -r $(PVSNESLIB_PATH)/lib $(RELEASE_PATH)/$(PVSNESLIB_PATH)
	@cp -r $(SNES_EXAMPLES_PATH) $(RELEASE_PATH)/$(SNES_EXAMPLES_PATH)
	@cp $(PVSNESLIB_PATH)/PVSnesLib_Logo.png $(RELEASE_PATH)/$(PVSNESLIB_PATH)
	@cp $(PVSNESLIB_PATH)/pvsneslib_license.txt $(RELEASE_PATH)/$(PVSNESLIB_PATH)
	@cp $(PVSNESLIB_PATH)/pvsneslib_snesmod.txt $(RELEASE_PATH)/$(PVSNESLIB_PATH)
	@cp $(PVSNESLIB_PATH)/pvsneslib_version.txt $(RELEASE_PATH)/$(PVSNESLIB_PATH)

	@echo
	@echo "* Release created successfully !"
	@echo

# Print the version of the development tools used on the system
version:
	@echo "Version of gcc:"
	@$(CC) --version | head -n 1
	@echo ""
	@echo "Version of cmake:"
	@$(CMAKE) --version | head -n 1
	@echo ""
	@echo "Version of make:"
	@$(MAKE) --version | head -n 1

# clean everything
clean:
	$(MAKE) -C $(COMPILER_PATH) clean
	$(MAKE) -C $(TOOLS_PATH) clean
	$(MAKE) -C $(PVSNESLIB_PATH) clean
	$(MAKE) -C $(SNES_EXAMPLES_PATH) clean
	@rm -rf release

# Define phony targets
.PHONY: version
