#!/usr/bin/env bash

set -euo pipefail

# Configuration
API_URL="https://api.dictionaryapi.dev/api/v2/entries/en_US/"
MAX_DEFINITIONS=5
OUTPUT_WIDTH=80

# Function to get word from command line argument
get_word() {
    local arg="${1:-}"
    [[ -z "$arg" ]] || echo "$arg"
}

# Function to fetch dictionary entry
fetch_entry() {
    local word="$1"
    curl -s "$API_URL$word"
}

# Function to display word in bold
display_bold() {
    local text="$1"
    echo -e "\033[0;36m\033[1m${text}\033[0m"
    echo -e "---"
}

# Function to display definitions
display_definitions() {
    local definitions="$1"
    echo -e "$definitions" | fold -w "$OUTPUT_WIDTH" -s
}

# Help function
help() {
    echo -e "\033[0;36m\033[1mdefine\033[0m"
    echo -e ""
    echo -e "Dictionary Lookup Tool"
    echo -e ""
    echo -e "\033[0;34mUsage:\033[0m \033[1mdefine\033[0m [OPTION]..."
    echo -e ""
    echo -e "\033[0;34mOptions:\033[0m"
    echo -e "  -h, --help         Show this help message"
    echo -e "  -l, --language     Specify the language (default: en_US) (WIP, currently broken)"
    echo -e "  -d, --definitions  Set number of definitions to display (default: 5)"
    echo -e "  -w, --width        Set output width (default: 80)"
    echo -e ""
    echo -e "\033[0;34mExamples:\033[0m"
    echo -e '  define "hello"'
    echo -e '  define -l es "hola"'
    echo -e '  define -d 10 "buffalo"'
    echo -e '  define -w 120 "long phrase"'
    echo -e ""
    echo -e "\033[0;34mNote:\033[0m"
    echo -e "  - If no word is provided, it will prompt for input."
    echo -e "  - Invalid words will return an error message."
}

# Parse arguments
while [[ $# -gt 0 ]]; do
    case "$1" in
        -h|--help)
            help
            exit 0
            ;;
        -l|--language)
            shift
            API_URL="https://api.dictionaryapi.dev/api/v2/entries/${1}/"
            shift
            ;;
        -d|--definitions)
            shift
            MAX_DEFINITIONS=$1
            shift
            ;;
        -w|--width)
            shift
            OUTPUT_WIDTH=$1
            shift
            ;;
        *)
            break
            ;;
    esac
done

# Main function
main() {
    local word=$(get_word "$@")
    
    if [[ -z "$word" ]]; then
        read -p "Enter a word: " word
        echo -ne "\033[A\033[K"
    fi

    local query=$(fetch_entry "$word")

    if [[ -z "$query" ]]; then
        echo -e "Invalid word: \033[1m$word" >&2
        exit 1
    fi

    local definitions=$(echo "$query" | jq -r '
        [.[] | 
            .meanings[] | 
            {pos: .partOfSpeech, def: .definitions[].definition}] | 
        .[:'$MAX_DEFINITIONS'].[] | "\n\(.pos). \(.def)"
    ')

    display_bold "$word"
    display_definitions "$definitions"
}

# Run main function
main "$@"
