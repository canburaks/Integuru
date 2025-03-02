#!/usr/bin/env python3
"""
Example usage of the generated integration code.
This script demonstrates how to use the code generated by Integuru.
"""

import json
import os
from generated_code import fetch_mevzuat_data


def main():
    # Method 1: Load cookies from cookies.json file
    try:
        with open("cookies.json", "r", encoding="utf-8") as f:
            cookies_data = json.load(f)

        # Convert cookies to string format
        cookie_string = "; ".join(
            [f"{cookie['name']}={cookie['value']}" for cookie in cookies_data]
        )

        print("Using cookies from cookies.json file")
    except (FileNotFoundError, json.JSONDecodeError):
        # Method 2: Use hardcoded cookie string (less recommended)
        print("cookies.json not found or invalid. Using example cookie string.")
        print(
            "WARNING: This will likely fail. Generate proper cookies using 'make browse' first."
        )
        cookie_string = "example_cookie=value"

    # Fetch data using the generated code
    try:
        print("\nFetching legislation data...")
        result = fetch_mevzuat_data(cookie_string)

        # Display the results
        print("\nResults:")
        for key, value in result.items():
            print(f"{key}: {value}")

    except Exception as e:
        print(f"\nError: {e}")
        print("\nTips to fix this error:")
        print("1. Run 'make browse' and perform the desired action in the browser")
        print("2. Run 'make generate_code PROMPT=\"your specific action\"'")
        print("3. Try running this example again")


if __name__ == "__main__":
    main()
