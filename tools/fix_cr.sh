#!/bin/bash

echo "running:"
echo "sed -i -e 's/\r\$//' $1"

sed -i -e 's/\r$//' $1
