VERSION = $(shell node -e "console.log(require(\"./package.json\").version);")
URL = "https://github.com/quilt/quilt/releases/download/${VERSION}"

all: artifacts

publish: artifacts
	npm publish .

artifacts: quilt_linux quilt_darwin init

quilt_linux quilt_darwin:
	curl --fail -L -O ${URL}/$@
	chmod 755 $@

init: src/quilt
	cd src/quilt && git fetch && git checkout ${VERSION}
	cp -r src/quilt/quiltctl/command/init/ .

src/quilt:
	mkdir -p src
	git clone https://github.com/quilt/quilt.git src/quilt
