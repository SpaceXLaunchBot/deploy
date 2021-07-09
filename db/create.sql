-- CREATE DATABASE spacexlaunchbot
-- \c spacexlaunchbot

-- Subscribed channel data.
CREATE TYPE notification AS ENUM ('all', 'schedule', 'launch');
CREATE TABLE subscribed_channels (
    channel_id text primary key not null,
    guild_id text not null,
    channel_name text not null,
    notification_type notification not null,
    launch_mentions text
);

-- Basic metrics - an action and what guild it happened in.
CREATE TABLE metrics (
    id serial primary key not null,
    "action" text not null,
    guild_id text not null,
    "time" timestamp not null
);

-- Track guild and subscribed channel count over time.
CREATE TABLE counts (
    id serial primary key not null,
    guild_count int not null,
    subscribed_count int not null,
    "time" timestamp not null
);
