[![Build Status](https://travis-ci.com/Antartical/shadowfax.svg?branch=master)](https://travis-ci.com/Antartical/shadowfax)
[![Coverage Status](https://coveralls.io/repos/github/Antartical/shadowfax/badge.svg)](https://coveralls.io/github/Antartical/shadowfax)


<p align="center">
  <img width="200" height="250" src="https://i.imgur.com/lbeRTwF.png">
</p>

## Shadowfax in a nutshell

Shadowfax, the horse of gandalf, is the only one who can request gandalf if the user can pass or not. He also will redirects you to your
own site with the access token.

## Local development

Shadowfax is easy to develop in a local environment by using docker. just type in your terminal `make`
and everything you need will make up by itselt. Please copy the content of `build/env/.env.sample` to
your own _.env_ in `build/env/.env`. You can do this by executting:

```cmd
cp ./build/env/.env.sample ./build/env/.env
```

Moreover you can perform the following operations:

- **make**: setting up the containers
- **make sh**: attach a console inside shadowfax.
- **make logs**: show shadowfax logs
- **make local.build**: recompiles shadowfax image