# drivesync-docker
Slim Docker container with [MStadlmeier's DriveSync](https://github.com/MStadlmeier/drivesync)

Supports running under chosen UID/GID.
This container stays running and syncs every 300 seconds by default.



### Use Cases
- Fire and forget, no cron on host or extra scripts needed
- Run on NAS to share KeePass file with all devices in network
- Run on desktop to keep files secure on Google Drive


## Setup
1. (Suggested) Copy docker-compose.yml and edit as needed
2. Setup has to be done with *run*. After setup *up* is possible.

   `docker-compose run drivesync` 
3. Copy the provided URL in the browser and sign in.
4. Paste the resulting token in and press enter
5. Container starts running, CTRL+C and switch to *up -d* to start it in the background
   
   `docker-compose up -d`


## Docker-Compose
Example in [Git repo](https://github.com/Barchok/drivesync-docker/blob/master/docker-compose.yml)


## Environment
|Name|Action|Required|
|---|---|---|
|PUID|Set User ID|Yes|
|PGID|Set Group ID|Yes|
|INTERVAL|Set sync interval in seconds|No|



## Volumes
|Name|Content|Required|
|---|---|---|
|/sync|Content of the Google Drive|Yes, as bind mount|
|/appdata|Config, manifest & credential files|Yes, as any mount|



## ToDo
- More user friendly for actions other than sync
- Run as root