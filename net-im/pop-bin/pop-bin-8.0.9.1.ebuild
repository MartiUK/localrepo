# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rpm

MY_PV=$(ver_rs 3 '-')
MY_P=pop-${MY_PV}

DESCRIPTION="Pop Binary"
HOMEPAGE="https://www.pop.com"
SRC_URI="https://download.pop.com/desktop-app/linux/$(ver_cut 1-3)/pop-${MY_PV}.x86_64.rpm"
S=${WORKDIR}/fetchmail-$(ver_cut 1-3)

LICENSE="GPL-2 public-domain"
SLOT="0"
KEYWORDS="-*"

RESTRICT="mirror"

# Need to test if the file can be unpacked with rpmoffset and cpio
# If it can't then set:

#BDEPEND="app-arch/rpm"

# To force the use of rpmoffset and cpio instead of rpm2cpio from
# app-arch/rpm, then set the following:

#USE_RPMOFFSET_ONLY=1

src_unpack() {
    rpm_src_unpack ${A}
}

src_prepare() {
    for i in "${WORKDIR}"/*.patch ; do
        eapply "${i}"
    done
    eapply_user
}
