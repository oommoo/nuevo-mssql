#!/bin/bash

BASIS=$(basename $(dirname $(dirname $(realpath $0))))
echo ${BASIS} | md5sum | sed 's,^\(....\)\(....\).*$,\1:\2,g;s,f,F,g'
