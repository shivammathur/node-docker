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

- Ubuntu 24.04 (noble), Debian 12 (bookworm) on i386
- PHP 5.6 to PHP 8.4
- Node.js 22.19.0, 16.20.2 (x86)
- Yarn 1.22.19

### `bookworm`, `12`

- Debian 12 (bookworm)
- PHP 5.6 to PHP 8.4
- Node.js 22.19.0, 16.20.2 (x86)
- Yarn 1.22.19

### `bullseye`, `11`

- Debian 11 (bullseye)
- PHP 5.6 to PHP 8.4
- Node.js 22.19.0, 16.20.2 (x86)
- Yarn 1.22.19

### `noble`, `2404`

- Ubuntu 22.04 (noble)
- PHP 5.6 to PHP 8.4
- Node.js 22.19.0
- Yarn 1.22.19

### `jammy`, `2204`

- Ubuntu 22.04 (jammy)
- PHP 5.6 to PHP 8.4
- Node.js 22.19.0
- Yarn 1.22.19

### `latest-slim`

- Ubuntu 24.04 (jammy)), Debian 12 (bookworm) on i386
- Node.js 22.19.0, 16.20.2 (x86)
- Yarn 1.22.19

### `noble-slim`, `2404-slim`

- Ubuntu 24.04 (jammy)
- Node.js 22.19.0
- Yarn 1.22.19

### `jammy-slim`, `2204-slim`

- Ubuntu 22.04 (jammy)
- Node.js 22.19.0
- Yarn 1.22.19

## Platform/OS Architecture specific tags

- Suffix `amd64`, `i386`, `arm32v7` `arm64v8` to above image variants to get image for specific OS architecture.
For example `shivammathur/node:noble-arm64v8`, `setupphp/node:noble-arm64v8`

- `i386` is only available for Debian images.
- `i386` builds are limited to Node.js 16.x, newer versions won't be added for this architecture.

## License

The code in this project is licensed under the [MIT license](http://choosealicense.com/licenses/mit/).
Please see the [license file](LICENSE) for more information.

## Dependencies
- [Node.js docker](https://github.com/nodejs/docker-node/blob/master/LICENSE)
- [Node.js and related software](https://github.com/nodejs/node/blob/master/LICENSE)
- [PHP](https://github.com/php/php-src/blob/master/LICENSE)
- [Xdebug](https://github.com/xdebug/xdebug/blob/master/LICENSE)
- [Yarn](https://github.com/yarnpkg/yarn/blob/master/LICENSE)
