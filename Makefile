#!/usr/bin/make -f

.PHONY: clean
clean:
	rm -rf artifacts debian/apt-boto-s3* debian/debhelper* debian/files

.PHONY: install
install:
	install -d $(DESTDIR)/usr/lib/apt/methods/
	install s3.py $(DESTDIR)/usr/lib/apt/methods/s3

.PHONY: package
package:
	VERSION=$$(date +"%Y%m%d%H%M%S")-$$(git rev-parse --short HEAD); \
	dch --controlmaint -b -v $${VERSION} New version ;
	dpkg-buildpackage -us -uc
	@mkdir artifacts
	mv ../$(PROJECT)*.changes ../$(PROJECT)*.deb ../$(PROJECT)*.dsc ./artifacts
