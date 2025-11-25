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
- PHP 5.6 to PHP 8.5
- Node.js 24.11.1, 22.21.1 (armv7l), 16.20.2 (x86)
- Yarn 1.22.22

### `trixie`, `13`

- Debian 13 (trixie)
- PHP 5.6 to PHP 8.5
- Node.js 24.11.1, 22.21.1 (armv7l), 16.20.2 (x86)
- Yarn 1.22.22

### `bookworm`, `12`

- Debian 12 (bookworm)
- PHP 5.6 to PHP 8.5
- Node.js 24.11.1, 22.21.1 (armv7l), 16.20.2 (x86)
- Yarn 1.22.22

### `bullseye`, `11`

- Debian 11 (bullseye)
- PHP 5.6 to PHP 8.5
- Node.js 24.11.1, 22.21.1 (armv7l), 16.20.2 (x86)
- Yarn 1.22.22

### `noble`, `2404`

- Ubuntu 22.04 (noble)
- PHP 5.6 to PHP 8.5
- Node.js 24.11.1, 22.21.1 (armv7l)
- Yarn 1.22.22

### `jammy`, `2204`

- Ubuntu 22.04 (jammy)
- PHP 5.6 to PHP 8.5
- Node.js 24.11.1, 22.21.1 (armv7l)
- Yarn 1.22.22

### `latest-slim`

- Ubuntu 24.04 (jammy)), Debian 12 (bookworm) on i386
- Node.js 24.11.1, 22.21.1 (armv7l), 16.20.2 (x86)
- Yarn 1.22.22

### `trixie-slim`, `13-slim`

- Debian 13 (trixie)
- Node.js 24.11.1, 22.21.1 (armv7l), 16.20.2 (x86)
- Yarn 1.22.22

### `noble-slim`, `2404-slim`

- Ubuntu 24.04 (jammy)
- Node.js 24.11.1, 22.21.1 (armv7l)
- Yarn 1.22.22

### `jammy-slim`, `2204-slim`

- Ubuntu 22.04 (jammy)
- Node.js 24.11.1, 22.21.1 (armv7l)
- Yarn 1.22.22

### PHP version specific tags

These tags install a single PHP release while keeping the same Node.js (24.11.0, 22.21.1 for armv7l, 16.20.2 for x86) and Yarn (1.22.19) versions listed above.

#### PHP 8.5
  - Ubuntu 24.04: `php-8.5-noble`, `php-8.5-24.04`
  - Ubuntu 22.04: `php-8.5-jammy`, `php-8.5-22.04`
  - Debian 13: `php-8.5-trixie`, `php-8.5-13`
  - Debian 12: `php-8.5-bookworm`, `php-8.5-12`
  - Debian 11: `php-8.5-bullseye`, `php-8.5-11`

#### PHP 8.4
  - Ubuntu 24.04: `php-8.4-noble`, `php-8.4-24.04`
  - Ubuntu 22.04: `php-8.4-jammy`, `php-8.4-22.04`
  - Debian 13: `php-8.4-trixie`, `php-8.4-13`
  - Debian 12: `php-8.4-bookworm`, `php-8.4-12` 
  - Debian 11: `php-8.4-bullseye`, `php-8.4-11`

#### PHP 8.3
  - Ubuntu 24.04: `php-8.3-noble`, `php-8.3-24.04`
  - Ubuntu 22.04: `php-8.3-jammy`, `php-8.3-22.04`
  - Debian 13: `php-8.3-trixie`, `php-8.3-13`
  - Debian 12: `php-8.3-bookworm`, `php-8.3-12`
  - Debian 11: `php-8.3-bullseye`, `php-8.3-11`

#### PHP 8.2
  - Ubuntu 24.04: `php-8.2-noble`, `php-8.2-24.04`
  - Ubuntu 22.04: `php-8.2-jammy`, `php-8.2-22.04`
  - Debian 13: `php-8.2-trixie`, `php-8.2-13`
  - Debian 12: `php-8.2-bookworm`, `php-8.2-12`
  - Debian 11: `php-8.2-bullseye`, `php-8.2-11`

#### PHP 8.1
  - Ubuntu 24.04: `php-8.1-noble`, `php-8.1-24.04`
  - Ubuntu 22.04: `php-8.1-jammy`, `php-8.1-22.04`
  - Debian 13: `php-8.1-trixie`, `php-8.1-13`
  - Debian 12: `php-8.1-bookworm`, `php-8.1-12`
  - Debian 11: `php-8.1-bullseye`, `php-8.1-11`

