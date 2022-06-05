=================
VPN docker client
=================

To ssh through vpn while listening to YouTube music uninterrupted.

Based on `dperson/openvpn-client <https://hub.docker.com/r/dperson/openvpn-client>`_ docker image.

-----
Setup
-----

1. Create a file ``vpn.auth`` containing your vpn username and password (Check ``vpn.auth.sample`` for reference)

2. Run ``./build.sh``

Now the docker image ``vpnssh`` is ready to go!

------------------
Aliases for sshing
------------------

There are some aliases in ``vpn_docker_aliases`` to make it easier to ssh using the docker. 
Source it in your ``.[shell]rc`` if you want them readily available.

Start the docker
++++++++++++++++

The function ``start_vpn_docker`` can be used for this. I added a shared directory (``$HOME/shared``) so that I 
can ``scp`` from / to the docker and have the files available in the host. Remove all lines containing ``SHARED_DIR`` 
if you do not want this.

This function will mount your ``~/.ssh`` directory inside the docker making all your ssh configs available inside
the docker for user ``$USER``.

SSH using the docker
++++++++++++++++++++

Use function ``dssh`` just like you would use ``ssh``.

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
