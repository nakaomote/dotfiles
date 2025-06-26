#!/usr/bin/env python3

import os
import sys
import json

def setJira():
    task = json.loads(sys.stdin.read())

    if 'jira' not in task:
        if 'jiraUrl' in task:
            task['jira'] = os.path.basename(task['jiraUrl'])
    elif 'jiraUrl' not in task and 'JIRA_URL' in os.environ:
        task['jiraUrl'] = os.path.join(os.environ['JIRA_URL'], task['jira'])

    print(json.dumps(task))

if __name__ == "__main__":
    setJira()

