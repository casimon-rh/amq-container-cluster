#!/bin/bash
# prerreq oc login & amq zip
oc new-build --strategy docker --binary --name amq-master 2>/dev/null
oc start-build amq-master --from-dir ha-master --follow
oc new-app -i amq-master
oc patch svc/amq-master --type merge \
-p '{"spec":{"ports":[{"name":"8161-tcp","protocol":"TCP","port":8161,"targetPort":8161},{"name":"61616-tcp","protocol":"TCP","port":61616,"targetPort":61616},{"name":"9876-upd","protocol":"UDP","port":9876,"targetPort":9876}]}}'
oc expose svc/amq-master --port 8161
