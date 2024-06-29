TOKEN=`curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"` && curl -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/instance-id > id

INSTANCE_ID=$(cat id)

curl -X PATCH \
  https://raspy-fog-2f0e.shellyshubh.workers.dev/ \
  -H 'Content-Type: application/json' \
  -d '{
    "type": "update",
    "instance_id": "'"$INSTANCE_ID"'",
    "status": "ready"
  }'
