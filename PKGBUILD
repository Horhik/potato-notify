pkgname=potato-notify
pkgver=6
pkgrel=1
pkgdesc="A pomodoro timer with notifications"
arch=('any')
url="https://github.com/Horhik/potato-notify"
license=('MIT')
depends=('alsa-utils')
source=('potato.sh'
        'notification.wav'
        'LICENSE'
        './icons/pause-completed.png'
        './icons/pause.png'
        './icons/work-completed.png'
        './icons/work.png'
)

md5sums=('0e9eacfc9a796fc854726c4b888b8e52j'
         '1ddcbd2862764b43d75fb1e484bf8912'
         'b01bacb54937c9bdd831f4d4ffd2e31c'
         '1f9fc2e4723b8b17b341d74b2a804d3c'
         '573ad5a3c98f7f74dbcd331e024345c5'
         'f8742b13260be6276bccdedba15687c2'
         '577b1e86ebf4d6a6a7d57cfd94260862'
        )
$pkgdir
package() {
	install -D $srcdir/../potato.sh $pkgdir/usr/bin/$pkgname
	install -D -m644 $srcdir/../LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
	install -D $srcdir/../notification.wav $pkgdir/usr/lib/$pkgname/notification.wav
	install -D $srcdir/../icons/pause-completed.png $pkgdir/usr/lib/$pkgname/icons/pause-completed.png
	install -D $srcdir/../icons/pause.png $pkgdir/usr/lib/$pkgname/icons/pause.png
	install -D $srcdir/../icons/work-completed.png $pkgdir/usr/lib/$pkgname/icons/work-completed.png
	install -D $srcdir/../icons/work.png $pkgdir/usr/lib/$pkgname/icons/work.png
}
