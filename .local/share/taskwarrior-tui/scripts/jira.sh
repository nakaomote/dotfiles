#!/bin/bash
set -x
open "${JIRA_URL}/$(task _get "${1}.$(basename ${0%%.sh})")"
