#!/bin/bash

echo "Provisioning virtual machine..."

echo "Installing postgresql"
	sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'
	wget -q https://www.postgresql.org/media/keys/ACCC4CF8.asc -O - | sudo apt-key add -
	
	sudo apt-get update
	sudo apt-get -y install postgresql postgresql-contrib
	
	sudo su - postgres
	sudo -u postgres createuser -s $(whoami); createdb $(whoami)
	psql