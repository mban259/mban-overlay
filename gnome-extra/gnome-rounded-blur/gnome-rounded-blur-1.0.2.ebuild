EAPI=7

inherit meson

DESCRIPTION="GNOME Shell BlurEffect with rounded corners"

HOMEPAGE="https://github.com/kancko/gnome-rounded-blur"

# https://github.com/kancko/gnome-rounded-blur/archive/refs/tags/v1.0.2.tar.gz
SRC_URI="https://github.com/kancko/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="GPL-3"

SLOT="0"

KEYWORDS="~amd64"

DEPEND="
    dev-libs/glib
    media-libs/graphene
    x11-wm/mutter
"
RDEPEND="
    ${DEPEND}
"
BDEPEND="
    dev-build/ninja
    dev-libs/gobject-introspection
"

S="${WORKDIR}/${PN}-${PV}"

