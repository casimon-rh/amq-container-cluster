#!/bin/bash
podman stop amq-standalone 2>/dev/null
podman build -t amq-master -f ha-master.dockerfile .
podman run -d -p 61616:61616 -p 8161:8161 --name amq-master --rm amq-master
podman build -t amq-slave -f ha-slave.dockerfile .
podman run -d -p 61617:61617 -p 8162:8162 --name amq-slave --rm amq-slave