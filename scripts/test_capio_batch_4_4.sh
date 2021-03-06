#!/bin/bash

mpiexec -n 2 ../../capio/build/capio_process/capio 1048576 10010 ../../capio/one_node_4_4.yaml > batch_capio_process_2_2.txt &
sleep .1
mpiexec -n 4 ../build/benchmark/capio_read_write/par_read_capio 1048576 ../build/benchmark/capio_read_write/data ../../capio/one_node_4_4.yaml ../configurations_examples/balanced_config.txt abbr batch > batch_4_4_cons.txt &
sleep .1
mpiexec -n 4 ../build/benchmark/capio_read_write/par_write_capio 1048576 ../../capio/one_node_4_4.yaml ../configurations_examples/balanced_config.txt abbr batch > batch_4_4_prods.txt
if [ $? -ne 0 ];
then
    echo "all_gather test case 1 failed"
fi

