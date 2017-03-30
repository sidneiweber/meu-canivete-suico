#!/bin/bash
echo "Particoes que ja ocupam 70% ou mais"
echo "-----------------------------------"
df -h | grep "[7-9][0-9]%"
