import pandas as pd
import pathlib as p

path = p.Path('../../data/raw/datos.csv')

df = pd.read_csv(path)

cols_com = df.columns[9:28].to_list()
for col in cols_com:
	if col in df.columns:
		df[col] = df[col].str.replace(',', '.').astype(float)

cols_flt = df.columns[9:28].to_list()
for col in cols_flt:
	if col in df.columns:
		df[col] = pd.to_numeric(df[col], errors='coerce').astype(float)

cols_int = ['id','edad','genero','estrato','residencia','estado_civil','periodo_inicio','repitencias_total','desertor']
for col in cols_int:
	if col in df.columns:
		df[col] = df[col].fillna(0).astype(int)


destiny = p.Path('../../data/processed/data_set.csv')

df.to_csv(destiny, index=False)