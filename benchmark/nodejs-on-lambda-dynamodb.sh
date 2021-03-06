cd ../nodejs-on-lambda-dynamodb

SERVICE_ENDPOINT=`sls info -v | grep ServiceEndpoint | cut -d" " -f2`

for i in {1..100}
do 
    sls deploy -f app --force > /dev/null
    curl -s -o /dev/null -w  "%{time_starttransfer}\n" -X POST $SERVICE_ENDPOINT/quote
done
