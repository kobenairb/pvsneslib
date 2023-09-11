# Fix for libc_c.ps.
export LIBC_C_FIX := 1

include $(PVSNESLIB_HOME)/devkitsnes/snes_rules

LIB_DIR  := $(PVSNESLIB_HOME)/pvsneslib/lib
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
	@echo Moving $(SNESOBJS) to $(LIB_DIR) ...
	@mv $(SNESOBJS) $(LIB_DIR)

# Clean build artifacts.
cleandist:
	@echo Cleaning build artifacts ...
	@rm -f $(LIB_DIR)/*.obj libc_c.asm

# Trigger clean recipe from snes_rules.
clean: cleandist
