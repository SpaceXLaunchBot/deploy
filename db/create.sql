-- This is just to make writing the SQL easier, the actual SQL that is executed is
-- located in ../pg-create.sh and should be updated when this is.

-- CREATE DATABASE spacexlaunchbot
-- \c spacexlaunchbot

-- Subscribed channel data.
CREATE TYPE notification AS ENUM ('all', 'schedule', 'launch');
CREATE TABLE subscribed_channels (
    channel_id TEXT PRIMARY KEY NOT NULL,
    guild_id TEXT NOT NULL,
    channel_name TEXT NOT NULL,
    notification_type notification NOT NULL,
    launch_mentions TEXT
);

-- Basic metrics - an action and what guild it happened in.
CREATE TABLE metrics (
    id serial PRIMARY KEY NOT NULL,
    "action" TEXT NOT NULL,
    guild_id TEXT NOT NULL,
    "time" TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

-- Track guild and subscribed channel count over time.
CREATE TABLE counts (
    id serial PRIMARY KEY NOT NULL,
    guild_count INT NOT NULL,
    subscribed_count INT NOT NULL,
    "time" TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

-- Hold sessions with users so we can store their Discord OAuth secrets.
CREATE TABLE sessions (
    session_id TEXT PRIMARY KEY NOT NULL,
    session_creation_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    access_token_encrypted BYTEA NOT NULL,
    access_token_expires_at TIMESTAMP NOT NULL,
    refresh_token_encrypted BYTEA NOT NULL,
    refresh_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);
