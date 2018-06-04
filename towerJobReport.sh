#!/bin/bash
successJobsCount=(`tower-cli job list --status successful --all-pages | awk '{print $3}' | grep -v ^= | grep -v ^created | cut -d'T' -f1 | grep "$(date +%F)" | wc -l`)
failedJobCount=(`tower-cli job list --status failed --all-pages | awk '{print $3}' | grep -v ^= | grep -v ^created | cut -d'T' -f1 | grep "$(date +%F)" | wc -l`)

JIDsuccessful=(`tower-cli job list --status successful --all-pages | awk '{print $1 " " $3}' | grep -v ^= | grep -v ^created | cut -d'T' -f1 | grep "$(date +%F)" | awk '{print $1}' | sed '/^\s*$/d' | paste -s -d, - | sed 's/[^,]*/"&"/g'`)
JIDfailed=(`tower-cli job list --status failed --all-pages | awk '{print $1 " " $3}' | grep -v ^= | grep -v ^created | cut -d'T' -f1 | grep "$(date +%F)" | awk '{print $1}' | sed '/^\s*$/d' | paste -s -d, - | sed 's/[^,]*/"&"/g'`)

echo "There were $successJobsCount successful jobs on $(date +%F): $JIDsuccessful"
echo "There were $failedJobCount failed jobs on $(date +%F): $JIDfailed"
