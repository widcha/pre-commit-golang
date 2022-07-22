#! /bin/sh

cd packages/services/
for DIR in $(echo "$@" | xargs -n1 dirname | sort -u); do
	go vet ./"$DIR"
  
done
