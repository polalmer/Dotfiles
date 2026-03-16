#!/usr/bin/env bash
set -e

cd "$(dirname "$0")"

mkdir -p ~/.config
stow shell git nvim
