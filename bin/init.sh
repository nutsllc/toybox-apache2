#!/bin/bash

self=$(cd $(dirname $0);pwd)
dist=${self}/..

dirs=(
    "${dist}/2.2"
    "${dist}/2.4"
    "${dist}/2.2-alpine"
    "${dist}/2.4-alpine"
)
for d in ${dirs[@]}; do
    src=${self}/../seed
    [ -d ${d} ] && rm -r ${d}
    apache_ver=$(echo ${d} | awk -F "/" '{print $(NF)}' | cut -d "-" -f1) 
    baseOS=$(echo ${d} | awk -F "/" '{print $(NF)}' | grep alpine | cut -d "-" -f2) 
    [ -z "${baseOS}" ] && baseOS=ubuntu
    printf "Generate: Dockerfile for Apache2 v${apache_ver} on ${baseOS}..."
    mkdir -p ${d}
    cp ${src}/${baseOS}/Dockerfile-seed ${d}/Dockerfile
    cp ${src}/docker-entrypoint-ex.sh-seed ${d}/docker-entrypoint-ex.sh
    cp ${src}/${baseOS}/Makefile-seed ${d}/Makefile
    chmod 755 ${d}/docker-entrypoint-ex.sh
    sed -i -e "s/{{APACHE_VERSION}}/${apache_ver}/" ${d}/Dockerfile
    sed -i -e "s/{{APACHE_VERSION}}/${apache_ver}/" ${d}/Makefile
    echo "done."
done


echo "complete!"

exit 0
