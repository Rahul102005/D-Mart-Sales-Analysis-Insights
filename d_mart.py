import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

# Load dataset
df = pd.read_csv(r"D:\Data Analysis Project\dmart project\Dmart_Sales_Analysis_Final_4200plus.csv")

# Initial checks
print(df.head())
print(df.shape)
print(df.info())
print(df.describe())

# Check missing values
print(df.isnull().sum())

# Handle missing values
df['payment_mode'] = df['payment_mode'].fillna('Unknown')
df['customer_type'] = df['customer_type'].fillna('Regular')

# Check duplicates
print("Duplicate rows:", df.duplicated().sum())

# Remove duplicates
df = df.drop_duplicates()

# Date conversion
df['date'] = pd.to_datetime(df['date'])

# Feature engineering
df['month'] = df['date'].dt.month

# Business metrics
print("Total Sales:", df['total_sales'].sum())
print(df.groupby('store_city')['total_sales'].sum().sort_values(ascending=False))
print(df.groupby('category')['total_sales'].sum().sort_values(ascending=False))
print(df['payment_mode'].value_counts())
print(df.groupby('customer_type')['total_sales'].sum())

df.to_csv("Dmart_Sales_Cleaned.csv", index=False)
print("Cleaned file saved")

df.to_csv(
    r"C:\Users\krahu\Downloads\Dmart_Sales_Cleaned.csv",
    index=False
)



import pandas as pd
from sqlalchemy import create_engine

file_path = r"C:\Users\krahu\Downloads\Dmart_Sales_Cleaned.csv"

df = pd.read_csv(file_path)

print("File Loaded Successfully ✅")
print(df.head())

# Convert date column
df['date'] = pd.to_datetime(df['date'], errors='coerce')

username = "root"
password = "1234"
host = "127.0.0.1"
database = "dmart_db"

engine = create_engine(f"mysql+mysqlconnector://{username}:{password}@{host}/{database}")


df.to_sql(
    name="dmart_sales",
    con=engine,
    if_exists="replace",   # ← CHANGE THIS
    index=False
)

print("Data Uploaded Successfully 🚀")
