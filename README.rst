=================
VPN docker client
=================

To ssh through vpn while listening to YouTube music uninterrupted. (using a ``.ovpn`` file)

Based on `dperson/openvpn-client <https://hub.docker.com/r/dperson/openvpn-client>`_ docker image.

-----
Setup
-----

Using an ``.ovpn`` file
+++++++++++++++++++++++

1. Create a file ``vpn.auth`` containing your vpn username and password (Check ``vpn.auth.sample`` for reference)

2. 2. Run ``./build.sh <XXX.ovpn>``

Now the docker image ``vpnssh`` is ready to go!

-----
Usage
-----

1. Source ``vpn_docker_aliases``

2. ``vpn_docker start`` to start the container running

3. To ssh, you can ``vpn_docker ssh MySSHConfig.vpn`` to ssh into *MySSHConfig* (A config in ``~/.ssh/config``) 
   (Or you can just specify the IP)

4. It is a tiny lightweight docker. But you can do ``vpn_docker stop`` if you do not like it to keep running after 
   you use it.

-----
TL;DR
-----

Aliases for sshing
++++++++++++++++++

There are some aliases in ``vpn_docker_aliases`` to make it easier to ssh using the docker. 
Source it in your ``.[shell]rc`` if you want them readily available.

vpn_docker
----------

The function ``vpn_docker`` can be used to start, stop or ssh using the created docker. I added a shared directory 
(``$HOME/shared``) so that I can ``scp`` from / to the docker and have the files available in the host. Remove all 
lines containing ``SHARED_DIR`` if you do not want this.

-------------------------------------
Running the docker for other purposes
-------------------------------------

The created docker is build with a user with your name. To start the docker for the first time,

.. code-block:: sh

    docker run -it -d --cap-add=NET_ADMIN --device /dev/net/tun --name vpn vpnssh
    docker restart vpn

To go into the docker, 

.. code-block:: sh

    docker exec -it --user "$USER" vpn /bin/bash

Check the `original vpn docker client repo <https://github.com/dperson/openvpn-client>`_ for more info. Cheers!

----
TODO
----

* ``dssh`` autocomplete
