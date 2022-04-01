# Compilation de mediainfo

Ce projet regroupe des scripts de compilation de mediainfo pour plusieurs plateformes mais avec MacOS comme système hôte.

## MacOS

Prérequis:

* homebrew: https://brew.sh/index_fr

```
./run-macos.sh
```

le binaire est dans `bin/mediainfo-macos`

## Debian 11

Compilation via un conteneur Docker qui sera effacé à la fin du processus.

```
docker run --rm --mount type=bind,source=$(pwd),target=/app -w /app -it debian:11 ./run-debian.sh
```

le binaire est dans `bin/mediainfo-debian` de la machine hôte.

## CentOS 7

Compilation via un conteneur Docker qui sera effacé à la fin du processus.

```
docker run --rm --mount type=bind,source=$(pwd),target=/app -w /app -it centos:centos7 ./run-centos.sh
```

le binaire est dans `bin/mediainfo-centos`