#### PHP 8.0
  - Ubuntu 24.04: `php-8.0-noble`, `php-8.0-24.04`
  - Ubuntu 22.04: `php-8.0-jammy`, `php-8.0-22.04`
  - Debian 13: `php-8.0-trixie`, `php-8.0-13`
  - Debian 12: `php-8.0-bookworm`, `php-8.0-12`
  - Debian 11: `php-8.0-bullseye`, `php-8.0-11`

#### PHP 7.4
  - Ubuntu 24.04: `php-7.4-noble`, `php-7.4-24.04`
  - Ubuntu 22.04: `php-7.4-jammy`, `php-7.4-22.04`
  - Debian 13: `php-7.4-trixie`, `php-7.4-13`
  - Debian 12: `php-7.4-bookworm`, `php-7.4-12`
  - Debian 11: `php-7.4-bullseye`, `php-7.4-11`

#### PHP 7.3
  - Ubuntu 24.04: `php-7.3-noble`, `php-7.3-24.04`
  - Ubuntu 22.04: `php-7.3-jammy`, `php-7.3-22.04`
  - Debian 13: `php-7.3-trixie`, `php-7.3-13`
  - Debian 12: `php-7.3-bookworm`, `php-7.3-12`
  - Debian 11: `php-7.3-bullseye`, `php-7.3-11`

#### PHP 7.2
  - Ubuntu 24.04: `php-7.2-noble`, `php-7.2-24.04`
  - Ubuntu 22.04: `php-7.2-jammy`, `php-7.2-22.04`
  - Debian 13: `php-7.2-trixie`, `php-7.2-13`
  - Debian 12: `php-7.2-bookworm`, `php-7.2-12`
  - Debian 11: `php-7.2-bullseye`, `php-7.2-11`

#### PHP 7.1
  - Ubuntu 24.04: `php-7.1-noble`, `php-7.1-24.04`
  - Ubuntu 22.04: `php-7.1-jammy`, `php-7.1-22.04`
  - Debian 13: `php-7.1-trixie`, `php-7.1-13`
  - Debian 12: `php-7.1-bookworm`, `php-7.1-12`
  - Debian 11: `php-7.1-bullseye`, `php-7.1-11`

#### PHP 7.0
  - Ubuntu 24.04: `php-7.0-noble`, `php-7.0-24.04`
  - Ubuntu 22.04: `php-7.0-jammy`, `php-7.0-22.04`
  - Debian 13: `php-7.0-trixie`, `php-7.0-13`
  - Debian 12: `php-7.0-bookworm`, `php-7.0-12`
  - Debian 11: `php-7.0-bullseye`, `php-7.0-11`

#### PHP 5.6
  - Ubuntu 24.04: `php-5.6-noble`, `php-5.6-24.04`
  - Ubuntu 22.04: `php-5.6-jammy`, `php-5.6-22.04`
  - Debian 13: `php-5.6-trixie`, `php-5.6-13`
  - Debian 12: `php-5.6-bookworm`, `php-5.6-12`
  - Debian 11: `php-5.6-bullseye`, `php-5.6-11`

## Platform/OS Architecture specific tags

- Suffix `amd64`, `i386`, `arm32v7` `arm64v8` to above image variants to get image for specific OS architecture.
For example `shivammathur/node:noble-arm64v8`, `setupphp/node:noble-arm64v8`

- `i386` is only available for Debian images.
- `i386` builds are limited to Node.js 16.x, newer versions won't be added for this architecture.
- `arm32v7` builds are limited to Node.js 22.x, newer major versions won't be added for this architecture.

## Build Arguments

- `type`: `full` (default) or `slim` to control the feature set.
- `PHP_VERSION`: defaults to `all`; set to a specific version like `7.4` to build an image containing only that PHP release.

## License

The code in this project is licensed under the [MIT license](http://choosealicense.com/licenses/mit/).
Please see the [license file](LICENSE) for more information.

## Dependencies
- [Node.js docker](https://github.com/nodejs/docker-node/blob/master/LICENSE)
- [Node.js and related software](https://github.com/nodejs/node/blob/master/LICENSE)
- [PHP](https://github.com/php/php-src/blob/master/LICENSE)
- [Xdebug](https://github.com/xdebug/xdebug/blob/master/LICENSE)
- [Yarn](https://github.com/yarnpkg/yarn/blob/master/LICENSE)
