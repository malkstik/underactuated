#!/bin/bash

IMAGE=underactuated

DOCKER_OPTIONS=""
DOCKER_OPTIONS+="-it "
DOCKER_OPTIONS+="-v /home/malkstik/Documents/Repos/underactuated:/home/underactuated "

# X11 forwarding for GUI
xhost local:root
export DISPLAY=$DISPLAY
DOCKER_OPTIONS+="-e DISPLAY=$DISPLAY "
DOCKER_OPTIONS+="-v /tmp/.X11-unix:/tmp/.X11-unix "

echo "docker run" $DOCKER_OPTIONS $IMAGE
docker run $DOCKER_OPTIONS $IMAGE