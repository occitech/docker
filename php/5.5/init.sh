#!/usr/bin/env bash

mailcatcher --http-ip 0.0.0.0

exec $@
