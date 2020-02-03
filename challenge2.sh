#!/bin/bash

helpFunction()
{
   echo "Prerequisites jq, curl to be installed"
   echo "Usage: $0 -u url -q query"
   echo -e "\t-u Enter metadata URL"
   echo -e "\t-q Enter Json path to query, Refer jq"
   exit 1 # Exit script after printing help
}

while getopts "u:q:" opt
do
   case "$opt" in
      u ) url="$OPTARG" ;;
      q ) query="$OPTARG" ;;
      ? ) helpFunction ;; # Print helpFunction in case parameter is non-existent
   esac
done

if [ -z "$url" ]
then
   echo "Please enter requried parameter: metadata URL";
   helpFunction # Print helpFunction in case parameter is non-existent
fi

if [ -z "$query" ]
then
   curl -s -H "Accept: application/json"  $url | jq # Print json
else
   curl -s -H "Accept: application/json"  $url | jq "$query" # Print query result
fi