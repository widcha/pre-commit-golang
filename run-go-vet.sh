#! /bin/sh

cd /dirname/packages/services/farm
for DIR in $(echo "$@" | xargs -n1 dirname | sort -u); do
	go vet /"$DIR"
  
done
