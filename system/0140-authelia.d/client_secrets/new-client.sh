#!/usr/bin/env bash
set -euo pipefail

SECRET_DATA=$(docker run --rm ghcr.io/authelia/authelia:4.39 authelia crypto hash generate pbkdf2 --variant sha512 --random --random.length 72 --random.charset rfc3986)

SECRET=$(echo $SECRET_DATA | cut -d' ' -f3)
SECRET_HASH=$(echo $SECRET_DATA | cut -d' ' -f5)

echo $SECRET
echo $SECRET_HASH
