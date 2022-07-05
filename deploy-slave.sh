#!/bin/bash
# prerreq oc login & amq zip
oc new-build --strategy docker --binary --name amq-slave 2>/dev/null
oc start-build amq-slave --from-dir ha-slave --follow
oc new-app -i amq-slave
oc patch svc/amq-slave --type merge \
-p '{"spec":{"ports":[{"name":"8162-tcp","protocol":"TCP","port":8162,"targetPort":8162},{"name":"61617-tcp","protocol":"TCP","port":61617,"targetPort":61617},{"name":"9876-upd","protocol":"UDP","port":9876,"targetPort":9876}]}}'
oc expose svc/amq-slave --port 8162