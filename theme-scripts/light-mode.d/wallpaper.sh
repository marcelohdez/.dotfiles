#!/bin/sh
IMAGE=$(ls ~/.walls/day/ | sort -R | tail -1)
swww img ~/.walls/day/$IMAGE
