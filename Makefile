MAKE_IMAGE ?= newrahmat/make

MAKEFILE_DIR := $(dir $(abspath $(firstword $(MAKEFILE_LIST))))

define make_task
	docker run --rm -v $(MAKEFILE_DIR)Makefile:/opt/app/Makefile -w /opt/app $(MAKE_IMAGE) sh -c "make $(1)"
endef



#CURRENT_TAG_VERSION := $(shell git tag -l | sort --version-sort -r | awk 'NR==1{print $$1}' )

#ifndef CURRENT_VERSION
#  CURRENT_VERSION := 0.0.0
#endif

BRANCH = $(shell git rev-parse --abbrev-ref HEAD)


hello:
	docker run --rm -v $(MAKEFILE_DIR)Makefile:/opt/app/Makefile -w /opt/app $(MAKE_IMAGE) sh -c "make _hello"

_hello:
	echo "Hello World"


info:
	$(call make_task,_info)

_info:
	@echo $(BRANCH)



build:
	$(call make_task,_build)

_build:
	@echo "STEP BUILD.........."




