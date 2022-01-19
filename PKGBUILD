pkgname=dni9-dwm
pkgver=1.r18.6bbfff9
pkgrel=1
pkgdesc="My bloated build of DWM"
url="https://github.com/DNI9/dwm"
arch=('any')
license=('GPL3')
options=(zipman)
depends=('libx11' 'libxinerama' 'libxft' 'freetype2' 'hsetroot')
optdepends=('playerctl: Media player controller'
            'dunst: notification deamon'
            'brightnessctl: brightness control'
            'maim: screenshot tool'
            'rofi: launcher'
            'betterlockscreen: lockscreen')
conflicts=('dwm')
provides=("${pkgname}")
options=(!strip !emptydirs)

pkgver() {
  cd "${_pkgname}"
  printf "1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cp -af ../source/. ${srcdir}
	cp -af ../.dwm ${srcdir}
}

build() {
  cd "$srcdir"
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11 FREETYPEINC=/usr/include/freetype2
}

package() {
  cd "$srcdir"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -m644 -D "$srcdir/dwm.desktop" "$pkgdir/usr/share/xsessions/dwm.desktop"

  local _dwmdir=${pkgdir}/home/$USER/
  mkdir -p "$_dwmdir"
  cp -r ${srcdir}/.dwm 		"$_dwmdir"
  chmod +x "$_dwmdir"/.dwm/autostart.sh
  chmod +x "$_dwmdir"/.dwm/bin/*
}
