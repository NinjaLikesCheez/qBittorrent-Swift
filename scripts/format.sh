#!/usr/bin/env bash
set -eu

cd "$(dirname "$(realpath "$0")")/../"
tools/swiftformat.sh Package.swift Sources Tests "$@"
