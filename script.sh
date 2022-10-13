if [ "$( docker container inspect -f '{{.State.Status}}' tomcat-container )" == "exited" ]
then
docker container rm tomcat-container -f
else
echo "container not running, please proceed"
fi
