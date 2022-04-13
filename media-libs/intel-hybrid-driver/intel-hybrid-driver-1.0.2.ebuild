EAPI=7

inherit eutils autotools

DESCRIPTION="Libva support for partially hardware accelerated encode and decode on Haswell and newer"

HOMEPAGE="https://github.com/intel/intel-hybrid-driver"

SRC_URI="https://github.com/intel/intel-hybrid-driver/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"

SLOT="0"

KEYWORDS="~amd64"

IUSE=""

RDEPEND="
    x11-libs/libva
    media-libs/libcmrt
"

DEPEND="${RDEPEND}"

S="${WORKDIR}/intel-hybrid-driver-${PV}"

PATCHES=(
	"${FILESDIR}"/gcc10-fix.patch
	"${FILESDIR}"/vadriverinit-fix.patch
)

src_prepare() {
    eapply_user
    default
    eautoreconf
}
