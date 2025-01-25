# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

SRC_URI="https://github.com/getsops/sops/tarball/72e1036eafd18d52c1ae57030c3699e19285c0e7 -> sops-3.9.4-72e1036.tar.gz
https://regen.mordor/4d/c0/ac/4dc0ac1715775b519f443c32255a4e2721c1d5f9f29eeec22e8dbd7cefd3914229cbb99d531c29cc0abdbdbf36969695643311d9de32793e4f1300322b85c0de -> sops-3.9.4-funtoo-go-bundle-d8eb2df6ec166af4d6a00f799cac34e199280f8f5d5bc011733a336337d9dca5a86549338bb73018de03df770e7c4f02a06f473c3eff91c611d07fb0d9cc681e.tar.gz"
KEYWORDS="*"

DESCRIPTION="Simple and flexible tool for managing secrets"
HOMEPAGE="https://github.com/getsops/sops"
LICENSE="MPL-2.0"
SLOT="0"
S="${WORKDIR}/getsops-sops-72e1036"

DOCS=( {CHANGELOG,README}.rst )

src_compile() {
	CGO_ENABLED=0 \
		go build -v -ldflags "-s -w" -o "${PN}" ./cmd/sops
}

src_install() {
	einstalldocs
	dobin ${PN}
}