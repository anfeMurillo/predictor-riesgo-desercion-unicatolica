import pandas as pd
import pathlib as p

path = p.Path('../../data/raw/datos.csv')

df = pd.read_csv(path)

cols_int = ['id','edad','genero','estrato','residencia','estado_civil','periodo_inicio','repitencias_total','desertor']
for col in cols_int:
	if col in df.columns:
		df[col] = pd.to_numeric(df[col], errors='coerce').fillna(0).astype(int)

df['']

destiny = p.Path('../../data/processed/data_set.csv')

df.to_csv(destiny, index=False)