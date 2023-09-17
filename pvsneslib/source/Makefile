# Fix for libc_c.ps.
export LIBC_C_FIX := 1

ifeq ($(strip $(PVSNESLIB_HOME)),)
$(error "Please create an environment variable PVSNESLIB_HOME by following this guide: https://github.com/alekmaul/pvsneslib/wiki/Installation")
endif

include $(PVSNESLIB_HOME)/devkitsnes/snes_rules

SNESOBJS := crt0_snes.obj libm.obj libtcc.obj libc.obj

# Define recipe dependencies.
libc.obj: libc.asm libc_c.asm
libc_c.asm: libc_c.c sm_spc.asm
libc_c.c:
libm.obj: libm.asm

# Compile SNESOBJS .obj files with snes_rules.
all: $(SNESOBJS)

# Install .obj files in lib.
install:
	@echo Moving $(SNESOBJS) to $(LIBDIRSOBJS) ...
	@mkdir -p $(LIBDIRSOBJS)
	@mv $(SNESOBJS) $(LIBDIRSOBJS)

# Clean build artifacts.
cleandist:
	@echo Cleaning build artifacts ...
	@rm -rf $(LIBDIRSOBJS) libc_c.asm

# Trigger clean recipe from snes_rules.
clean: cleandist
