import os
import json

import requests


# CSV


def fetch_csv(api_url, out_file):
    """
    Fetches data from the given API URL, expecting a CSV response,
    and saves the content to a local file.
    """
    try:
        response = requests.get(api_url)
        response.raise_for_status()  # Raise an exception for bad status codes

        # Check if the Content-Type indicates CSV
        if 'text/csv' in response.headers.get('Content-Type', ''):
            with open(out_file, 'w', newline='', encoding='utf-8') as csv_file:
                csv_file.write(response.text)
            print(f"Data saved to '{out_file}'")
            print(f"File size: {os.stat(out_file).st_size // 1e6} MB")
            return True
        elif 'application/json' in response.headers.get('Content-Type', ''):
            print("Warning: Received a JSON response instead of CSV.")
            print(response.json()) # You can process the JSON data here
            return False
        else:
            print(f"Warning: Received an unexpected Content-Type: {response.headers.get('Content-Type')}")
            print("Response content:")
            print(response.text)
            return False

    except requests.exceptions.RequestException as e:
        print(f"Error fetching data from {api_url}: {e}")
        return False


# JSON


def fetch_json(api_url, out_file):
    """Fetches data from the given API URL and saves it to a JSON file."""
    try:
        response = requests.get(api_url)
        response.raise_for_status()  # Raise an exception for bad status codes

        data = response.json()
        with open(out_file, "w") as f:
            json.dump(data, f, indent=4)
        print(f"Data saved to {out_file}")
        print(f"File size: {os.stat(out_file).st_size // 1e6} MB")
        return data
    except requests.exceptions.RequestException as e:
        print(f"Error fetching data from {api_url}: {e}")
        return None
    except json.JSONDecodeError as e:
        print(f"Error decoding JSON from the response of {api_url}: {e}")
        return None

def generate_out_file(base_name="data.json", counter=0):
    """Generates output filenames with a counter."""
    name, ext = base_name.split(".")
    return f"{name}_{counter}.{ext}"

def fetch_json_loop(api_url, out_file="data.json", max_loop=9):
    """Fetches data from a paginated API, saving each page to a separate file."""
    loop = 0
    current_url = api_url
    while loop <= max_loop and current_url:
        out_filename = generate_out_file(out_file, loop)
        data = fetch_json(current_url, out_filename)

        if data and "@odata.nextLink" in data:
            current_url = data["@odata.nextLink"]
            print(f"Executed nextLink loop number {loop + 1}")
            loop += 1
        else:
            print("No more nextLink found, or an error occurred.")
            break

    if loop > max_loop:
        print(f"Reached maximum loop limit of {max_loop}.")


# Usage:
# api_endpoint = "https://xmart-api-public.who.int/WASHMART/GLAAS_EN_2"
# fetch_json_loop(api_endpoint, "data/glaas.json")


# Example usage:
csv_url = "https://xmart-api-public.who.int/WASHMART/GLAAS_EN_2?$format=csv"
fetch_csv(csv_url, "data/glaas.csv")


# To learn more about xmart API: https://extranet.who.int/xmart4/docs/xmart_api/use_API.html#odata-syntax
