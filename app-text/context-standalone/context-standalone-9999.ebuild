# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="ConTeXt LMTX: Lean and Mean TeX eXperience with Lua, MetaPost, TeX, and XML"
HOMEPAGE="https://wiki.contextgarden.net/Installation"
SRC_URI="https://lmtx.pragma-ade.com/install-lmtx/context-linux-64.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

QA_PRESTRIPPED="usr/bin/context usr/bin/luametatex usr/bin/mtxrun"
QA_FILES="*"

RESTRICT="network-sandbox"

S="${WORKDIR}"


src_prepare() {
    cd ${WORKDIR}
    chmod +x ./install.sh
    ./install.sh
    default
}

src_install() {
	local context="/usr/share/texmf-dist/"
	dodir "${context}"

	cd "tex"

	cp -r texmf texmf-context "${D}${context}"

	dodir /usr/bin
	dobin texmf-linux-64/bin/*
}

pkg_postinst() {
    elog "ConTeXt LMTX has been installed."
    elog "Ensure that /usr/local/bin is in your PATH to use ConTeXt."
}

