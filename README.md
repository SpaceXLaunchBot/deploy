# Deploy

Scripts & files for deploying the SpaceXLaunchBot system.

This is more for myself rather than for someone setting up a clone, but feel free to
use this if that's what you want to do.

## Scripts

All the scripts in the `scripts` directory are written to be executed from the root of this repository, for example

```bash
cd ~/deploy
./scripts/up
```

## Deployment

```bash
git clone https://github.com/SpaceXLaunchBot/deploy.git
cd deploy
vi config.env
chmod +x scripts/*
./scripts/deploy
```
