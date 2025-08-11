import pandas as pd
import pathlib as p

path = p.Path('../../data/raw/datos.csv')

df = pd.read_csv(path)

df = df.apply(pd.to_numeric,errors='coerce').astype(float)

destiny = p.Path('../../data/processed/data_set.csv')

df.to_csv(destiny)