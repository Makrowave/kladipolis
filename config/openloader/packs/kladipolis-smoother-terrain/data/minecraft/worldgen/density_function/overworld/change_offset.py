#!/usr/bin/env python3
import json
import sys
from typing import Any

# ------------------------------------------------------------------------------
# CONFIGURATION
# ------------------------------------------------------------------------------
# Percentage factor to apply whenever SMALL and BIG differ on a numeric value.
# E.g. 0.8 will reduce any differing small‐value to 80% of its original.
PERCENTAGE = 0.25


def adjust_values(small: Any, big: Any) -> Any:
    """
    Recursively compare 'small' vs. 'big'. Whenever both are numeric (int or float)
    and small != big, replace small with (small * PERCENTAGE). Otherwise, keep small.
    For dicts/lists, recurse into each element.
    """
    # If both are dicts, recurse on each key in 'small' (assumes same structure in 'big')
    if isinstance(small, dict) and isinstance(big, dict):
        result = {}
        for key in small:
            # If the key is missing in 'big', just copy from 'small'
            if key not in big:
                result[key] = small[key]
            else:
                result[key] = adjust_values(small[key], big[key])
        return result

    # If both are lists, recurse element‐by‐element (assumes same length)
    elif isinstance(small, list) and isinstance(big, list):
        length = min(len(small), len(big))
        new_list = []
        # For indices where both exist
        for i in range(length):
            new_list.append(adjust_values(small[i], big[i]))
        # If 'small' is longer, copy over the rest unchanged
        if len(small) > length:
            new_list.extend(small[length:])
        return new_list

    # If both are numbers (int or float), compare
    elif isinstance(small, (int, float)) and isinstance(big, (int, float)):
        # If they differ, reduce small by PERCENTAGE
        if small != big:
            return small * PERCENTAGE
        else:
            return small

    # For anything else (strings, bools, etc.), just copy from 'small'
    else:
        return small


def main():
    if len(sys.argv) != 4:
        print(f"Usage: {sys.argv[0]} <small.json> <big.json> <output.json>")
        sys.exit(1)

    small_path = sys.argv[1]
    big_path = sys.argv[2]
    output_path = sys.argv[3]

    # Load both files
    with open(small_path, "r", encoding="utf-8") as f_small:
        small_data = json.load(f_small)

    with open(big_path, "r", encoding="utf-8") as f_big:
        big_data = json.load(f_big)

    # Adjust values
    adjusted = adjust_values(small_data, big_data)

    # Write the resulting structure back to OUTPUT
    with open(output_path, "w", encoding="utf-8") as f_out:
        json.dump(adjusted, f_out, indent=2)

    print(f"Processed differences and wrote result to '{output_path}'.")


if __name__ == "__main__":
    main()
