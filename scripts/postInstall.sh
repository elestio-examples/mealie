#set env vars
set -o allexport; source .env; set +o allexport;

#wait until the server is ready
echo "Waiting for software to be ready ..."
sleep 10s;

target=${docker-compose port mealie 80}



curl 'https://mealie-u353.vm.elestio.app/api/auth/token' \
  -H 'Content-Type: multipart/form-data; boundary=----WebKitFormBoundarync4TCnRQOAhFsGSA' \

  --data-raw $'------WebKitFormBoundarync4TCnRQOAhFsGSA\r\nContent-Disposition: form-data; name="username"\r\n\r\n'"$ADMIN_MAIL"'\r\n------WebKitFormBoundarync4TCnRQOAhFsGSA\r\nContent-Disposition: form-data; name="password"\r\n\r\n'"$ADMIN_PASSWORD2"'\r\n------WebKitFormBoundarync4TCnRQOAhFsGSA--\r\n' \
  --compressed