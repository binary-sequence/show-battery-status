path_bin = $(DESTDIR)/usr/local/bin/

default:
	@echo "use 'make install' to install"

.PHONY: install
install:
	mkdir -p $(path_bin)
	install -m 0651 src/show-battery-status.sh "$(path_bin)"
	ln -s /usr/local/bin/show-battery-status.sh "$(path_bin)"/show-battery-status

.PHONY: remove
remove:
	rm "$(path_bin)"/show-battery-status
	rm "$(path_bin)"/show-battery-status.sh
