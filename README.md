OpenStackID development version
===============================

OpenStackID is a Laravel framework based application, and provides OpenID
and Oauth2 services for third party applications.

Launching the development VM
----------------------------

OpenStackID requires a standard LAMP environment with SSL support.

1. Install [vagrant](https://www.vagrantup.com/)
2. Install [VirtualBox](https://www.virtualbox.org/)
3. Run vagrant up in the vagrant-openstackid root directory.

The puppet scripts will deploy the application under /srv/openstackid and
configuration files will be available under /etc/openstackid directory.

The vagrant forwards the servers 443 into your host's 8443, so you can easily
access the website at http://localhost:8443. The application log files
can be found at /srv/openstackid/app/storage/logs.

Server configuration steps
--------------------------

### Set server resources ###

Login with your openstackid account with oauth2 admin privileges.

Go to Server Administration/Resource Servers, and edit openstackid server:
- host: <server domain> (defaults to localhost)
- friendly name: openstack id server

### Enable oauth2 for third-party application ###

Go to OAUTH2 Console/OAUTH2 Applications and register a new application with
following settings:
- application name: testapp
- application web site url: https://<site-url>
- application type: Web Server Application
- redirection uris: https://<site-url>/oauth2
- enable application allowed scopes: profile, email
