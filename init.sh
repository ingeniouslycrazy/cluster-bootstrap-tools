#!/usr/bin/env bash

if [ ! -e ./export/.envclt ]; then cat .env.example > ./export/.cltenv; fi