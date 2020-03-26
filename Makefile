# This file is part of 'show-battery-status'.
#
# Copyright 2012-2020 Sergio Lindo <sergiolindo.empresa@gmail.com>
#
# 'show-battery-status' is free software: you can redistribute it and/or
# modify it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or (at your
# option) any later version.
#
# 'show-battery-status' is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General
# Public License for more details.
# You should have received a copy of the GNU General Public License along with
# 'show-battery-status'. If not, see <http://www.gnu.org/licenses/>.

# This file is intended for installation in UNIX based systems
SHELL = /bin/sh
INSTALL = install
INSTALL_PROGRAM = $(INSTALL) -m 0555
INSTALL_DIR = $(INSTALL) -d -m 0775

software_name = show-battery-status
prefix = /usr/local
bindir = $(prefix)/bin
srcdir = $(prefix)/src
software_srcdir = $(srcdir)/$(software_name)
software_bindir = $(DESTDIR)$(bindir)

.PHONY: all
all:
	@echo "This is the default target and does nothing. Use 'make install' to install"

.PHONY: install
install:
	$(INSTALL_DIR) $(software_bindir)
	$(INSTALL_PROGRAM) $(software_srcdir)/src/$(software_name).sh $(software_bindir)/$(software_name).sh
	@echo "$(software_name) is installed :)"

.PHONY: uninstall
uninstall:
	rm $(software_bindir)/show-battery-status.sh
	@echo "$(software_name) is uninstalled :)"
