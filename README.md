# Promonode NPM registry based on Verdaccio

The NPM registry is based on Verdaccio running in a docker container.
It is intended for the "Docker" droplet from DigitalOcean Marketplace.
The git repo should be cloned to e.g. `/etc/promonode`

## Why

Some NPM packages that we develop at Promonode should not be published to the public NPM registory.
Most of our code is developed inside a monorepo.
Some CLI packages (e.g. `promonode-cli`) need to be installed on multiple machines without checking
out the whole monorepo.

Contains:
- **conf:** Configuration file and a small script to create users in `httpasswd`

## Prepare
```sh
# Create at least one user
conf/add-repo-user.sh
```

## How to start the NPM registry
```sh
$ docker-compose up -d # now visit https://npm.promonode.com
# the "restart" policy ensures that the containers start automaticlly
# see the docker-compose.yml file
```

## How to publish packages
```sh
cd /path/to/your/package
yarn publish --registry https://npm.promonode.com
```