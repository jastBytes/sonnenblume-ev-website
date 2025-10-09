.PHONY: serve

HUGO_VERSION=0.151.0
HUGO_CMD=tmp/bin/hugo-$(HUGO_VERSION)
HUGO_ARCHIVE=tmp/hugo-$(HUGO_VERSION).tgz

OSFLAG 				:=
ARCH := $(shell uname -m)
UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Linux)
	OSFLAG = Linux
else ifeq ($(UNAME_S),Darwin)
	OSFLAG = darwin
  ARCH = universal
endif

##@ General

# The help target prints out all targets with their descriptions organized
# beneath their categories. The categories are represented by '##@' and the
# target descriptions by '##'. The awk commands is responsible for reading the
# entire set of makefiles included in this invocation, looking for lines of the
# file as xyz: ## something, and then pretty-format the target and help. Then,
# if there's a line with ##@ something, that gets pretty-printed as a category.
# More info on the usage of ANSI control characters for terminal formatting:
# https://en.wikipedia.org/wiki/ANSI_escape_code#SGR_parameters
# More info on the awk command:
# http://linuxcommand.org/lc3_adv_awk.php

help: ## display this help.
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_0-9-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

$(HUGO_CMD): $(HUGO_ARCHIVE)
	@mkdir -p tmp/bin
	@tar -xvz -C tmp -f tmp/hugo-$(HUGO_VERSION).tgz
	@mv tmp/hugo tmp/bin/hugo-$(HUGO_VERSION)

$(HUGO_ARCHIVE):
	@mkdir -p tmp
	@curl -Lo $(HUGO_ARCHIVE) https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_${OSFLAG}-${ARCH}.tar.gz

default: build

hugo: $(HUGO_CMD) ## ensure hugo is installed
	@$(HUGO_CMD) version

hugo-mod: $(HUGO_CMD) ## update hugo modules
	@$(HUGO_CMD) mod get -u
	@$(HUGO_CMD) mod tidy

serve: $(HUGO_CMD) ## serve local
	@$(HUGO_CMD) serve -D --disableFastRender --bind 0.0.0.0

build: $(HUGO_CMD) ## build the website
	@$(HUGO_CMD)