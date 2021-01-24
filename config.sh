ARG PASS_PAYLOAD="{\"newPassword\": \"$ADMIN_PASS\"}"
curl -X PUT \
  --header 'Content-Type: application/json' \
  -d $PASS_PAYLOAD \
  http://admin:geoserver@localhost:8080/geoserver/rest/security/masterpw
