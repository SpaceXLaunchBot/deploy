-- This is just to make writing the SQL easier, the actual SQL that is executed is
-- located in ../scripts/pg-create and should be updated when this is.

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

-- Very basic log persistence.
CREATE TABLE log (
    id serial PRIMARY KEY NOT NULL,
    time TEXT,
    level TEXT,
    location TEXT,
    function TEXT,
    message TEXT
);
