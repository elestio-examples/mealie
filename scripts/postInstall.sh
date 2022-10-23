#set env vars
set -o allexport; source .env; set +o allexport;

#wait until the server is ready
echo "Waiting for software to be ready ..."
sleep 10s;

#register the local server in the web ui
target=$(docker-compose port mealie 80)


  curl http://$target/api/auth/token \
  -H 'sec-ch-ua: "Google Chrome";v="105", "Not)A;Brand";v="8", "Chromium";v="105"' \
  -H 'Accept-Language: en-US' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'Authorization: Bearer' \
  -H 'Content-Type: multipart/form-data; boundary=----WebKitFormBoundarynpgizoN5sX7Eg1AB' \
  -H 'Accept: application/json, text/plain, */*' \
  -H Referer: http://$target/ \
  -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36' \
  -H 'sec-ch-ua-platform: "macOS"' \
  --data-raw $'------WebKitFormBoundarynpgizoN5sX7Eg1AB\r\nContent-Disposition: form-data; name="username"\r\n\r\nchangeme@email.com\r\n------WebKitFormBoundarynpgizoN5sX7Eg1AB\r\nContent-Disposition: form-data; name="password"\r\n\r\nMyPassword\r\n------WebKitFormBoundarynpgizoN5sX7Eg1AB--\r\n' \
  --compressed

  # Stocker

  jwt={curl http://$target/api/auth/token \
  -H 'sec-ch-ua: "Google Chrome";v="105", "Not)A;Brand";v="8", "Chromium";v="105"' \
  -H 'Accept-Language: en-US' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'Authorization: Bearer' \
  -H 'Content-Type: multipart/form-data; boundary=----WebKitFormBoundarynpgizoN5sX7Eg1AB' \
  -H 'Accept: application/json, text/plain, */*' \
  -H Referer: http://$target/ \
  -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36' \
  -H 'sec-ch-ua-platform: "macOS"' \
  --data-raw $'------WebKitFormBoundarynpgizoN5sX7Eg1AB\r\nContent-Disposition: form-data; name="username"\r\n\r\nchangeme@email.com\r\n------WebKitFormBoundarynpgizoN5sX7Eg1AB\r\nContent-Disposition: form-data; name="password"\r\n\r\nMyPassword\r\n------WebKitFormBoundarynpgizoN5sX7Eg1AB--\r\n' \
  --compressed}

sleep 10s;

  # Change Password

  # curl 'https://mealie2-u353.vm.elestio.app/api/users/1/password' \
  # -X 'PUT' \
  # -H 'authority: mealie2-u353.vm.elestio.app' \
  # -H 'accept: application/json, text/plain, */*' \
  # -H 'accept-language: en-US' \
  # -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJjaGFuZ2VtZUBlbWFpbC5jb20iLCJleHAiOjE2NjY1MTY0MjZ9.JG2iAzFv9z3CBP2MzWguDcL0LxNaTSJeeSnr0qFe2r4' \
  # -H 'content-type: application/json;charset=UTF-8' \
  # -H 'origin: https://mealie2-u353.vm.elestio.app' \
  # -H 'referer: https://mealie2-u353.vm.elestio.app/admin' \
  # -H 'sec-ch-ua: "Chromium";v="106", "Google Chrome";v="106", "Not;A=Brand";v="99"' \
  # -H 'sec-ch-ua-mobile: ?0' \
  # -H 'sec-ch-ua-platform: "macOS"' \
  # -H 'sec-fetch-dest: empty' \
  # -H 'sec-fetch-mode: cors' \
  # -H 'sec-fetch-site: same-origin' \
  # -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36' \
  # --data-raw '{"currentPassword":"MyPassword","newPassword":"123456789"}' \
  # --compressed

echo "jwt"
echo $jwt
echo "jwt"


  curl http://$target/api/groups/self \
  -H 'sec-ch-ua: "Chromium";v="106", "Google Chrome";v="106", "Not;A=Brand";v="99"' \
  -H 'Accept: application/json, text/plain, */*' \
  -H Referer: http://$target/ \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJjaGFuZ2VtZUBlbWFpbC5jb20iLCJleHAiOjE2NjY1MTgwMDh9.yocTStpu1otTcjU5jK1doTyNDbSndrOfsYihBTKdCKQ' \
  -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36' \
  -H 'sec-ch-ua-platform: "macOS"' \
  --compressed