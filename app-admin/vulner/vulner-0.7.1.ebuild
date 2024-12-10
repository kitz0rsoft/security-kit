# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Discover CVEs for packages installed by the portage"
HOMEPAGE="https://github.com/mrl5/vulner"
SRC_URI="https://github.com/mrl5/vulner/releases/download/v0.7.1/vulner-v0.7.1.tar.gz -> vulner-v0.7.1.tar.gz
https://regen.mordor/70/f3/f4/70f3f4fdbb481489b5e19c9c1faf586c173efc6ee0332d0d07f12be3367597262eb3bba4bf1fea9004486c80d18d797a530ad3e97d0ad34188fb33026b6f1d04 -> vulner-0.7.1-funtoo-crates-bundle-df28f692372d1f438fd5f208561d70c815e249c7ebd4ee048847751bcc61500c738e8c9ee2d85cb393a06b6d2fb2fa9791e7f58d25cc49b47c83cd7ed170e398.tar.gz"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="*"

DEPEND=""
RDEPEND=">=dev-lang/python-3.7"
BDEPEND="virtual/rust"

DOCS=( README.md )

QA_FLAGS_IGNORED="/usr/bin/vulner"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/mrl5-vulner-* ${S} || die
}

src_install() {
	cargo_src_install '--path' './crates/cli'
	einstalldocs
}