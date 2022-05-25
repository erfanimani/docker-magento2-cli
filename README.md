# Docker Magento2 CLI

A simple Docker image for running Magento 2 CLI commands on CI/CD only — don't use for production.

Link to Docker Hub: [hub.docker.com/r/erfanimani/magento2-cli](https://hub.docker.com/r/erfanimani/magento2-cli).

## Build instructions

    docker build . -t erfanimani/magento2-cli:{version} -t erfanimani/magento2-cli:latest

    docker push erfanimani/magento2-cli:{version}
    docker push erfanimani/magento2-cli:latest

## Todo

* Switch base image to Alpine
* Add PHP 8.1 for Magento 2.4.4

## Changelog

7.4-4: Updated PHP to 7.4.29.

7.4-3: Updated Composer version to 2.1.5, to work with the new Github token format.

7.4-2: Updated Composer version to 2.

7.4-1: Increased PHP version to 7.4. Pegged Composer version to 1.

7.3-1: Increased PHP version to 7.3.

7.2-3: Release 7.2.-3: Installed rsync, required for deployphp/deployer.

7.2-2: Release 7.2.-2: Added ext-sockets to PHP, necessary for php-amqplib.

7.2-1: Increased PHP version to 7.2.

7.1-1: Increased PHP version to 7.1.

7.0-2: Increased PHP memory limit to 1G.

7.0-1: Initial commit; PHP 7.0.
