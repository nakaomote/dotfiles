#!/bin/bash
set -eux
open "$(task _get "${2}.$(basename ${0%%.sh})")"
