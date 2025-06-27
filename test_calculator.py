#!/usr/bin/env python3
"""
Test file for Simple Interest Calculator

This file contains test cases to validate the simple interest calculation.
"""

import sys
import os

# Add the current directory to the Python path to import our calculator
sys.path.append(os.path.dirname(os.path.abspath(__file__)))

from simple_interest_calculator import calculate_simple_interest

def test_simple_interest_calculation():
    """Test the simple interest calculation with known values."""
    
    print("Testing Simple Interest Calculator")
    print("=" * 50)
    
    # Test cases: (principal, time, rate, expected_result)
    test_cases = [
        (1000, 2, 5, 100),      # $1000 for 2 years at 5% = $100
        (5000, 3, 7, 1050),     # $5000 for 3 years at 7% = $1050
        (2500, 1.5, 4, 150),    # $2500 for 1.5 years at 4% = $150
        (10000, 5, 3.5, 1750),  # $10000 for 5 years at 3.5% = $1750
        (500, 0.5, 10, 25),     # $500 for 0.5 years at 10% = $25
    ]
    
    all_tests_passed = True
    
    for i, (principal, time, rate, expected) in enumerate(test_cases, 1):
        result = calculate_simple_interest(principal, time, rate)
        
        print(f"\nTest Case {i}:")
        print(f"  Principal: ${principal:,.2f}")
        print(f"  Time: {time} years")
        print(f"  Rate: {rate}%")
        print(f"  Expected: ${expected:,.2f}")
        print(f"  Calculated: ${result:,.2f}")
        
        if abs(result - expected) < 0.01:  # Allow for small floating point differences
            print("  Status: ✅ PASSED")
        else:
            print("  Status: ❌ FAILED")
            all_tests_passed = False
    
    print("\n" + "=" * 50)
    if all_tests_passed:
        print("🎉 All tests PASSED! The calculator is working correctly.")
    else:
        print("❌ Some tests FAILED. Please check the calculation logic.")
    
    return all_tests_passed

def demonstrate_calculator():
    """Demonstrate the calculator with example calculations."""
    
    print("\n" + "=" * 50)
    print("DEMONSTRATION: Simple Interest Calculator")
    print("=" * 50)
    
    examples = [
        {
            "scenario": "Personal Loan",
            "principal": 15000,
            "time": 3,
            "rate": 6.5,
            "description": "Borrowing $15,000 for 3 years at 6.5% annual interest"
        },
        {
            "scenario": "Savings Account",
            "principal": 8000,
            "time": 2.5,
            "rate": 2.75,
            "description": "Investing $8,000 in a savings account for 2.5 years at 2.75%"
        },
        {
            "scenario": "Short-term Investment",
            "principal": 25000,
            "time": 1,
            "rate": 4.2,
            "description": "Short-term investment of $25,000 for 1 year at 4.2%"
        }
    ]
    
    for example in examples:
        simple_interest = calculate_simple_interest(
            example["principal"], 
            example["time"], 
            example["rate"]
        )
        total_amount = example["principal"] + simple_interest
        
        print(f"\n📊 {example['scenario']}:")
        print(f"   {example['description']}")
        print(f"   Principal Amount: ${example['principal']:,.2f}")
        print(f"   Time Period: {example['time']} years")
        print(f"   Interest Rate: {example['rate']}%")
        print(f"   Simple Interest: ${simple_interest:,.2f}")
        print(f"   Total Amount: ${total_amount:,.2f}")

if __name__ == "__main__":
    # Run tests first
    test_simple_interest_calculation()
    
    # Then demonstrate with examples
    demonstrate_calculator()
    
    print("\n" + "=" * 50)
    print("To use the interactive calculator, run:")
    print("python simple_interest_calculator.py")
    print("\nTo use the web version, open:")
    print("simple_interest_calculator.html")
    print("=" * 50)
