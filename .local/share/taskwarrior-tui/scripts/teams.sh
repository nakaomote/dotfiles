#!/bin/bash
set -eux
open -a "Microsoft Teams" "$(task _get "${1}.teams")"
