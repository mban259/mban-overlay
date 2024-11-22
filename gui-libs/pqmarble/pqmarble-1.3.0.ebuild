# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
 
EAPI=7
 
DESCRIPTION="Utility library for GNOME apps."
HOMEPAGE="https://gitlab.gnome.org/raggesilver/marble"
SRC_URI="https://gitlab.gnome.org/raggesilver/marble/-/archive/v1.3.0/marble-v1.3.0.tar.gz -> pqmarble-1.3.0.tar.gz"
 
inherit meson vala 

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
 
DEPEND=""
RDEPEND="
    >=dev-libs/gobject-introspection-1.78.1-r2

"
BDEPEND="
    $(vala_depend)
"

S="${WORKDIR}/marble-v1.3.0"

src_configure() {
    vala_src_prepare
    meson_src_configure
}

src_install() {
	meson_src_install
}

src_test() {
	meson test -C "${BUILD_DIR}"
}