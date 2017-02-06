#!/bin/bash

get_mnist_example() {
  su -c "cd /home/spark && git clone https://github.com/akanto/ml.git && cd ml && git checkout hcc-cuda-blog" spark
}

main() {
    get_mnist_example
}

[[ "$0" == "$BASH_SOURCE" ]] && main "$@"