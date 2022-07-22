#! /bin/sh

cd packages/services/farm
for DIR in $(echo "$@" | xargs -n1 dirname | sort -u); do
	go vet ./"$DIR"
  
done
