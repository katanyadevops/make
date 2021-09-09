MAKEFILE_DIR := $(dir $(abspath $(firstword $(MAKEFILE_LIST))))

hello:
	docker run --rm -v $(MAKEFILE_DIR)Makefile:/opt/app/Makefile -w /opt/app alpine sh -c "apk add --update make && make _hello"

_hello:
	echo "Hello World"
