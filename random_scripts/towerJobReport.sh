#!/bin/bash
successJobsCount=(`tower-cli job list --status successful --all-pages | awk '{print $3}' | grep -v ^= | grep -v ^created | cut -d'T' -f1 | grep "$(date +%F)" | wc -l`)
failedJobCount=(`tower-cli job list --status failed --all-pages | awk '{print $3}' | grep -v ^= | grep -v ^created | cut -d'T' -f1 | grep "$(date +%F)" | wc -l`)

JIDsuccessful=(`tower-cli job list --status successful --all-pages | awk '{print $1,$3}' | grep -v ^= | grep -v ^created | cut -d'T' -f1 | grep "$(date +%F)" | awk '{print $1}' | sed '/^\s*$/d' | paste -s -d, - | sed 's/[^,]*/"&"/g'`)
JIDfailed=(`tower-cli job list --status failed --all-pages | awk '{print $1,$3}' | grep -v ^= | grep -v ^created | cut -d'T' -f1 | grep "$(date +%F)" | awk '{print $1}' | sed '/^\s*$/d' | paste -s -d, - | sed 's/[^,]*/"&"/g'`)

echo "Failed Jobs Elapsed Time"
for failJID in $(tower-cli job list --status failed --all-pages | awk '{print $1,$3}' | grep -v ^= | grep -v ^created | cut -d'T' -f1 | grep "$(date +%F)" | awk '{print $1}'); do
  echo "JID $failJID had an elapsed time of $(tower-cli job list --status failed --all-pages | grep $failJID | grep -v ^= | awk '{print $5}')"
done
echo "There were $failedJobCount failed jobs on $(date +%F): $JIDfailed"

echo "Successful Jobs Elapsed Time"
for sucJID in $(tower-cli job list --status successful --all-pages | awk '{print $1,$3}' | grep -v ^= | grep -v ^created | cut -d'T' -f1 | grep "$(date +%F)" | awk '{print $1}'); do
  echo "JID $sucJID had an elapsed time of $(tower-cli job list --status successful --all-pages | grep $sucJID | grep -v ^= | awk '{print $5}')"
done
echo "There were $successJobsCount successful jobs on $(date +%F): $JIDsuccessful"
