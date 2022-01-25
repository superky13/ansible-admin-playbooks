!#/bin/bash

## define variables
newPVCSize=20Gi 
pvcNameBase=

## loop through pvcs and scale according to $newPVCSize
for pvc in $(oc get pvc -n default | grep -i $pvcNameBase | awk '{print $1}'); do oc patch pvc $pvc -p '{"spec":{"resources":{"requests":{"storage":"$newPVCSize"}}}}'; done
