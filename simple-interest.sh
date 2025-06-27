#!/bin/bash

# Simple Interest Calculator
# Formula: Simple Interest = P * T * R / 100
# Where:
#   P = Principal amount
#   T = Time period in years
#   R = Annual rate of interest (in percentage)

# Color codes for better output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Function to print colored text
print_color() {
    local color=$1
    local text=$2
    echo -e "${color}${text}${NC}"
}

# Function to print header
print_header() {
    echo
    print_color $CYAN "=================================================="
    print_color $CYAN "         SIMPLE INTEREST CALCULATOR"
    print_color $CYAN "=================================================="
    print_color $YELLOW "Formula: Simple Interest = P × T × R / 100"
    print_color $YELLOW "Where:"
    print_color $YELLOW "  P = Principal amount"
    print_color $YELLOW "  T = Time period in years"
    print_color $YELLOW "  R = Annual rate of interest (%)"
    print_color $CYAN "=================================================="
    echo
}

# Function to validate if input is a positive number
validate_number() {
    local input=$1
    local field_name=$2
    
    # Check if input is empty
    if [[ -z "$input" ]]; then
        print_color $RED "Error: $field_name cannot be empty."
        return 1
    fi
    
    # Check if input is a valid number
    if ! [[ "$input" =~ ^[0-9]+\.?[0-9]*$ ]]; then
        print_color $RED "Error: $field_name must be a valid positive number."
        return 1
    fi
    
    # Check if input is positive
    if (( $(echo "$input <= 0" | bc -l) )); then
        print_color $RED "Error: $field_name must be greater than 0."
        return 1
    fi
    
    return 0
}

# Function to get user input with validation
get_input() {
    local prompt=$1
    local field_name=$2
    local value
    
    while true; do
        echo -n "$prompt"
        read value
        
        if validate_number "$value" "$field_name"; then
            echo "$value"
            break
        fi
        echo
    done
}

# Function to calculate simple interest
calculate_simple_interest() {
    local principal=$1
    local time=$2
    local rate=$3
    
    # Calculate using bc for floating point arithmetic
    local simple_interest=$(echo "scale=2; $principal * $time * $rate / 100" | bc -l)
    echo "$simple_interest"
}

# Function to format currency
format_currency() {
    local amount=$1
    printf "$%.2f" "$amount"
}

# Function to display results
display_results() {
    local principal=$1
    local time=$2
    local rate=$3
    local simple_interest=$4
    local total_amount=$(echo "scale=2; $principal + $simple_interest" | bc -l)
    
    echo
    print_color $BLUE "----------------------------------------"
    print_color $BLUE "CALCULATION RESULTS:"
    print_color $BLUE "----------------------------------------"
    printf "Principal Amount (P): "
    print_color $GREEN "$(format_currency $principal)"
    printf "Time Period (T): "
    print_color $GREEN "$time years"
    printf "Annual Interest Rate (R): "
    print_color $GREEN "$rate%"
    printf "Simple Interest: "
    print_color $YELLOW "$(format_currency $simple_interest)"
    printf "Total Amount: "
    print_color $PURPLE "$(format_currency $total_amount)"
    print_color $BLUE "----------------------------------------"
    echo
}

# Function to run example calculations
run_examples() {
    print_color $CYAN "EXAMPLE CALCULATIONS:"
    print_color $CYAN "===================="
    echo
    
    # Example 1
    print_color $YELLOW "Example 1: Personal Loan"
    local p1=15000
    local t1=3
    local r1=6.5
    local si1=$(calculate_simple_interest $p1 $t1 $r1)
    local total1=$(echo "scale=2; $p1 + $si1" | bc -l)
    
    echo "Borrowing $(format_currency $p1) for $t1 years at $r1% annual interest"
    echo "Simple Interest: $(format_currency $si1)"
    echo "Total Amount: $(format_currency $total1)"
    echo
    
    # Example 2
    print_color $YELLOW "Example 2: Savings Account"
    local p2=8000
    local t2=2.5
    local r2=2.75
    local si2=$(calculate_simple_interest $p2 $t2 $r2)
    local total2=$(echo "scale=2; $p2 + $si2" | bc -l)
    
    echo "Investing $(format_currency $p2) for $t2 years at $r2% annual interest"
    echo "Simple Interest: $(format_currency $si2)"
    echo "Total Amount: $(format_currency $total2)"
    echo
    
    # Example 3
    print_color $YELLOW "Example 3: Short-term Investment"
    local p3=25000
    local t3=1
    local r3=4.2
    local si3=$(calculate_simple_interest $p3 $t3 $r3)
    local total3=$(echo "scale=2; $p3 + $si3" | bc -l)
    
    echo "Investing $(format_currency $p3) for $t3 year at $r3% annual interest"
    echo "Simple Interest: $(format_currency $si3)"
    echo "Total Amount: $(format_currency $total3)"
    echo
}

# Function to show help
show_help() {
    print_color $CYAN "USAGE:"
    echo "  $0                    - Interactive mode"
    echo "  $0 <principal> <time> <rate>  - Calculate with given values"
    echo "  $0 -h, --help         - Show this help message"
    echo "  $0 -e, --examples     - Show example calculations"
    echo
    print_color $CYAN "EXAMPLES:"
    echo "  $0                    # Interactive mode"
    echo "  $0 1000 2 5           # Calculate: P=1000, T=2 years, R=5%"
    echo "  $0 --examples         # Show example calculations"
}

# Main function
main() {
    # Check for command line arguments
    case "${1:-}" in
        -h|--help)
            print_header
            show_help
            exit 0
            ;;
        -e|--examples)
            print_header
            run_examples
            exit 0
            ;;
        "")
            # Interactive mode
            print_header
            
            while true; do
                # Get inputs
                echo
                principal=$(get_input "Enter the principal amount: $" "Principal amount")
                time=$(get_input "Enter the time period in years: " "Time period")
                rate=$(get_input "Enter the annual rate of interest (%): " "Interest rate")
                
                # Calculate simple interest
                simple_interest=$(calculate_simple_interest $principal $time $rate)
                
                # Display results
                display_results $principal $time $rate $simple_interest
                
                # Ask if user wants to calculate again
                echo -n "Do you want to calculate again? (y/n): "
                read again
                if [[ ! "$again" =~ ^[Yy]([Ee][Ss])?$ ]]; then
                    break
                fi
            done
            
            print_color $GREEN "Thank you for using the Simple Interest Calculator!"
            ;;
        *)
            # Command line mode with arguments
            if [[ $# -eq 3 ]]; then
                principal=$1
                time=$2
                rate=$3
                
                # Validate inputs
                if validate_number "$principal" "Principal amount" && \
                   validate_number "$time" "Time period" && \
                   validate_number "$rate" "Interest rate"; then
                    
                    print_header
                    simple_interest=$(calculate_simple_interest $principal $time $rate)
                    display_results $principal $time $rate $simple_interest
                else
                    exit 1
                fi
            else
                print_color $RED "Error: Invalid number of arguments."
                echo
                show_help
                exit 1
            fi
            ;;
    esac
}

# Check if bc is installed (required for floating point calculations)
if ! command -v bc &> /dev/null; then
    print_color $RED "Error: 'bc' calculator is required but not installed."
    print_color $YELLOW "Please install bc using your package manager:"
    print_color $YELLOW "  Ubuntu/Debian: sudo apt-get install bc"
    print_color $YELLOW "  CentOS/RHEL: sudo yum install bc"
    print_color $YELLOW "  macOS: brew install bc"
    exit 1
fi

# Run main function with all arguments
main "$@"
