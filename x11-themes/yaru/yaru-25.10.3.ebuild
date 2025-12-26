EAPI=8

inherit meson

DESCRIPTION="Yaru default ubuntu theme"
HOMEPAGE="https://github.com/ubuntu/yaru"
SRC_URI="https://github.com/ubuntu/yaru/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3 CC-BY-SA-4.0"
SLOT="0"
KEYWORDS="amd64"

IUSE=""

BDEPEND="dev-lang/sassc"

src_install(){
    meson_src_install
}