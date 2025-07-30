# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

SRC_URI="https://github.com/getsops/sops/tarball/be6df93d68dddb481c5d1bc8e4b255c5c00fde2c -> sops-3.10.2-be6df93.tar.gz
https://regen.mordor/ea/8b/23/ea8b2355e3f0ecb0e60dcdf27645b9c40c855cdf5b04af64f473916a5abb4e501fddbaf3239378c8a62f8d176c11be74fab040960ccb1631669b5acf6730a9ae -> sops-3.10.2-funtoo-go-bundle-d29ad94b704cb073f83366bbc6d522f75ff9d23cdc3e6010ee1929972120a5139205fefd8c2cdca70118c3c8563c5b3c95be48e224a8dbf61d88a494f40896b0.tar.gz"
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