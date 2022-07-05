#!/bin/bash
# prerreq oc login & amq zip
oc new-build --strategy docker --binary --name amq-standalone 2>/dev/null
oc start-build amq-standalone --from-dir standalone --follow
oc new-app -i amq-standalone
oc patch svc/amq-standalone --type merge -p '{"spec":{"ports":[{"name":"8161-tcp","protocol":"TCP","port":8161,"targetPort":8161},{"name":"61616-tcp","protocol":"TCP","port":61616,"targetPort":61616}]}}'
oc expose svc/amq-standalone --port 8161