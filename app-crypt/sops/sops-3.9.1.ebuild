# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

SRC_URI="https://github.com/getsops/sops/tarball/af949bd819de7094a450d6aab7a7a1ca2fa387be -> sops-3.9.1-af949bd.tar.gz
https://distfiles.macaronios.org/16/40/65/1640650c71e9384c783201de1b4a7758e28838de4edab6ca6eb838e18925cfebfbee68dff35132da655f041d8ef612a58002f86e2f8d8b1ed320529a56bdf55f -> sops-3.9.1-funtoo-go-bundle-2b8d674f65433b121e80b34f5cce186ea99350ed8a05c862f0ab9a7ef1722cce6e5a6eecfc43d0fb88a3e7c4af2cd9b942ce93a09760fcf13d6205e394a9cac7.tar.gz"
KEYWORDS="*"

DESCRIPTION="Simple and flexible tool for managing secrets"
HOMEPAGE="https://github.com/getsops/sops"
LICENSE="MPL-2.0"
SLOT="0"
S="${WORKDIR}/getsops-sops-af949bd"

DOCS=( {CHANGELOG,README}.rst )

src_compile() {
	CGO_ENABLED=0 \
		go build -v -ldflags "-s -w" -o "${PN}" ./cmd/sops
}

src_install() {
	einstalldocs
	dobin ${PN}
}