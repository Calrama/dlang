# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

KEYWORDS="-* amd64 x86"
YEAR=2018
DLANG_VERSION_RANGE="2.067-2.080"

inherit dmd

PATCHES=(
	"${FILESDIR}/2.078-allow-deprecations.patch"
	"${FILESDIR}/2.083-link-32-bit-shared-lib-with-ld.bfd.patch"
)

dmd_src_prepare_extra() {
	# Copy default DDOC theme file into resource directory
	mkdir "dmd/res" || die "Failed to create 'dmd/res' directory"
	cp "${FILESDIR}/2.076-default_ddoc_theme.ddoc" "dmd/res/default_ddoc_theme.ddoc" || die "Failed to copy 'default_ddoc_theme.ddoc' file into 'src/res' directory."

	# Copy missing config.sh
	cp "${FILESDIR}/2.076-config.sh" "dmd/config.sh" || die "Failed to copy 'config.sh' file into 'dmd' directory."
}
