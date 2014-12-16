clear

apt-get install -y amule-daemon

cd /root/.aMule/

rm amule.conf

wget https://raw.githubusercontent.com/haseit0/rtorrent.installer/master/amule.conf --no-check-certificate

cd

cd /etc/default/

rm amule-daemon

wget https://raw.githubusercontent.com/haseit0/rtorrent.installer/master/amule-daemon --no-check-certificate

/etc/init.d/amule-daemon start
