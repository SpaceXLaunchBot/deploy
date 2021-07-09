#!/usr/bin/env bash
set -e

# SQL is from db directory.
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE TYPE notification AS ENUM ('all', 'schedule', 'launch');
    CREATE TABLE subscribed_channels (
        channel_id text primary key not null,
        guild_id text not null,
        channel_name text not null,
        notification_type notification not null,
        launch_mentions text
    );
    CREATE TABLE metrics (
        id serial primary key not null,
        "action" text not null,
        guild_id text not null,
        "time" timestamp not null
    );
    CREATE TABLE counts (
        id serial primary key not null,
        guild_count int not null,
        subscribed_count int not null,
        "time" timestamp not null
    );
EOSQL
