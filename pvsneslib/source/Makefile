# Fix for libc_c.ps.
export LIBC_C_FIX := 1

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
	@mv $(SNESOBJS) $(LIBDIRSOBJS)

# Clean build artifacts.
cleandist:
	@echo Cleaning build artifacts ...
	@rm -f $(LIBDIRSOBJS)/*.obj libc_c.asm

# Trigger clean recipe from snes_rules.
clean: cleandist
