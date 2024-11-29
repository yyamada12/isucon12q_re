#!/bin/bash

set -eux

cp -r /home/isucon/initial_data /home/isucon/initial_data.bak

for f in $(ls /home/isucon/initial_data); do
  sqlite3 /home/isucon/initial_data/$f < /home/isucon/reduce_player_score.sql
done
