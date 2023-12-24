#!/bin/bash

./ssh -F ssh_config -o StrictHostKeyChecking=no -vvv -c aes256-ctr user@localhost