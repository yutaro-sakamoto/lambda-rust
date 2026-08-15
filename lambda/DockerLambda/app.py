def handler(context, event):
    return {
        "statusCode": 200,
        "body": '{"message": "Hello from Lambda!"}'
    }