import os

import pandas as pd
from blablador_python_bindings import blablador, config

def get_limited_unique_values(file_path, limit=None, dtype=None):
    """
    Reads a CSV file and returns a dictionary of unique values from each column,
    optionally limited to a specified number.

    Args:
        file_path (str): The path to the CSV file.
        limit (int, optional): The maximum number of unique values to return
                                for each column. Defaults to None (all unique values).
        dtype (dict, optional): Pandas dtype.

    Returns:
        dict: A dictionary where keys are column names and values are lists
              of unique values. Returns None if the file cannot be read.
    """
    try:
        data_in = pd.read_csv(file_path, dtype=dtype)
    except FileNotFoundError:
        print(f"Error: File not found at {file_path}")
        return None
    except Exception as e:
        print(f"Error reading file {file_path}: {e}")
        return None

    unique_dict = {}
    for col in data_in.columns:
        unique_values = data_in[col].unique().tolist()
        if limit is not None and len(unique_values) > limit:
            unique_dict[col] = unique_values[:limit]
        else:
            unique_dict[col] = unique_values

    return unique_dict

file_path = os.getcwd()+"/inst/extdata/glaas.csv" 
limited_unique_values = get_limited_unique_values(file_path, limit=7)
print(limited_unique_values)

# Retrieve available models
models = blablador.Models(api_key=config.API_KEY).get_model_ids()
print(models)

# Generate completions
completion = blablador.Completions(api_key=config.API_KEY, model=models[3])
response = completion.get_completion("The best cuisine in the world is")
print(response)