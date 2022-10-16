#set env vars
set -o allexport; source .env; set +o allexport;

#wait until the server is ready
echo "Waiting for software to be ready ..."
sleep 10s;

target=${docker-compose port mealie 80}



  curl 'https://mealie-u353.vm.elestio.app/api/auth/token' \
  -H 'sec-ch-ua: "Google Chrome";v="105", "Not)A;Brand";v="8", "Chromium";v="105"' \
  -H 'Accept-Language: en-US' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'Authorization: Bearer' \
  -H 'Content-Type: multipart/form-data; boundary=----WebKitFormBoundarynpgizoN5sX7Eg1AB' \
  -H 'Accept: application/json, text/plain, */*' \
  -H 'Referer: https://mealie-u353.vm.elestio.app/' \
  -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36' \
  -H 'sec-ch-ua-platform: "macOS"' \
  --data-raw $'------WebKitFormBoundarynpgizoN5sX7Eg1AB\r\nContent-Disposition: form-data; name="username"\r\n\r\n'"$ADMIN_MAIL"'\r\n------WebKitFormBoundarynpgizoN5sX7Eg1AB\r\nContent-Disposition: form-data; name="password"\r\n\r\n'"$ADMIN_PASSWORD2"'\r\n------WebKitFormBoundarynpgizoN5sX7Eg1AB--\r\n' \
  --compressed