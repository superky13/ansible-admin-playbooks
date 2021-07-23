#!/bin/bash

#pause machineconfigpool updates
oc patch machineconfigpool master --patch '{"spec":{"paused":true}}' --type=merge -n openshift-machine-api
oc patch machineconfigpool worker --patch '{"spec":{"paused":true}}' --type=merge -n openshift-machine-api

#patch complianceremediations
for finding in $(oc get compliancecheckresults -n openshift-compliance | grep high | grep FAIL | awk '{print $1}'); do oc patch complianceremediations/$finding --patch '{"spec":{"apply":true}}' --type=merge -n openshift-compliance; done

#patch machineconfigpools to unpause
oc patch machineconfigpool master --patch '{"spec":{"paused":false}}' --type=merge -n openshift-machine-api
oc patch machineconfigpool worker --patch '{"spec":{"paused":false}}' --type=merge -n openshift-machine-api

