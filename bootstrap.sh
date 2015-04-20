#!/usr/bin/env bash

apt-get update
apt-get install -y python-dev libpq-dev postgresql-9.1 python-pip
sleep 10
pip install virtualenv virtualenvwrapper
sleep 10



sudo -u postgres psql -c "CREATE ROLE django_user NOSUPERUSER INHERIT LOGIN"
sudo -u postgres psql -c "ALTER ROLE django_user PASSWORD '123'"
sudo -u postgres psql -c "CREATE DATABASE django_data OWNER django_user"


export WORKON_HOME=/vagrant/.virtualenvs
export PROJECT_HOME=/vagrant/src
source /usr/local/bin/virtualenvwrapper.sh

wait

mkvirtualenv django17
wait

pip install django==1.7
wait
pip install psycopg2
wait

echo "export WORKON_HOME=/vagrant/.virtualenvs" >> /home/vagrant/.bashrc
echo "export PROJECT_HOME=/vagrant/src" >> /home/vagrant/.bashrc
echo "source /usr/local/bin/virtualenvwrapper.sh" >> /home/vagrant/.bashrc
echo "cd /vagrant/src/django17" >> /home/vagrant/.bashrc





