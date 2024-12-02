# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

SRC_URI="https://github.com/getsops/sops/tarball/3ab69975bc1f7a75a5e75ab1cee5da8a6a07bf34 -> sops-3.9.2-3ab6997.tar.gz
https://regen.mordor/66/dd/9e/66dd9e91c8e5782dd079dbc82f9d2929de2594d2e81968970fcb146e87c7883b7c5e96ad5eb538a0378b853fcb7848998e485b1f8ab3160cfee4bbc7c99d87c5 -> sops-3.9.2-funtoo-go-bundle-e17b836849e35131abfbe520255ad640f457cfd164240ca0eb29ec28cb3c34d8cffaeaff3e88a5332d856d319d106938f2f5955e2b859c260f9844a951b79d8f.tar.gz"
KEYWORDS="*"

DESCRIPTION="Simple and flexible tool for managing secrets"
HOMEPAGE="https://github.com/getsops/sops"
LICENSE="MPL-2.0"
SLOT="0"
S="${WORKDIR}/getsops-sops-3ab6997"

DOCS=( {CHANGELOG,README}.rst )

src_compile() {
	CGO_ENABLED=0 \
		go build -v -ldflags "-s -w" -o "${PN}" ./cmd/sops
}

src_install() {
	einstalldocs
	dobin ${PN}
}