import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

# Load dataset
df = pd.read_csv(r"C:\Users\krahu\Downloads\Dmart_Sales_Analysis_Final_4200plus.csv")

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


