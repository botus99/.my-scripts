#!/usr/bin/env bash

# Function to display help message
show_help() {
echo -e "\033[0;36m\033[1murban-define\033[0m"
echo -e ""
echo -e "\033[0;34mUsage:\033[0m \033[1murban-define\033[0m [-h|--help] [<word1> [<word2> ...]]"
echo -e ""
echo -e "Search for words on Urban Dictionary and display definitions."
echo -e ""
echo -e "\033[0;34mOptions:\033[0m"
echo -e " -h, --help     Show this help message"
}

# Parse command-line options
while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--help)
            show_help
            exit 0
            ;;
        *)
            break
            ;;
    esac
done

# Loop through each argument
for word in "$@"; do
    # Search for the word on Urban Dictionary
    result=$(curl -s "https://api.urbandictionary.com/v0/define?term=$word")

    # Check if the search was successful
    if [ $? -ne 0 ]; then
        echo "Error searching for '$word'"
        continue
    fi

    # Extract the definition from the JSON response
    definition=$(echo "$result" | jq -r '.list[0].definition')

    # Display the result
    echo -e "\033[0;36mUrban Dictionary definition of '\033[0;32m$word\033[0m\033[0;36m':\033[0m"
    fold -w 80 -s <<< "$definition"
    echo ""
done
