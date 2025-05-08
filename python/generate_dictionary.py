import os
import json

import re
import pandas as pd
from python.blablador import Blablador
from python import config

def get_limited_unique_values(in_file, max_unique_values=None, dtype=None):
    """
    Reads a CSV file and returns a dictionary of unique values from each column,
    optionally limited to a specified number.

    Args:
        in_file (str): The path to the CSV file.
        max_unique_values (int, optional): The maximum number of unique values to return
                                for each column. Defaults to None (all unique values).
        dtype (dict, optional): Pandas dtype.

    Returns:
        dict: A dictionary where keys are column names and values are lists
              of unique values. Returns None if the file cannot be read.
    """
    try:
        data_in = pd.read_csv(in_file, dtype=dtype)
    except FileNotFoundError:
        print(f"Error: File not found at {in_file}")
        return None
    except Exception as e:
        print(f"Error reading file {in_file}: {e}")
        return None

    unique_dict = {}
    for col in data_in.columns:
        unique_values = data_in[col].unique().tolist()
        if max_unique_values is not None and len(unique_values) > max_unique_values:
            unique_dict[col] = unique_values[:max_unique_values]
        else:
            unique_dict[col] = unique_values

    return unique_dict

def markdown_code_block_to_json(markdown_string):
    """
    Extracts JSON content from a Markdown string, handling code blocks.

    Args:
        markdown_string (str): The Markdown string potentially containing JSON.

    Returns:
        dict or None: A Python dictionary if valid JSON is found, otherwise None.
    """
    # Use a regular expression to find code blocks with "json" or no language specified
    json_match = re.search(r"```(?:json)?\n(.*?)\n```", markdown_string, re.DOTALL)
    if json_match:
        try:
            return json.loads(json_match.group(1).strip())
        except json.JSONDecodeError as e:
            print(f"Error decoding JSON: {e}")
            return None
    else:
        try:
            return json.loads(markdown_string.strip())
        except json.JSONDecodeError as e:
            print(f"Error decoding JSON: {e}")
            return None

def write_descriptions_to_csv(json_data, out_file="dictionary.csv"):
    """
    Writes variable descriptions from a JSON dictionary to a CSV file.

    Args:
        json_data (dict): A dictionary where keys are variable names and values are their descriptions.
        out_file (str, optional): The path to the CSV file. Defaults to "dictionary.csv".
    """
    try:
        # Check if the file exists.  If it does, we'll append to it.
        file_exists = os.path.exists(out_file)

        # Create a Pandas DataFrame from the JSON data
        data = {'variable_name': list(json_data.keys()), 'description': list(json_data.values())}
        df = pd.DataFrame(data)

        # Write the dataframe to CSV.  Include the header only if the file didn't exist.
        df.to_csv(out_file, mode='a', header=not file_exists, index=False, encoding='utf-8')

        print(f"Descriptions successfully written to {out_file}")

    except Exception as e:
        print(f"Error writing to CSV file: {e}")


in_file = os.getcwd()+"/inst/extdata/glaas.csv" 

max_unique_values=7
limited_unique_values = get_limited_unique_values(in_file, max_unique_values=max_unique_values)
limited_unique_values

# Config Blablador
blablador = Blablador(config.API_KEY, model=1, temperature=0, top_p=0.5, max_tokens=999)

context = """
You will receive a Python dictionary where the keys are the names of columns from a CSV file, and the values are lists containing up to `max_unique_values`=%d unique example values from those columns.

Your primary goal is to generate clear, concise, and informative data dictionary entries for each column. These descriptions will be used to help individuals unfamiliar with the dataset understand the meaning and type of information each column contains for documentation purposes. Aim for descriptions that are no more than two sentences long.

Consider the following steps for each column:

1.  **Analyze the column name:** What does the name itself suggest about the data it might contain?
2.  **Examine the provided example values:** Look for patterns, units, categories, or ranges that can help you understand the nature of the data.
3.  **Infer the likely meaning and context:** Based on the column name and example values, what real-world concept or measurement does this column likely represent? Try to infer the broader domain or field of study this data might belong to (e.g., environmental science, social surveys, medical records).
4.  **Determine the data type:** Clearly identify the likely data type of the column (e.g., categorical, continuous numerical, discrete numerical, text, boolean, date).
5.  **Write a concise description:** Combine your inferences into a brief description (1-2 sentences) that explains the meaning of the column and its data type. Use clear and accessible language, avoiding overly technical jargon unless essential.

For example, if you receive the following dictionary (with a `max_unique_values`=7):

{'species': ['Adelie', 'Gentoo', 'Chinstrap'],
 'island': ['Torgersen', 'Biscoe', 'Dream'],
 'bill_length_mm': [39.1, 39.5, 40.3, nan, 36.7, 39.3, 38.9],
 'bill_depth_mm': [18.7, 17.4, 18.0, nan, 19.3, 20.6, 17.8],
 'flipper_length_mm': [181.0, 186.0, 195.0, nan, 193.0, 190.0, 180.0],
 'body_mass_g': [3750.0, 3800.0, 3250.0, nan, 3450.0, 3650.0, 3625.0],
 'sex': ['male', 'female', nan],
 'year': [2007, 2008, 2009]}

You should aim to provide a JSON that looks like this:

{
  "species": "The species of penguin observed, with categories including Adelie, Chinstrap, and Gentoo.",
  "island": "The specific island where the penguin was observed, such as Torgersen, Biscoe, or Dream.",
  "bill_length_mm": "The length of the penguin's bill (beak) measured in millimeters. This is a continuous numerical measurement.",
  "bill_depth_mm": "The depth of the penguin's bill measured in millimeters. This is a continuous numerical measurement.",
  "flipper_length_mm": "The length of the penguin's flipper measured in millimeters. This is a discrete numerical measurement.",
  "body_mass_g": "The body mass of the penguin recorded in grams. This is a discrete numerical measurement.",
  "sex": "The biological sex of the penguin, categorized as either male or female.",
  "year": "The year in which the penguin observation was recorded. This is a discrete numerical value representing the year of data collection."
}

The dictionary you will process is:

%s

Your response must be in JSON format, containing a dictionary where each key is a column name from the input dictionary, and the value is the generated description for that column. 
Output *only* this JSON dictionary.
""" % (max_unique_values, limited_unique_values)

response = blablador.completion(context)

descriptions = markdown_code_block_to_json(response)

if descriptions:
    write_descriptions_to_csv(descriptions, out_file= os.getcwd()+"/python/dictionary.csv")
else:
    print("No valid JSON data to write to CSV.")