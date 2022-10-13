if [ "$( docker container inspect -f '{{.State.Status}}' tomcat-container )" == running ]
then
docker container rm tomcat-container -f
else
echo "container not running, please proceed"
fi
