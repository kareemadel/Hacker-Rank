#!/usr/bin/env bash

read x
printf "%0.3f\n" $(bc -l <<< "$x")
