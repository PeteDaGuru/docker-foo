Interesting links related to docker
==================================

Some docker-related links:

#### 2014-07-10 Thu:
* ~jpetazzo/Attaching to a container with Docker 0.9 and libcontainer (use nsenter or LXC and lxc-attach - PID=$(docker inspect --format '{{.State.Pid}}' my_container_id); nsenter --target $PID --mount --uts --ipc --net --pid):  http://jpetazzo.github.io/2014/03/23/lxc-attach-nsinit-nsenter-docker-0-9/
* Docker Log Management Using Fluentd - pull from /var/lib/docker/containers/*/*.log files using docker-gen https://github.com/jwilder/docker-gen (2014-03-17): http://jasonwilder.com/blog/2014/03/17/docker-log-management-using-fluentd/
*  Geard - client and agent for installing and linking Docker containers into systemd across hosts (https://openshift.github.io/geard ): https://github.com/openshift/geard

#### 2014-07-07 Mon:
*  Apache Hadoop on Fedora 20 with Docker (disable DNS reverse-lookups hdfs-site.xml: dfs.namenode.datanode.registration.ip-hostname-check=false): http://rrati.github.io/blog/2014/05/09/apache-hadoop-plus-docker-plus-fedora-issues-and-limitations/

#### 2014-07-06 Sun:
* Continuous Integration Using Docker, Maven and Jenkins (and Vagrant): http://www.wouterdanes.net/2014/04/11/continuous-integration-using-docker-maven-and-jenkins.html
* Vagrant on Fedora with libvirt  - vagrant-mutate, F20 (fedora 20 vagrant-kvm) (old 2013-12-09 http://ttboj.wordpress.com/2013/12/09/vagran

#### 2014-06-13 Fri:
* Google Cloud previews Docker-based virtual machines (2014-05-23): http://www.itworld.com/print/420163 
* An update on container support on Google Cloud Platform  (2014-06-10): http://googlecloudplatform.blogspot.com/2014/06/an-update-on-container-support-on-google-cloud-platform.html
* Kubernetes - framework for managing docker VMs (Google Cloud - GCE Google Compute Engine): https://github.com/GoogleCloudPlatform/kubernetes
* Containers at Google group (docker, https://github.com/GoogleCloudPlatform/container-agent ):  https://groups.google.com/forum/#!forum/google-containers 
* Containers as services or full application stacks (discussion from PlumberCon 2014): https://groups.google.com/forum/m/?_escaped_fragment_=topic/docker-dev/1K0Ff7Em18U#!topic/docker-dev/1K0Ff7Em18U
* GCE - Google compute engine pricing: https://developers.google.com/compute/pricing
* Description of Google Omega - cluster scheduling paper - Omega: flexible, scalable schedulers for large compute clusters (Malte Schwarzkopfy, Andy Konwinskiz,Michael Abd-El-Malek,John Wilkes 2013-04-17) (http://research.google.com/pubs/archive/41684.pdf): http://research.google.com/pubs/pub41684.html

### 2014-06-02 Mon:
* Clean up docker.io containers (( docker ps -a --no-trunc | grep 'weeks ago' | awk '{print $1}' | xargs docker rm) , remove untagged images docker images | grep "<none>" | awk '{print $3}' | xargs docker rmi ): http://stackoverflow.com/questions/17236796/how-to-remove-old-docker-io-containers
* Docker.io 1.0 logging thread: https://groups.google.com/forum/#!msg/docker-dev/3paGTWD6xyw/xj2XakbfdnoJ
* DNT - Testing code against many nodejs versions using Docker: http://r.va.gg/2013/11/testing-code-against-many-node-versions-with-docker.html
* Running systemd in a docker container (fedora - moving from libvirt-sandbox and virt-sandbox-service to docker - need privilege  CAP_SYS_ADMIN ): http://rhatdan.wordpress.com/2014/04/30/running-systemd-within-a-docker-container/
* Run SSH in Fedora docker image - Fedora-Dockerfiles / ssh / Dockerfile:  https://github.com/scollier/Fedora-Dockerfiles/blob/master/ssh/Dockerfile
* upstream fedora docker files ( yum install docker-io fedora-dockerfiles ): https://github.com/scollier/Fedora-Dockerfiles
* Building docker files on Fedora (yum install docker docker-io docker-registry --enablerepo=updates-testing - appliance-tools libguestfs-tools): http://allthingsopen.com/2013/12/19/building-docker-images-on-fedora/
* Docker image for Discourse discussion platform - http://www.discourse.org - uses launcher to help users get started (ssh key setup etc - https://github.com/discourse/discourse_docker/blob/master/launcher#L73-L92) : https://github.com/discourse/discourse_docker
* 15 docker tips: http://www.centurylinklabs.com/15-quick-docker-tips/
* Discussion on tracking image build + image source - Dockerfile and trusted builds: https://groups.google.com/forum/#!topic/docker-dev/NDigdAk9trc
* phusion/baseimage-docker as Ubuntu-based docker base image: http://phusion.github.io/baseimage-docker/#solution
* phusion/passenger-docker as Ubuntu-based docker base image for webapps(nodejs etc): https://github.com/phusion/passenger-docker
* Discussion of docker 'full' virtualization (phyusion/baseimage-docker) and other options: https://news.ycombinator.com/item?id=7258009

#### 2014-05-10 Sat:
* Utility packages from Docker team  (golang code  https://github.com/dotcloud/docker/tree/master/pkg ): http://crosbymichael.com/the-lost-packages-of-docker.html
* Assigning IP addresses to Docker containers via DHCP  (multi-host setup using OpenVswitch http://fbevmware.blogspot.com/2013/12/coupling-docker-and-open-vswitch.html ): http://goldmann.pl/blog/2014/01/30/assigning-ip-addresses-to-docker-containers-via-dhcp/
* Building docker images using yum -  Minimal Wildfly image (http://wildfly.org/): http://goldmann.pl/blog/2014/03/06/creating-a-minimal-wildfly-docker-image/
* Run Docker in Docker (start container with -v /var/run/docker.sock:/run/docker.sock): https://groups.google.com/forum/#!topic/docker-user/F7uoXWe6l1k
* Utility packages from Docker team  (golang code  https://github.com/dotcloud/docker/tree/master/pkg ): http://crosbymichael.com/the-lost-packages-of-docker.html
* Clean up docker devicemapper mounts  (grep docker /proc/*/mounts,  /var/lib/docker/devicemapper/devicemapper/json ) https://groups.google.com/forum/#!topic/docker-user/_sZPQ5iqJ_w
* ~jpetazzo/Resizing Docker containers with the Device Mapper plugin (2014-01-29): http://jpetazzo.github.io/2014/01/29/docker-device-mapper-resize/

