EAPI=7

inherit vala

DESCRIPTION="A time management utility for GNOME"

HOMEPAGE="https://gnomepomodoro.org/"

# https://github.com/gnome-pomodoro/gnome-pomodoro/archive/refs/tags/0.19.2.tar.gz
SRC_URI="https://github.com/gnome-pomodoro/gnome-pomodoro/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"

SLOT="0"

KEYWORDS="~amd64"

IUSE=""

RDEPEND="
	gnome-base/gnome-common
	dev-libs/gobject-introspection-common
	dev-libs/gobject-introspection
	dev-libs/glib
	dev-libs/dbus-glib
	dev-libs/gom
	app-eselect/eselect-gnome-shell-extensions
	>=gnome-base/gnome-shell-40
"

DEPEND="${RDEPEND}"

BDEPEND="
	$(vala_depend)
	dev-util/intltool
"

S="${WORKDIR}/gnome-pomodoro-${PV}"

src_prepare() {
	vala_src_prepare
	./autogen.sh --prefix=/usr --datadir=/usr/share
	default
}

pkg_postinst() {
	ebegin "Updating list of installed extensions"
	eselect gnome-shell-extensions update
	eend $?
}
