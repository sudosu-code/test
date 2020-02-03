#!/bin/sh
while getopts "sid:cid:cs:tid:svc:env:" opt
do
   case "$opt" in
      sid ) subscription_id="$OPTARG" ;;
      cid ) appId="$OPTARG" ;;
      cs ) password="$OPTARG" ;;
      tid ) tenant_id="$OPTARG" ;;
      svc ) service="$OPTARG" ;;
      env ) environment="$OPTARG" ;;
      ? ) echo "Invalid args"
   esac
done

export ARM_SUBSCRIPTION_ID=$subscription_id
export ARM_CLIENT_ID=$appId
export ARM_CLIENT_SECRET=$password
export ARM_TENANT_ID=$tenant_id

rm -rf build
mkdir -p build

cp $service/*.tf build/
cp $service/$env/*.tf build/

cd build

terraform init
terraform apply