#---------------------------------------------------------------------------------
ifeq ($(strip $(PVSNESLIB_HOME)),)
$(error "Please create an environment variable PVSNESLIB_HOME by following this guide: https://github.com/alekmaul/pvsneslib/wiki/Installation")
endif

TA     := $(PVSNESLIB_HOME)/pvsneslib/snesmod/tasm.exe
TXCONV := $(PVSNESLIB_HOME)/devkitsnes/tools/bin2txt

all: sm_spc.asm install

# just make a asm file of snesmod spc-700 driver
sm_spc.asm : sm_spc.as7
	$(TA) -07 -b -l $< sm_spc.obj sm_spc.lst
	$(TXCONV) -ca sm_spc.obj
	@rm sm_spc.obj sm_spc.lst

install:
	@cp sm_spc.asm $(PVSNESLIB_HOME)/pvsneslib/source

clean:
