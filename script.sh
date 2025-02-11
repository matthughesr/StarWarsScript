#!/bin/bash

# script.sh
# gets starship name and the pilots that fly it
#Notes: -r helps with errors. Doesn't treat backslash as escape characters
#Notes: curl -s is the silent version meaning no progress outputed 
#Notes: https://eliatra.com/blog/json-processing-command-line-jq/


mainURL="https://swapi.dev/api/starships/"

# Get the list of starships; includes all starship info. -O will send it to standardoutput
response=$(curl -s "$mainURL") 

#gets echo starship from the json file. 
starships=$(echo "$response" | jq -c '.results[]')

# Loop through each starship and get name 
echo "$starships" | while read -r oneShip; 
    do
    name=$(echo "$oneShip" | jq -r '.name') #get name of ship
    echo "Starship: $name"  #print out the name of ship
    
    # Get pilot info
    pilots=$(echo "$oneShip" | jq -r '.pilots | .[]?')  # ?handles errors if array is empty
    if [ -z "$pilots" ]; then
        echo "Pilots: None" #if there is not pilot print none
    else
        echo "Pilots:"
        echo "$pilots" | while read -r pilot_url; # read in pilot URL until its empty
            do
            pilot_response=$(curl -s "$pilot_url")
            pilot_name=$(echo "$pilot_response" | jq -r '.name')
            echo "  - $pilot_name"
        done
    fi
    echo "----------------------------------------"
done

echo "bye bye"
exit 0
