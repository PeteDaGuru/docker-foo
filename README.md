docker-foo
=========

Some useful Docker scripts and tips, perhaps growing into a framework eventually.

 * dev-start.sh : A script to that takes an image with sshd installed, and configures ssh with
the user's  current key so ssh -X works. No systemd / init needs to be run in the container.
  Note that it has a few tricks for my Fedora 20 dev image (like allowing the  container to access host MongoDB)

 * [docker-links-pete.md] is a smattering of links that may have something to do with Docker and containers that may be interesting.

