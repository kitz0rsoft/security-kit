# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

SRC_URI="https://github.com/getsops/sops/tarball/be6df93d68dddb481c5d1bc8e4b255c5c00fde2c -> sops-3.10.2-be6df93.tar.gz
https://regen.mordor/65/cd/e8/65cde8f343eaf12e32544c55689bbee8ee7efd8cb7b15fcaff3d1ce91b16d13ce689ae04d6628f00ef3b4144d324d58c29ca4bbd92fab4e4ba5f33f77b37bc38 -> sops-3.10.2-funtoo-go-bundle-d29ad94b704cb073f83366bbc6d522f75ff9d23cdc3e6010ee1929972120a5139205fefd8c2cdca70118c3c8563c5b3c95be48e224a8dbf61d88a494f40896b0.tar.gz"
KEYWORDS="*"

DESCRIPTION="Simple and flexible tool for managing secrets"
HOMEPAGE="https://github.com/getsops/sops"
LICENSE="MPL-2.0"
SLOT="0"
S="${WORKDIR}/getsops-sops-be6df93"

DOCS=( {CHANGELOG,README}.rst )

src_compile() {
	CGO_ENABLED=0 \
		go build -v -ldflags "-s -w" -o "${PN}" ./cmd/sops
}

src_install() {
	einstalldocs
	dobin ${PN}
}