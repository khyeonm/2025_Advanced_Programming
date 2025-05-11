import os
import re

with open("commit.txt") as f:
    line = f.read().strip()

def is_totally_invalid(msg):
    return ':' not in msg or len(msg.split(':')[0]) < 3

def suggest_fix(msg):
    type_scope, _, message = msg.partition(':')
    type_scope = type_scope.strip()
    message = message.strip()

    match = re.match(r'^(?P<type>[a-zA-Z]+)(\((?P<scope>[a-zA-Z0-9_-]+)\))?$', type_scope)
    if not match:
        return None

    type_part = match.group("type").capitalize()
    scope_part = match.group("scope")

    message = message.rstrip('.')
    message = message[0].lower() + message[1:] if message else message

    return f"{type_part}({scope_part}): {message}" if scope_part else f"{type_part}: {message}"

if not line.startswith("Merge"):
    output = ""
    if is_totally_invalid(line):
        output += "invalid=1\n"
    else:
        fixed = suggest_fix(line)
        if fixed and fixed != line:
            output += "invalid=1\n"
            output += f"suggestion={fixed}\n"
        elif fixed != line:
            output += "invalid=1\n"

    with open(os.environ["GITHUB_OUTPUT"], "a") as fh:
        fh.write(output)