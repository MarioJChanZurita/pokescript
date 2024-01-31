#!/bin/bash

if [ $# -eq 0 ]; then
  echo "Usage: $0 <pokemon_name>"
  exit 1
fi

pokemon_name="$1"

api_url="https://pokeapi.co/api/v2/pokemon/${pokemon_name}"
response=$(curl -s "$api_url")

if [ $? -ne 0 ]; then
  echo "Error: Failed to fetch data from PokeApi."
  exit 1
fi

id=$(echo "$response" | jq -r '.id')
name=$(echo "$response" | jq -r '.name')
weight=$(echo "$response" | jq -r '.weight')
height=$(echo "$response" | jq -r '.height')
order=$(echo "$response" | jq -r '.order')

echo "${name^} (No. $id)"
echo "Id = $id"
echo "Weight = $weight"
echo "Height = $height"