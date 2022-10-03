# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit toolchain-funcs

DESCRIPTION="A byte-sized window manager written in C"
HOMEPAGE="https://berrywm.org"
SRC_URI="https://github.com/JLErvin/berry/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND="
	x11-libs/libxcb
	x11-libs/xcb-util
	x11-libs/xcb-util-wm
"
RDEPEND="${DEPEND}
	x11-misc/sxhkd
"

src_compile() {
	emake CC="$(tc-getCC)"
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" DOCPREFIX="${EPREFIX}/usr/share/doc/${PF}" install

	insinto /usr/share/xsessions

	insinto /etc/xdg/sxhkd
	doins examples/sxhkdrc
}
