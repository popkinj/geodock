# Change the admin account password
curl -X PUT \
  --header 'Content-Type: application/json' \
  -d "{\"newPassword\": \"$ADMIN_PASS\"}" \
  http://admin:geoserver@localhost:8080/geoserver/rest/security/self/password
