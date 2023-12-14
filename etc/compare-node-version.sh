#!/bin/bash
nodever="$(node --version)"
currentver="${nodever:1}"
requiredver="18.0.0"
if [ "$(printf '%s\n' "$requiredver" "$currentver" | sort -V | head -n1)" = "$requiredver" ]; then 
  exit 0
else
  echo "Current NodeJS version is v${currentver}, which is lower than required version v${requiredver}"
  exit 1
fi