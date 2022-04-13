EAPI=7

DESCRIPTION="Intel C for Media RunTime GPU kernel manager"

HOMEPAGE="https://01.org/linuxmedia/vaapi"

SRC_URI="https://github.com/intel/cmrt/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"

SLOT="0"

KEYWORDS="~amd64"

IUSE=""

RDEPEND="
    x11-libs/libva
"

DEPEND="${RDEPEND}"

S="${WORKDIR}/cmrt-${PV}"
