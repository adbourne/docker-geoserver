VERSIONS = $(foreach df,$(wildcard */Dockerfile),$(df:%/Dockerfile=%))

all: build

build: $(VERSIONS)

define geoserver-version
$1:
	docker build -t adbourne/geoserver:$(shell echo $1 | sed -e 's/-.*//g') $1
endef
$(foreach version,$(VERSIONS),$(eval $(call geoserver-version,$(version))))

.PHONY: all build $(VERSIONS)