#!/bin/bash
set -eux
open "$(task _get "${1}.pr")"
