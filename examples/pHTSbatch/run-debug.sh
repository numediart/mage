#!/bin/zsh
#
# Copyright 2013 by Idiap Research Institute, http://www.idiap.ch
#
# See the file COPYING for the licence associated with this software.
#
# Author(s):
#   Milos Cernak, October 2013
#

pHTS=../../bin/Debug/pHTSbatch
lab=../../data/labels/cmu-artic/alice01.lab

opts=(
  -s 48000 -p 240 -a 0.55 
  -td ../../data/voices/slt/tree-dur.inf 
  -tm ../../data/voices/slt/tree-mgc.inf
  -tf ../../data/voices/slt/tree-lf0.inf
  -tl ../../data/voices/slt/tree-lpf.inf
  -md ../../data/voices/slt/dur.pdf
  -mm ../../data/voices/slt/mgc.pdf
  -mf ../../data/voices/slt/lf0.pdf
  -ml ../../data/voices/slt/lpf.pdf
  -dm ../../data/voices/slt/mgc.win1
  -dm ../../data/voices/slt/mgc.win2
  -dm ../../data/voices/slt/mgc.win3
  -df ../../data/voices/slt/lf0.win1
  -df ../../data/voices/slt/lf0.win2
  -df ../../data/voices/slt/lf0.win3
  -dl ../../data/voices/slt/lpf.win1
  -em ../../data/voices/slt/tree-gv-mgc.inf
  -ef ../../data/voices/slt/tree-gv-lf0.inf
  -cm ../../data/voices/slt/gv-mgc.pdf
  -cf ../../data/voices/slt/gv-lf0.pdf
  -k  ../../data/voices/slt/gv-switch.inf
  # -vp
)

$pHTS $opts $lab
echo "sox: converting to synthesis.wav"
sox -e float -b 32 -c 1 -r 48k synthesis.raw synthesis.wav
