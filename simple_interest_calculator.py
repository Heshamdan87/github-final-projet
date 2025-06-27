#!/usr/bin/env python3
"""
Simple Interest Calculator

Calculates simple interest using the formula: Simple Interest = P * T * R / 100
Where:
    P = Principal amount
    T = Time period in years
    R = Annual rate of interest (in percentage)
"""

def calculate_simple_interest(principal, time_years, annual_rate):
    """
    Calculate simple interest.
    
    Args:
        principal (float): Principal amount
        time_years (float): Time period in years
        annual_rate (float): Annual rate of interest (as percentage)
    
    Returns:
        float: Simple interest amount
    """
    # Formula: Simple Interest = P * T * R / 100
    simple_interest = (principal * time_years * annual_rate) / 100
    return simple_interest

def get_user_input():
    """Get input from user for principal, time, and rate."""
    try:
        principal = float(input("Enter the principal amount: $"))
        time_years = float(input("Enter the time period in years: "))
        annual_rate = float(input("Enter the annual rate of interest (%): "))
        
        return principal, time_years, annual_rate
    except ValueError:
        print("Please enter valid numeric values.")
        return None, None, None

def main():
    """Main function to run the simple interest calculator."""
    print("=" * 50)
    print("         SIMPLE INTEREST CALCULATOR")
    print("=" * 50)
    print("Formula: Simple Interest = P × T × R / 100")
    print("Where:")
    print("  P = Principal amount")
    print("  T = Time period in years")
    print("  R = Annual rate of interest (%)")
    print("=" * 50)
    
    while True:
        principal, time_years, annual_rate = get_user_input()
        
        if principal is not None and time_years is not None and annual_rate is not None:
            # Calculate simple interest
            simple_interest = calculate_simple_interest(principal, time_years, annual_rate)
            
            # Display results
            print("\n" + "-" * 40)
            print("CALCULATION RESULTS:")
            print("-" * 40)
            print(f"Principal Amount (P): ${principal:,.2f}")
            print(f"Time Period (T): {time_years} years")
            print(f"Annual Interest Rate (R): {annual_rate}%")
            print(f"Simple Interest: ${simple_interest:,.2f}")
            print(f"Total Amount: ${principal + simple_interest:,.2f}")
            print("-" * 40)
            
            # Ask if user wants to calculate again
            another = input("\nDo you want to calculate again? (y/n): ").lower()
            if another != 'y' and another != 'yes':
                break
        else:
            retry = input("Do you want to try again? (y/n): ").lower()
            if retry != 'y' and retry != 'yes':
                break
    
    print("\nThank you for using the Simple Interest Calculator!")

if __name__ == "__main__":
    main()
