#!/bin/sh
IMAGE=$(ls ~/.walls/night/ | sort -R | tail -1)
swww img ~/.walls/night/$IMAGE -t random
