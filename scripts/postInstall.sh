#set env vars
set -o allexport; source .env; set +o allexport;

#wait until the server is ready
echo "Waiting for software to be ready ..."
sleep 10s;

#register the local server in the web ui
target=$(docker-compose port mealie 80)

  # Stocker

  JWT=$(curl http://$target/api/auth/token -H 'Authorization: Bearer' -H 'Content-Type: multipart/form-data; boundary=----WebKitFormBoundarynpgizoN5sX7Eg1AB' -H 'Accept: application/json, text/plain, */*' --data-raw $'------WebKitFormBoundarynpgizoN5sX7Eg1AB\r\nContent-Disposition: form-data; name="username"\r\n\r\nchangeme@email.com\r\n------WebKitFormBoundarynpgizoN5sX7Eg1AB\r\nContent-Disposition: form-data; name="password"\r\n\r\nMyPassword\r\n------WebKitFormBoundarynpgizoN5sX7Eg1AB--\r\n' --compressed)

  echo "JWT " ${JWT}
  
  access_token=$(echo $JWT | jq -r '.access_token' )

  echo "access_token1 " ${access_token}

  curl http://$target/api/groups/self \
  -H 'sec-ch-ua: "Chromium";v="106", "Google Chrome";v="106", "Not;A=Brand";v="99"' \
  -H 'Accept: application/json, text/plain, */*' \
  -H Referer: http://$target/ \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'Authorization: Bearer '"${access_token}"'' \
  -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36' \
  -H 'sec-ch-ua-platform: "macOS"' \
  --compressed

  JWT=$(curl http://$target/api/users/1 \
  -X 'PUT' \
  -H 'Accept-Language: en-US' \
  -H 'Authorization: Bearer '"${access_token}"'' \
  -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36' \
  -H 'Content-Type: application/json;charset=UTF-8' \
  -H 'Accept: application/json, text/plain, */*' \
  --data-raw '{"username":"root","fullName":"root","email":"'"${ADMIN_EMAIL}"'","admin":true,"group":"Home","favoriteRecipes":[],"id":1,"tokens":[]}' \
  --compressed)

  echo "JWT " ${JWT}


  access_token=$(echo $JWT | jq -r '.access_token' )

  echo "ADMIN_EMAIL " ${ADMIN_EMAIL}
  echo "access_token2 " ${access_token}

  # Change Password

  curl http://$target/api/users/1/password \
  -X 'PUT' \
  -H 'accept: application/json, text/plain, */*' \
  -H 'accept-language: en-US' \
  -H 'authorization: Bearer '"${access_token}"'' \
  -H 'content-type: application/json;charset=UTF-8' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36' \
  --data-raw '{"currentPassword":"MyPassword","newPassword":"'"${ADMIN_PASSWORD}"'"}' \
  --compressed


  echo "ADMIN_PASSWORD " ${ADMIN_PASSWORD}