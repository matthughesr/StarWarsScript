#!/bin/bash

# script.sh
# Gets starship name and the pilots that fly it

#Notes: jq -r helps with errors. Doesn't treat backslash as escape characters
#Notes: curl -f will Fail silently on HTTP errors
#Notes: curl -s is the silent version meaning no progress outputed 
#Notes: curl -S will print errors




#checkEmpty function takes two parameters and check if first parameter is empty.
    #second parameter is error message
checkEmpty (){
     if [[ -z $1 || $1 = "null" ]]   # if empty or null
    then
        echo "Error: $2"        #print specifc error message passed into function
        exit 1;                  #exit program
    fi
}






echo ""
echo "-------------Starting Star Wars Script-------------"

mainURL="https://swapi.dev/api/starships/"


while [[ $mainURL != "" && $mainURL != "null" ]];        # makes sure that mainURL is not empty or null
do

    # Get the list of starships; includes all starship info. 
    response=$(curl -fsS "$mainURL")
  
    checkEmpty "$response" "No response from $mainURL"  #check if got response

    #gets elements from resutls array from the json file. 
    starships=$(echo "$response" | jq -c '.results[]')
    
    checkEmpty "$starships" "Unable to get results" #confirm not empty


    # Loop through each each element of result array and get starship name 
    echo "$starships" | while read -r oneShip; 
        do
        name=$(echo "$oneShip" | jq -r '.name') #get name of ship
        if [ -z "$name" ]; then
            echo "Error: No starship found" #if starship is not found. Let user know
        fi
        echo "Starship: $name"  #print out the name of ship
      
        
        # Get pilot info
        pilots=$(echo "$oneShip" | jq -r '.pilots | .[]?')  # ?handles errors if array is empty
        if [ -z "$pilots" ]; then
            echo "Pilots: None" #if there is not pilot print none
        else
            echo "Pilots:"
            echo "$pilots" | while read -r pilot_url; # read in pilot URL until its empty
                do
                pilot_response=$(curl -fsS "$pilot_url")

                if [[ $pilot_response == "" || $pilot_response == "null" ]]
                then echo "error getting pilot from $pilot_url"
                fi

                pilot_name=$(echo "$pilot_response" | jq -r '.name')
                echo "  - $pilot_name"
            done
        fi
        echo "----------------------------------------"
         
        done
        
    mainURL=$(echo "$response" | jq -r '.next')        #go to next page
done

echo "Star Wars Script is done. Bye"
exit 0
