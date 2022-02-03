#!/bin/bash
echo "---
- name: darexsu.php 
" > "requirements.yml"
ansible-galaxy install -r requirements.yml
