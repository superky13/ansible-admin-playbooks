need to pass numberOfDays variable at runtime 
examnple:
ansible-playbook -e numberOfDays=7 tempfile-cleanup.yml

This will remove files older than 7 days in /tmp
