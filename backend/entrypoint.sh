#!/bin/bash
set -e

rm -f /poke_app/backend/tmp/pids/server.pid

exec "$@"