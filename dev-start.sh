#!/bin/bash
echo "Start and access a docker image that has some development tools and sshd"
image="petedaguru/f20-goo:0.7"
target_user="user"
container=$1
container_already_running=false
[ "" == "${container}" ] && container="dev-start-${target_user}"
container_state="$(docker inspect --format='{{ .State.Running }}' ${container})"
if [ "true" == "${container_state}" ]; then    
   container_already_running=true
   echo "Using running container ${container}"
else
 if [ "false" == "${container_state}" ]; then
   echo Starting "${container}"
   docker start $container
 else
   echo "Creating ${container} - can also be started via: docker run --name ${container} -i -t -v ~:/mnt/host $image ; # Use ctrl-p ctrl-q to disconnect"
   docker run --name ${container} -d -t -v ~:/mnt/host $image 
 fi

# ctrl-p ctrl-q to suspend attachment to session
suspend_session="$(echo -n $'\cp'$'\cq')"
host_pubkey="$(cat ~/.ssh/id_rsa.pub)"
host_gid="$(id -g)"
docker attach $container <<EOF
[ ! -f /etc/ssh/ssh_host_rsa_key ] &&  ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' 
[ ! -f /etc/ssh/ssh_host_ecdsa_key ] &&  ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N '' 
sed -i -e 's/session    required     pam_loginuid.so/#session    required     pam_loginuid.so/' /etc/pam.d/sshd 
[ ! -f /home/${target_user} ] && useradd -o -m --uid $host_gid ${target_user}
# echo "user:password" ${target_user}
sudo -i -u ${target_user}
grep -Fxq "$host_pubkey" .ssh/authorized_keys || ( mkdir -p .ssh ;  (echo "$host_pubkey" >> .ssh/authorized_keys) ; chmod 755  .ssh .ssh/authorized_keys ) 
exit
(ps ax | grep -q "/usr/sbin/[s]shd") || /usr/sbin/sshd
$suspend_session
EOF

fi

container_ip=$( docker inspect --format "{{ .NetworkSettings.IPAddress }}" "${container}" )
ssh-keygen -R ${container_ip} ; # Clean up ~/.ssh/known_hosts file to avoid error messages

#sudo -i firewall-cmd --add-port=27017/tcp ; Let MongoDB traffic through

sleep 5s

SSH_CMDLINE=$( echo "ssh -X -R27017:127.0.0.1:27017 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null ${target_user}@${container_ip}" )
echo "Running ${SSH_CMDLINE}"
${SSH_CMDLINE}
