#!/bin/bash
set -x
open "$(task _get "${1}.$(basename ${0%%.sh})")"
