#!/usr/bin/bash
mkdir -p volumes/data
diesel migration run --database-url volumes/data/map.db --migration-dir ./server/migrations
sqlite3 volumes/data/map.db < data/data.sql