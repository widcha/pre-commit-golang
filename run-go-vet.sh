#! /bin/sh

for DIR in $(echo "$@" | xargs -n1 dirname | sort -u); do
	go vet ./"$DIR" + "/packages/services/farm"
	echo "Halo"
done
