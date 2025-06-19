#!/bin/bash

response=$(curl -s -o /dev/null -w "%{http_code}" https://www.guvi.in)
echo "HTTP status code is: $response"

if [[ $response -ge 200 && $response -lt 300 ]]; then
echo "Success: guvi.in responded with status code $response"
else
echo "Failure: guvi.in responded with status code $response"
fi
