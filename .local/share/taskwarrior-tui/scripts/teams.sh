#!/bin/bash
set -x
open -a "Microsoft Teams" "$(task _get "${1}.teams")"
