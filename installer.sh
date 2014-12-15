clear

con=0
while [ $con -eq 0 ]; do

        echo -n "Introduce Un usuarion valido: "
        read -e user
        uid=$(cat /etc/passwd | grep "$user": | cut -d: -f3)

        if [ -z $(cat /etc/passwd | grep "$user":) ]; then
                echo
                echo "No existe este usuario."

        elif [ $uid -lt 999 ]; then
                echo
                echo "Esta UID de usuario es demasiado corta."

        elif [ $user == nobody ]; then
                echo
                echo "No puedes usar 'nobody' como usuario"
        else
                con=1
        fi
done

homedir=$(cat /etc/passwd | grep "$user": | cut -d: -f6)

apt-get update
apt-get install subversion build-essential automake libtool libcppunit-dev libcurl3-dev libsigc++-2.0-dev unzip unrar-free curl libncurses-dev
apt-get install apache2 php5 php5-cli php5-curl

apt-get install libapache2-mod-scgi
a2enmod scgi

apt-get install screen 

mkdir install
cd install

svn checkout http://svn.code.sf.net/p/xmlrpc-c/code/trunk xmlrpc-c-code
cd xmlrpc-c-code/
./configure --disable-cplusplus
make
make install

cd
cd install

wget http://libtorrent.rakshasa.no/downloads/libtorrent-0.13.4.tar.gz
tar -xvzf libtorrent-0.13.4.tar.gz
cd libtorrent-0.13.4
./autogen.sh
./configure
make
make install

cd
cd install

wget http://libtorrent.rakshasa.no/downloads/rtorrent-0.9.4.tar.gz
tar -xvzf rtorrent-0.9.4.tar.gz
cd rtorrent-0.9.4
./autogen.sh 
 ./configure --with-xmlrpc-c 
 make
 make install
 ldconfig
 
 

