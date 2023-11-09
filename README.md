# portal

A platform for a Raspbian-based home portal

## Networking

This is designed to set up a Raspberry Pi or similar to handle incoming 
traffic from the internet, securely, and to provide a host-based forwarding
and security setup. Basically, it allows LetsEncrypt to issue certificates
against domains, and then a host-based reverse proxying system to forward those off
to other systems locally. Put simply, it allows us to expose enough to enable
SSL and manage SSL termination. 

In the long run, this will probably field a wired network directly from the
router with better performance.

We may also allow `rsync` and similar to proxy through, securely, in effect
enabling the whole of our NAS to be accessed externally. 
