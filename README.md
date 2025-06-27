# Simple Interest Calculator

A comprehensive simple interest calculator implemented in Python, HTML/JavaScript, and Shell Script.

## Formula

**Simple Interest = P × T × R / 100**

Where:
- **P** = Principal amount (the initial sum of money)
- **T** = Time period in years
- **R** = Annual rate of interest (as a percentage)

## Features

### Python Version (`simple_interest_calculator.py`)
- Interactive command-line calculator
- Input validation and error handling
- Formatted output with currency display
- Option to perform multiple calculations
- Professional console interface

### Web Version (`simple_interest_calculator.html`)
- Modern, responsive web interface
- Real-time input validation
- Beautiful gradient design
- Mobile-friendly layout
- Instant calculation results
- Clear and reset functionality

### Shell Script Version (`simple-interest.sh`)
- Cross-platform Unix/Linux/macOS compatible script
- Colorized output for better readability
- Multiple usage modes: interactive, command-line, and examples
- Input validation with helpful error messages
- Support for floating-point calculations using `bc`
- Built-in example calculations

### Test Suite (`test_calculator.py`)
- Automated test cases to verify calculations
- Demonstration with real-world examples
- Validation of the calculation logic

## Usage

### Running the Python Calculator
```bash
python simple_interest_calculator.py
```

### Using the Web Calculator
Open `simple_interest_calculator.html` in any modern web browser.

### Running the Shell Script Calculator

```bash
# Interactive mode
./simple-interest.sh

# Command line mode (principal, time, rate)
./simple-interest.sh 1000 2 5

# Show examples
./simple-interest.sh --examples

# Show help
./simple-interest.sh --help
```

**Note**: On Unix/Linux/macOS, make the script executable first: `chmod +x simple-interest.sh`

### Running Tests
```bash
python test_calculator.py
```

## Examples

### Example 1: Personal Loan
- Principal: $15,000
- Time: 3 years
- Rate: 6.5%
- **Simple Interest: $2,925**
- **Total Amount: $17,925**

### Example 2: Savings Account
- Principal: $8,000
- Time: 2.5 years
- Rate: 2.75%
- **Simple Interest: $550**
- **Total Amount: $8,550**

## Files

- `simple_interest_calculator.py` - Command-line Python calculator
- `simple_interest_calculator.html` - Web-based calculator
- `simple-interest.sh` - Shell script calculator
- `test_calculator.py` - Test suite and examples
- `README.md` - This documentation

## Requirements

- Python 3.6+ (for Python version)
- Modern web browser (for HTML version)
- Unix/Linux/macOS (for Shell Script version)
- No external dependencies required

## Contributing

All contributions, bug reports, bug fixes, documentation improvements, enhancements, and ideas are welcome. We encourage participation from developers of all experience levels and backgrounds.

Please read our [Code of Conduct](CODE_OF_CONDUCT.md) before contributing to ensure a welcoming environment for everyone.

### How to Contribute

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Make your changes
4. Test your changes (run `python test_calculator.py`)
5. Commit your changes (`git commit -m 'Add some amazing feature'`)
6. Push to the branch (`git push origin feature/amazing-feature`)
7. Open a Pull Request

---

2023 XYZ, Inc.
