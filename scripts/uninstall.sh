#!/bin/bash

cat ../web/art/ajta.txt
echo "Uninstalling ajta"

if [ "$EUID" -ne 0 ]
  then
  echo "Error uninstalling ajta, Please run this script as root!"
  echo "Example: sudo ./uninstall.sh"
  exit
fi

echo "Stopping ajta"
docker stop ajta_web_1 ajta_db_1 ajta_celery_1 ajta_celery-beat_1 ajta_redis_1 ajta_tor_1 ajta_proxy_1

echo "Removing all Containers related to ajta"
docker rm ajta_web_1 ajta_db_1 ajta_celery_1 ajta_celery-beat_1 ajta_redis_1 ajta_tor_1 ajta_proxy_1
echo "Removed all Containers"

echo "Removing All volumes related to ajta"
docker volume rm ajta_gf_patterns ajta_github_repos ajta_nuclei_templates ajta_postgres_data ajta_scan_results ajta_tool_config
echo "Removed all Volumes"

echo "Removing all networks related to ajta"
docker network rm ajta_ajta_network

echo "Finished Uninstalling."
