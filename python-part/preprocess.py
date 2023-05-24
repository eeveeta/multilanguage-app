import pandas as pd
import sys

def clean_data(file_name):
    df = pd.read_csv(file_name)
    clean_df = df.dropna()
    clean_df.to_csv("cleaned_data.csv", index=False)

if __name__ == "__main__":
    clean_data(sys.argv[1])

