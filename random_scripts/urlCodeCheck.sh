#!/bin/bash
while sleep 5; do curl -ko /dev/null  --silent --head --write-out '%{http_code}\n' https://yourFQDNorIP; done
