FROM ubuntu:bionic
MAINTAINER Shivam Mathur "shivam_jpr@hotmail.com"
ARG type
ENV NODE_VERSION 12.18.4
ENV NODE_VERSION_x86 12.16.3
ENV YARN_VERSION 1.22.4
ENV RUNNER_TOOL_PATH "/opt/hostedtoolcache"
ENV RUNNER_TOOL_CACHE "/opt/hostedtoolcache"
ENV runner "self-hosted"

RUN ARCH= && PREFIX='www' && URLPATH='dist' && dpkgArch="$(dpkg --print-architecture)" \
  && case "${dpkgArch##*-}" in \
    amd64) ARCH='x64';; \
    ppc64el) ARCH='ppc64le';; \
    s390x) ARCH='s390x';; \
    arm64) ARCH='arm64';; \
    armhf) ARCH='armv7l';; \
    i386) ARCH='x86'; PREFIX='unofficial-builds'; URLPATH='download/release'; NODE_VERSION=$NODE_VERSION_x86;; \
    *) echo "unsupported architecture"; exit 1 ;; \
  esac \
  && set -ex \
  # libatomic1 for arm
  && apt-get update && apt-get install -y ca-certificates curl wget gnupg dirmngr xz-utils libatomic1 --no-install-recommends \
  && rm -rf /var/lib/apt/lists/* \
  && mkdir -p ~/.gnupg && echo "disable-ipv6" >> ~/.gnupg/dirmngr.conf \
  && for key in \
    4ED778F539E3634C779C87C6D7062848A1AB005C \
    94AE36675C464D64BAFA68DD7434390BDBE9B9C5 \
    71DCFD284A79C3B38668286BC97EC7A07EDE3FC1 \
    8FCCA13FEF1D0C2E91008E09770F7A9A5AE15600 \
    C4F0DFFF4E8C1A8236409D08E73BC641CC11F4C8 \
    C82FA3AE1CBEDC6BE46B9360C43CEC45C17AB93C \
    DD8F2338BAE7501E3DD5AC78C273792F7D83545D \
    A48C2BEE680E841632CD4E44F07496B3EB3C1762 \
    108F52B48DB57BB0CC439B2997B01419BD92F80A \
    B9E2F5981AA6E0CD28160D9FF13993A75599653C \
  ; do \
    gpg --batch --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys "$key" || \
    gpg --batch --keyserver hkp://ipv4.pool.sks-keyservers.net --recv-keys "$key" || \
    gpg --batch --keyserver hkp://pgp.mit.edu:80 --recv-keys "$key" ; \
  done \
  && curl -fsSLO --compressed "https://$PREFIX.nodejs.org/$URLPATH/v$NODE_VERSION/node-v$NODE_VERSION-linux-$ARCH.tar.xz" \
  && if [ ! "$ARCH" = 'x86' ]; then curl -fsSLO --compressed "https://nodejs.org/dist/v$NODE_VERSION/SHASUMS256.txt.asc"; gpg --batch --decrypt --output SHASUMS256.txt SHASUMS256.txt.asc; grep " node-v$NODE_VERSION-linux-$ARCH.tar.xz\$" SHASUMS256.txt | sha256sum -c -; fi \
  && tar -xJf "node-v$NODE_VERSION-linux-$ARCH.tar.xz" -C /usr/local --strip-components=1 --no-same-owner \
  && rm -rf "node-v$NODE_VERSION-linux-$ARCH.tar.xz" SHASUMS256.txt.asc SHASUMS256.txt || true \
  && rm -rf ~/.gnupg \
  && apt-mark auto '.*' > /dev/null \
  && find /usr/local -type f -executable -exec ldd '{}' ';' \
    | awk '/=>/ { print $(NF-1) }' \
    | sort -u \
    | xargs -r dpkg-query --search \
    | cut -d: -f1 \
    | sort -u \
    | xargs -r apt-mark manual \
  && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
  && ln -s /usr/local/bin/node /usr/local/bin/nodejs \
  # smoke tests
  && node --version \
  && npm --version

RUN set -ex \
  && savedAptMark="$(apt-mark showmanual)" \
  && apt-get update && apt-get install -y ca-certificates sudo make curl wget gnupg dirmngr xz-utils libatomic1 --no-install-recommends \
  && rm -rf /var/lib/apt/lists/* \
  && mkdir -p ~/.gnupg && echo "disable-ipv6" >> ~/.gnupg/dirmngr.conf \
  && for key in \
    6A010C5166006599AA17F08146C2130DFD2497F5 \
  ; do \
    gpg --batch --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys "$key" || \
    gpg --batch --keyserver hkp://ipv4.pool.sks-keyservers.net --recv-keys "$key" || \
    gpg --batch --keyserver hkp://pgp.mit.edu:80 --recv-keys "$key" ; \
  done \
  && curl -fsSLO --compressed "https://yarnpkg.com/downloads/$YARN_VERSION/yarn-v$YARN_VERSION.tar.gz" \
  && curl -fsSLO --compressed "https://yarnpkg.com/downloads/$YARN_VERSION/yarn-v$YARN_VERSION.tar.gz.asc" \
  && gpg --batch --verify yarn-v$YARN_VERSION.tar.gz.asc yarn-v$YARN_VERSION.tar.gz \
  && mkdir -p -m 777 /opt /opt/hostedtoolcache \
  && tar -xzf yarn-v$YARN_VERSION.tar.gz -C /opt/ \
  && ln -s /opt/yarn-v$YARN_VERSION/bin/yarn /usr/local/bin/yarn \
  && ln -s /opt/yarn-v$YARN_VERSION/bin/yarnpkg /usr/local/bin/yarnpkg \
  && rm yarn-v$YARN_VERSION.tar.gz.asc yarn-v$YARN_VERSION.tar.gz \
  && rm -rf ~/.gnupg \
  && apt-mark auto '.*' > /dev/null \
  && apt-mark manual sudo make \
  && { [ -z "$savedAptMark" ] || apt-mark manual $savedAptMark > /dev/null; } \
  && find /usr/local -type f -executable -exec ldd '{}' ';' \
    | awk '/=>/ { print $(NF-1) }' \
    | sort -u \
    | xargs -r dpkg-query --search \
    | cut -d: -f1 \
    | sort -u \
    | xargs -r apt-mark manual \
  && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
  # smoke test
  && yarn --version

RUN if [ "$type" = "full" ]; then set -ex \
      && savedAptMark="$(apt-mark showmanual)" \
      && apt-mark auto '.*' > /dev/null \
      && apt-get update && apt-get install -y curl lsb-release software-properties-common unzip --no-install-recommends \
      && LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php && apt-get update \
      && for v in 5.6 7.0 7.1 7.2 7.3 7.4; do \
           DEBIAN_FRONTEND=noninteractive apt-get install -y php"$v" \
           php"$v"-dev \
           php"$v"-curl \
           php"$v"-mbstring \
           php"$v"-xml \
           php"$v"-intl \
           php"$v"-mysql \
           php"$v"-pgsql \
           php"$v"-zip \
           php-xdebug; \
         done \
      && rm -rf /var/lib/apt/lists/* \
      && { [ -z "$savedAptMark" ] || apt-mark manual $savedAptMark > /dev/null; } \
      && find /usr/local -type f -executable -exec ldd '{}' ';' \
        | awk '/=>/ { print $(NF-1) }' \
        | sort -u \
        | xargs -r dpkg-query --search \
        | cut -d: -f1 \
        | sort -u \
        | xargs -r apt-mark manual \
      && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
      # smoke test
      && php5.6 -v \
      && php7.0 -v \
      && php7.1 -v \
      && php7.2 -v \
      && php7.3 -v \
      && php7.4 -v; \
    fi

CMD [ "/bin/bash" ]