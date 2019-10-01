# Private NPM registry based on Verdaccio

The NPM registry is based on Verdaccio running in a docker container.
It is intended for the "Docker" droplet from DigitalOcean Marketplace.

## Why

Some NPM packages that we develop should not be published to the public NPM registory.
Most of our code is developed inside a monorepo.
Some CLI packages need to be installed on multiple machines without checking
out the whole monorepo.

## Prepare and run

```sh
# clone the repository somewhere on the server e.g. /root
git clone https://github.com/vsimko/digitalocean-droplet-verdaccio.git
cd digitalocean-droplet-verdaccio

# Create at least one user
conf/add-repo-user.sh

# Start the container
$ docker-compose up -d
# the "restart" policy ensures that the containers start automaticlly
# see the docker-compose.yml file
```

## How to publish packages
```sh
cd /path/to/your/package
yarn publish --registry https://yourdomain
```
