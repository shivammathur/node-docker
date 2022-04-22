# node-docker 
## `shivammathur/node` and `setupphp/node`

<a href="https://github.com/shivammathur/node-docker" title="Docker images to run setup-php GitHub Action"><img alt="Build status" src="https://github.com/shivammathur/node-docker/workflows/Build/badge.svg"></a>
<a href="https://github.com/shivammathur/node-docker/blob/main/LICENSE" title="license"><img alt="LICENSE" src="https://img.shields.io/badge/license-MIT-428f7e.svg"></a>

Docker images to run setup-php GitHub Action.

## Namespaces

- https://hub.docker.com/r/shivammathur/node
- https://hub.docker.com/r/setupphp/node (No rate limits)

## Platforms/OS Architecture

- `linux/amd64` or `amd64`
- `linux/386` or `i386`
- `linux/arm/v7` or `arm32v7`
- `linux/arm64` or `arm64v8`

## Image Variants/Tags

### `latest`

- Ubuntu 20.04 (focal), Ubuntu 18.04 (bionic) on i386
- PHP 5.6 to PHP 8.1
- Node.js 16.14.2
- Yarn 1.22.18

### `jammy`, `2204`

- Ubuntu 22.04 (jammy)
- PHP 5.6 to PHP 8.1
- Node.js 16.14.2
- Yarn 1.22.18

### `focal`, `2004`

- Ubuntu 20.04 (focal)
- PHP 5.6 to PHP 8.1
- Node.js 16.14.2
- Yarn 1.22.18

### `bionic`, `1804`

- Ubuntu 18.04 (bionic)
- PHP 5.6 to PHP 8.1
- Node.js 16.14.2
- Yarn 1.22.18

### `latest-slim`

- Ubuntu 20.04 (focal), Ubuntu 18.04 (bionic) on i386
- Node.js 16.14.2
- Yarn 1.22.18

### `jammy-slim`, `2204-slim`

- Ubuntu 22.04 (jammy)
- Node.js 16.14.2
- Yarn 1.22.18

### `focal-slim`, `2004-slim`

- Ubuntu 20.04 (focal)
- Node.js 16.14.2
- Yarn 1.22.18

### `bionic-slim`, `1804-slim`

- Ubuntu 18.04 (bionic)
- Node.js 16.14.2
- Yarn 1.22.18

## Platform/OS Architecture specific tags

- Suffix `amd64`, `i386`, `arm32v7` `arm64v8` to above image variants to get image for specific OS architecture.
For example `shivammathur/node:bionic-arm64v8`, `setupphp/node:bionic-arm64v8`

- `i386` is not available for Ubuntu 20.04 (focal) and newer.
- `i386` latest and latest-slim images are based on Ubuntu 18.04 (bionic).

## License

The code in this project is licensed under the [MIT license](http://choosealicense.com/licenses/mit/).
Please see the [license file](LICENSE) for more information.

## Dependencies
- [Node.js docker](https://github.com/nodejs/docker-node/blob/master/LICENSE)
- [Node.js and related software](https://github.com/nodejs/node/blob/master/LICENSE)
- [PHP](https://github.com/php/php-src/blob/master/LICENSE)
- [Xdebug](https://github.com/xdebug/xdebug/blob/master/LICENSE)
- [Yarn](https://github.com/yarnpkg/yarn/blob/master/LICENSE)
