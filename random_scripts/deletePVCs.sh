!#/bin/bash

## define variables
statefulSetName=
pvcNameBase=

## scale statefulset to zero prior to deleting pvcs
oc scale statefulset $statefulSetName --replicas=0 

## loop through pvcs and delete
for pvc in $(oc get pvc -n default | grep -i $pvcNameBase | awk '{print $1}'); do oc delete pvc $pvc; done
