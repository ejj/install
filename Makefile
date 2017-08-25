VERSION = $(shell node -e "console.log(require(\"./package.json\").version);")
URL = "https://github.com/quilt/quilt/releases/download/${VERSION}"

all: artifacts

publish: artifacts
	npm publish .

artifacts: quilt_linux quilt_darwin

quilt_linux quilt_darwin:
	curl --fail -L -O ${URL}/$@
	chmod 755 $@
