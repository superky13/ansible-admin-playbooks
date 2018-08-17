#!/bin/bash

## This is used to place the contents of a priv key on a single line with line break chars inserted necessary for use as ssh_key_data is tower json templates
read -e -p "Please relay your private key file to be converted to a string usable in a tower json template:  " priv_key_file
cat "$priv_key_file" | grep -v "^-" | xargs | sed -e 's/ /\\n/g' | sed -e 's/^/-----BEGIN RSA PRIVATE KEY-----\\n/g' | sed -e 's/$/\\n-----END RSA PRIVATE KEY-----/g' | sed -e 's/^/"/g' | sed -e 's/$/"/g' | sed -e 's/^/"ssh_key_data":\ /g' | sed -e 's/^/      /g' > /tmp/$priv_key_file.converted
