#!/bin/bash
## Specifies the interpreting shell for the job.
#$ -S /bin/bash

## Specifies that all environment variables active within the qsub utility be exported to the context of the job.
#$ -v  OMP_NUM_THREADS=16

## Execute the job from the current working directory.
#$ -cwd

## Parallel programming environment (mpich) to instantiate and number of computing slots.
#$ -pe mpich-smp 16

## Specifies the parallel environment

## The  name  of  the  job.
#$ -N hybrid_6000_16

## Send an email at the start and the end of the job.
#$ -m be

## The email to send the queue manager notifications.
#$ -M jlf4@alumnes.udl.cat


MPICH_MACHINES=$TMPDIR/mpich_machines
cat $PE_HOSTFILE | awk '\{print $1":"$2\}' > $MPICH_MACHINES

## In this line you have to write the command that will execute your application.
mpiexec -f $MPICH_MACHINES -n $NSLOTS ./mandelbrot_hybrid

rm -rf $MPICH_MACHINES}
