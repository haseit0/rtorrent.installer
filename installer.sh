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
