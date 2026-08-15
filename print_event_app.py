import json
import sys

def handle_event(event):
    print(json.dumps(event))

if __name__ == "__main__":
    input_json = sys.stdin.read()
    event = json.loads(input_json)

    handle_event(event)