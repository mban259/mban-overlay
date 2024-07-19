# Copyright 1999-2024 Gentoo Authors
# Copyright 2024-2024 mban259
# Distributed under the terms of the GNU General Public License v2


EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )
inherit distutils-r1

DESCRIPTION="Uncomplicated way to manage your Linux firewall"

HOMEPAGE="https://github.com/costales/gufw"


SRC_URI="https://github.com/costales/gufw/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

# ロゴはCC-BY 3.0
# どうやったらいい?
LICENSE="GPL-3"

SLOT="0"

# Archだとanyだけどamd64しか持ってないのでamd64のみ
KEYWORDS="~amd64"

IUSE=""

RDEPEND="
	net-firewall/ufw
	dev-lang/python
	dev-util/desktop-file-utils
	dev-util/gtk-update-icon-cache
	x11-libs/gtk+
	sys-auth/polkit
	dev-python/pygobject
	net-libs/webkit-gtk
"
