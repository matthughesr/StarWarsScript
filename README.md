##DevOps Internship Assessment
Matthew Hughes

The script.sh file is a bash script that will find all the ships and their pilots from the star wars API https://swapi.dev/

-The bash script uses the curl command to get the data from the API. Then it uses jq which is a tool that can easily get specifc data from a json response. I then loop though each starship and get the name of the pilots for that ship. Getting the name of the ship is pretty straight forward using jq. To get the name of the pilots for each ship I loop through the pilots array and do another curl and jq comand to get their names.

Instructions
