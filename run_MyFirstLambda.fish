aws lambda invoke \
    --function-name MyFirstLambda \
    --payload '{"key1": "value1", "key2": "value2", "key3": "value3"}' \
    --cli-binary-format raw-in-base64-out \
    output.json

aws lambda invoke \
    --function-name MyFirstLambda \
    --payload \
    $(echo '{"key1": "value1", "key2": "value2", "key3": "value3"}' | base64) \
    output.json