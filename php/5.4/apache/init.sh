#!/usr/bin/env bash

mailcatcher --http-ip 0.0.0.0 >/dev/null 2>&1

exec "$@"
