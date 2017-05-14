#!/bin/bash

for letra in 0 1 2 3 4 5 6 7 ; do
        for bold in '' ';1'; do
                for fundo in 0 1 2 3 4 5 6 7; do
                        seq="4$fundo;3$letra"
                        echo -ne "{FONTE}33[$seq${bold}m $seq${bold:-  } {FONTE}33[m"
                done
        done
done
