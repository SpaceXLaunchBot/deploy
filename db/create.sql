-- CREATE DATABASE spacexlaunchbot
-- \c spacexlaunchbot

CREATE TYPE notification AS ENUM ('all', 'schedule', 'launch');
CREATE TABLE subscribed_channels (
    channel_id text primary key not null,
    guild_id text not null,
    channel_name text not null,
    notification_type notification not null,
    launch_mentions text
);
