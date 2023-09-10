# Assigns to SUBDIRS all directories starting from the second level (subdirectories) 
# that contain a file named 'Makefile'
SUBDIRS := $(shell find . -mindepth 2 -type f -name Makefile -exec dirname {} \;)

all:
	@for i in $(SUBDIRS); do $(MAKE) -C $$i; done

pre-install:
	@rm -fr bin
	@mkdir -p bin

install: pre-install
	@find . -name "*.sfc" -exec cp -fv {} bin \;

clean:
	@rm -fr bin
	@for i in $(SUBDIRS); do $(MAKE) clean -C $$i; done

