SUBDIRS := $(shell find . -mindepth 2 -type f -name Makefile -exec dirname {} \;)


all: $(SUBDIRS)
	$(MAKE) -C $<

install:
	@mkdir -p bin
	@find . -not -path "./bin/*" -name "*.sfc" -exec cp {} bin \;

clean: 
	@rm -fr bin
	@for dir in $(SUBDIRS); do \
		$(MAKE) clean -C $$dir; \
	done
