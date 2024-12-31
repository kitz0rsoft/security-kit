# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

SRC_URI="https://github.com/getsops/sops/tarball/64ccb3508185ad6247f4e096266e701caa6648f4 -> sops-3.9.3-64ccb35.tar.gz
https://regen.mordor/17/d3/a9/17d3a9eda5b0579adac57bdd158098661f95cc5e02fb5e92ba63a86e81f9c839dbd8417ef4ef7fb70c1f44ad986c486b441ad705d2f685637e6185dd4a3ecff2 -> sops-3.9.3-funtoo-go-bundle-8ea42aed38c4bd4b83d082c0925b49cec6b6246193fe24877ee44c025737b043be01d5168166320bda5b1dddb4b6da5186d94dad6ffdae9a9d64b40c44a0ccd4.tar.gz"
KEYWORDS="*"

DESCRIPTION="Simple and flexible tool for managing secrets"
HOMEPAGE="https://github.com/getsops/sops"
LICENSE="MPL-2.0"
SLOT="0"
S="${WORKDIR}/getsops-sops-64ccb35"

DOCS=( {CHANGELOG,README}.rst )

src_compile() {
	CGO_ENABLED=0 \
		go build -v -ldflags "-s -w" -o "${PN}" ./cmd/sops
}

src_install() {
	einstalldocs
	dobin ${PN}
}