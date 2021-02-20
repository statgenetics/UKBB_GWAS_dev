alias jnbinder="mkdir -p .sos && docker run --rm -v $PWD:$PWD -v /tmp:/tmp -v $PWD/.sos:$PWD/.sos -t -w=$PWD -u $(id -u):$(id -g) gaow/jnbinder jnbinder"
