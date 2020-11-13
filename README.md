# node-docker (shivammathur/node)

<a href="https://github.com/shivammathur/node-docker" title="Docker images to run setup-php GitHub Action"><img alt="Build status" src="https://github.com/shivammathur/node-docker/workflows/Build/badge.svg"></a>
<a href="https://github.com/shivammathur/node-docker/blob/master/LICENSE" title="license"><img alt="LICENSE" src="https://img.shields.io/badge/license-MIT-428f7e.svg"></a>

Docker images to run setup-php GitHub Action.
https://hub.docker.com/r/shivammathur/node

## Platforms/OS Architecture

- `linux/amd64` or `amd64`
- `linux/386` or `i386`
- `linux/arm/v7` or `arm32v7`
- `linux/arm64` or `arm64v8`

## Image Variants/Tags

### `focal`, `2004`

- Ubuntu 20.04 (focal)
- PHP 5.6 to PHP 7.4
- Node.js 14.15.0, 12.16.3 on x86
- Yarn 1.22.5

### `latest`, `bionic`, `1804`

- Ubuntu 18.04 (bionic)
- PHP 5.6 to PHP 7.4
- Node.js 14.15.0, 12.16.3 on x86
- Yarn 1.22.5

### `xenial`, `1604`

- Ubuntu 16.04 (xenial)
- PHP 5.6 to PHP 7.4
- Node.js 14.15.0, 12.16.3 on x86
- Yarn 1.22.5

### `focal-slim`, `2004-slim`

- Ubuntu 20.04 (focal)
- Node.js 14.15.0, 12.16.3 on x86
- Yarn 1.22.5

### `latest-slim`, `bionic-slim`, `1804-slim`

- Ubuntu 18.04 (bionic)
- Node.js 14.15.0, 12.16.3 on x86
- Yarn 1.22.5

### `xenial-slim`, `1604-slim`

- Ubuntu 16.04 (xenial)
- Node.js 14.15.0, 12.16.3 on x86
- Yarn 1.22.5

## Platform/OS Architecture specific tags

- Suffix `amd64`, `i386`, `arm32v7` `arm64v8` to above image variants to get image for specific OS architecture.
- `i386` is not available for focal based images, namely `focal`, `20.04`, `focal-slim` and `20.04-slim`.

For example `shivammathur/node:bionic-arm64v8`.


## License

The code in this project is licensed under the [MIT license](http://choosealicense.com/licenses/mit/).
Please see the [license file](LICENSE) for more information.

## Dependencies
- [Node.js docker](https://github.com/nodejs/docker-node/blob/master/LICENSE)
- [Node.js and related software](https://github.com/nodejs/node/blob/master/LICENSE)
- [PHP](https://github.com/php/php-src/blob/master/LICENSE)
- [Xdebug](https://github.com/xdebug/xdebug/blob/master/LICENSE)