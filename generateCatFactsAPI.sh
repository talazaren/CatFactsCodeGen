MODULE="Modules/CatsAPI/Sources/CatsAPI/"

openapi-generator generate -i "catfactsapi.yaml" -g swift5 -o "catsapi"
rm -r $MODULE""*
cp -R "catsapi/OpenAPIClient/Classes/OpenAPIs/". $MODULE
rm -r "catsapi"
