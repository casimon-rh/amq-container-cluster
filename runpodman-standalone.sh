#!/bin/bash
podman stop amq-master 2>/dev/null
podman stop amq-slave 2>/dev/null
podman build -t amq-standalone -f standalone.dockerfile .
podman run -d -p 61616:61616 -p 8161:8161 --name amq-standalone --rm amq-standalone