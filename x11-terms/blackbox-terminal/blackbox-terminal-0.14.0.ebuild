# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
 
EAPI=7
 
DESCRIPTION="A beautiful GTK 4 terminal"
HOMEPAGE="https://gitlab.gnome.org/raggesilver/blackbox"
SRC_URI="https://gitlab.gnome.org/raggesilver/blackbox/-/archive/v0.14.0/blackbox-v0.14.0.tar.gz -> blackbox-terminal-0.14.0.tar.gz"
 
inherit meson vala

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
 
DEPEND=""
RDEPEND="
    >=gui-libs/libadwaita-1.5.2
    >=dev-libs/libgee-0.20.6-r1
    >=gui-libs/vte-0.74.2:2.91
    =gui-libs/pqmarble-9999
"
BDEPEND="
    $(vala_depend)
"

S="${WORKDIR}/blackbox-v0.14.0"

PATCHES=(
    "${FILESDIR}"/gcc-14.patch
)

src_configure() {
    vala_src_prepare
    local emesonargs=(
        -Dblackbox_is_flatpak=false
    )
    meson_src_configure
}

src_install() {
	meson_src_install
}

src_test() {
	meson test -C "${BUILD_DIR}"
}