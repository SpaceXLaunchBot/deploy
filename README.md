# Deploy

Scripts & files for deploying the bot and site to a Docker host.

This is more for myself rather than for someone setting up a clone, but feel free to
use this if that's what you want to do.

## Deployment

```bash
git clone https://github.com/SpaceXLaunchBot/deploy.git
cd deploy
nano config.env # Edit the secrets
chmod +x deploy
./deploy
```

Don't delete the cloned directory if you want to be able to update the containers easily.
