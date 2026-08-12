import pandas as pd
import numpy as np
from sqlalchemy import create_engine

#automated connection to sql database
DB_URI = "postgresql://postgres@localhost:5432/financial_zambian_economy_database?password="
engine = create_engine(DB_URI)

print(">> Extracting live tables from SQL database...")
df_macro = pd.read_sql("SELECT * FROM boz_macro_indicators", engine)
df_stock = pd.read_sql("SELECT * FROM luse_stock_portfolio", engine)
df_loan = pd.read_sql("SELECT * FROM optasia_replicated_loan_book", engine)

#Convert all tracking keys to pandas datatime standard
df_macro['record_date'] = pd.to_datetime(df_macro['record_date'])
df_stock['record_date'] = pd.to_datetime(df_stock['record_date'])
df_loan['record_date'] = pd.to_datetime(df_loan['record_date'])

print(">> Transforming and engineering transmission features...")
#Feature engineering: 1. Compute Consumer Default Risk Ratio
df_loan['optasia_npl_ratio_pct'] = (df_loan['delinquent_30d_plus_zmw'] / df_loan['total_disbursed_loans_zmw']) * 100

#Feature Engineering: 2. calculate 1-quarterly(90day) macro transmission lag
df_macro['boz_rate_lagged_1q'] = df_macro['boz_policy_rate'].shift(1)

#Merge and export structural analytical datasets
print(">> Merging database tables into optimazed production assets...")
df_merged = pd.merge(df_stock, df_macro, on= 'record_date')
df_final = pd.merge(df_merged, df_loan, on='record_date')


df_final.to_csv('financial_zambian_data.csv', index=False)
print(">> Pipeline Completed: File 'financial_zambian_data.csv' has been successfully created and ready for dashboard ingestion.")