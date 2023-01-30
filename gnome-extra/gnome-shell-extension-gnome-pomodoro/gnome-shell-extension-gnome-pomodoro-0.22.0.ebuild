EAPI=7

inherit vala meson

DESCRIPTION="A time management utility for GNOME"

HOMEPAGE="https://gnomepomodoro.org/"

# https://github.com/gnome-pomodoro/gnome-pomodoro/archive/refs/tags/0.22.0.tar.gz
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
	>=gnome-base/gnome-shell-43
"

DEPEND="${RDEPEND}"

BDEPEND="
	$(vala_depend)
	dev-util/intltool
"

S="${WORKDIR}/gnome-pomodoro-${PV}"

src_configure() {
	vala_src_prepare
	meson_src_configure
}

src_install() {
	meson_src_install
}

pkg_postinst() {
	ebegin "Updating list of installed extensions"
	eselect gnome-shell-extensions update
	eend $?
}
