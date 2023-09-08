# Define version number which will be used everywhere.
export PVSNESLIB_MAJOR   := 4
export PVSNESLIB_MINOR   := 0
export PVSNESLIB_PATCH   := 3
export PVSNESLIB_VERSION := $(PVSNESLIB_MAJOR).$(PVSNESLIB_MINOR).$(PVSNESLIB_PATCH)
# Directory with docs config and output (via doxygen).
export PVSDOCSDIR := docs

all: include/snes/libversion.h pvsneslibversion
	$(MAKE) -C source

install:
	$(MAKE) -C source install

cleandist:
	@echo Cleaning documentation ...
	@rm -rf $(PVSDOCSDIR)/html
	@rm -rf $(PVSDOCSDIR)/latex

	@echo Cleaning version files ...
	@rm -f pvsneslib_version.txt

clean: cleandist
	$(MAKE) -C source clean

# The default docs recipe. Here we build the doxygen and pdf documentations.
doxygenInstalled  := $(shell command -v doxygen -q 2>/dev/null)
pdflatexInstalled := $(shell command -v pdflatex -q 2>/dev/null)
docs:
ifndef doxygenInstalled
	@echo Doxygen is not installed, documentation will not be generated.
else
	@echo Building doxygen documentation ...
	PVSVERSION="$(PVSNESLIB_VERSION)" doxygen "$(PVSDOCSDIR)/pvsneslib.dox"
ifeq ($(DOCS_PDF_ON),1)
ifndef pdflatexInstalled
	@echo Pdflatex is not installed, documentation will not be generated.
else
	@echo Building pdf documentation ...
	$(MAKE) -C $(PVSDOCSDIR)/latex >/dev/null 2>&1
endif
endif
endif

# This rule generates a header file that contains the version information of the library.
# It defines three variables, _PVSNESLIB_MAJOR_, _PVSNESLIB_MINOR_, and _PVSNESLIB_PATCH_ that
# correspond to the major, minor, and patch versions respectively.
# It also defines a variable _PVSNESLIB_STRING_ that contains a string representation of the
# version information.
include/snes/libversion.h : Makefile
	@echo "#ifndef __PVSNESLIBVERSION_H__" > $@
	@echo "#define __PVSNESLIBVERSION_H__" >> $@
	@echo >> $@
	@echo "#define _PVSNESLIB_MAJOR_	$(PVSNESLIB_MAJOR)" >> $@
	@echo "#define _PVSNESLIB_MINOR_	$(PVSNESLIB_MINOR)" >> $@
	@echo "#define _PVSNESLIB_PATCH_	$(PVSNESLIB_PATCH)" >> $@
	@echo >> $@
	@echo '#define _PVSNESLIB_STRING_ "PVSnesLib V'$(PVSNESLIB_VERSION)'"' >> $@
	@echo >> $@
	@echo "#endif // __PVSNESLIBVERSION_H__" >> $@

# This target generates a text file containing the current version number of PVSnesLib.
# This allows for easier installation for users, as the version is no longer included in
# the folder name (which previously required users to update the 'pvsneslib_home' variable).
# Instead, the version can now be found in this specific file.
pvsneslibversion:
	@echo $(PVSNESLIB_VERSION) > pvsneslib_version.txt

# Define phony targets
.PHONY: docs
