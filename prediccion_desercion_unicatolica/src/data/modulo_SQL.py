import sqlite3 as sql
import csv
import pathlib as pl
import pandas as pd
import runpy as rp

path_db = pl.Path('../../data/raw/data_base.db')

if (path_db.exists()):
    path_db.unlink()
    print('Base de datos antigua eliminada')
    conn = sql.connect(path_db)
else:
    print('Se creara la base de datos')
    conn = sql.connect(path_db)

cursor = conn.cursor()

path_Estudiantes_csv = pl.Path('../../data/raw/Estudiantes Info.csv')
path_Materias_Inscritas_csv = pl.Path('../../data/raw/Materias Inscritas.csv')
path_PGA_csv = pl.Path('../../data/raw/PGA.csv')
path_notas_finales_csv = pl.Path('../../data/raw/Notas Finales.csv')

df_estudiantes = pd.read_csv(path_Estudiantes_csv, encoding='latin-1',low_memory=False,sep=';')
df_materias_inscritas = pd.read_csv(path_Materias_Inscritas_csv, encoding='latin-1',low_memory=False,sep=',')
df_pga = pd.read_csv(path_PGA_csv, encoding='latin-1',low_memory=False,sep=';')
df_notas_finales = pd.read_csv(path_notas_finales_csv, encoding='latin-1',low_memory=False,sep=';')

df_estudiantes.to_sql('Estudiantes_Info',conn,if_exists='replace',index=False)
df_materias_inscritas.to_sql('Materias_Inscritas',conn,if_exists='replace',index=False)
df_pga.to_sql('PGA',conn,if_exists='replace',index=False)
df_notas_finales.to_sql('Notas_Finales',conn,if_exists='replace',index=False)

for i in range(1,6):
    sql_file = pl.Path(f'./modulo_{i}.sql')
    with sql_file.open(encoding='utf-8') as f:
        sql_script = f.read()
        cursor.executescript(sql_script)
    print(f'./modulo_{i}.sql')
        
conn.commit()

df = pd.read_sql_query('SELECT * FROM datos',conn)

out_path = pl.Path('../../data/raw/datos.csv')

df.to_csv(out_path,index=False)

conn.close()

modulo_6 = pl.Path('./modulo_6.py')

rp.run_path(str(modulo_6))