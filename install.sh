#!/usr/bin/env bash

set -ex

BATS_ROOT="${0%/*}"
PREFIX="$1"

if [[ -z "$PREFIX" ]]; then
  printf '%s\n' \
    "usage: $0 <prefix>" \
    "  e.g. $0 /usr/local" >&2
  exit 1
fi

# directory setup
install -d -m 755 "$PREFIX"/bin
install -d -m 755 "$PREFIX"/libexec/bats-core
install -d -m 755 "$PREFIX"/share/man/man1
install -d -m 755 "$PREFIX"/share/man/man7

# installs
install -m 755 "$BATS_ROOT/bin"/* "$PREFIX/bin"
install -m 755 "$BATS_ROOT/libexec/bats-core"/* "$PREFIX/libexec/bats-core"
install -m 644 "$BATS_ROOT/man/bats.1" "$PREFIX/share/man/man1"
install -m 644 "$BATS_ROOT/man/bats.7" "$PREFIX/share/man/man7"

echo "Installed Bats to $PREFIX/bin/bats"
