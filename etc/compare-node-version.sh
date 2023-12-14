#!/bin/bash
nodever="$(node --version)"
currentver="${nodever:1}"
requiredver="18.0.0"
if [ "$(printf '%s\n' "$requiredver" "$currentver" | sort -V | head -n1)" = "$requiredver" ]; then 
  echo "Greater than or equal to ${requiredver}"
  exit 0
else
  echo "Less than ${requiredver}"
  exit 1
fi