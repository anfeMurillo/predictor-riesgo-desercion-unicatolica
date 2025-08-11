.. Modelos predictivos de desercion universitaria Unicatolica documentation master file, created by
   sphinx-quickstart on Sat Jul 26 19:39:59 2025.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Modelos Predictivos de Deserción
##########################################################

1. Audiencia y Partes Interesadas
=================================

Audiencia principal
-------------------

   1. Científicos/as de Datos.
   2. Ingenieros/as de ML.
   3. Desarrolladores/as de Software.

Stakeholders Clave
-------------------

   1. Director/a de la facultad de ingenieria en sistemas.
   2. Decano/a de la facultad de ingenieria.
   3. Docente del semillero Ciencia de Datos y ML. 

2. Estructura del repositorio
=============================

📂 predictor-riesgo-desercion
------------------------------

Carpeta principal del proyecto creada apartir de mi template de Cookiecutter 🍪.

::

   cookiecutter https://github.com/anfeMurillo/data_science_template.git

.. note::
   Posterirmente tuvo algunas modificaciones para temas de documentacion.

📁 data
~~~~~~~~

Carpeta donde se almacenas los datos a ser utilizados.

📁 processed
^^^^^^^^^^^^^

Carpeta donde se guardan los archivos una vez procesados para su utilizacion.

.. note::
   Por cuestiones de privacidad no encontraras archivos que contengan datos de los estudiantes de esta universidad. 
   Pero puedes replicarlo creando un data set desde una base de dato con el formato esperado.

📁 raw
^^^^^^^

Carpeta donde se colocan los datos originales para ser procesados.

📁 docs
^^^^^^^^

Carpeta generada con Sphinx para la creacion de esta documentacion.

📁 models
~~~~~~~~~~

Modelos entrenados y versionados.

📁 notebooks
~~~~~~~~~~~~~

Notebooks para la experimentacion en la creacion de los modelos usados para exploración de datos, pruebas y prototipos.

📁 reports
~~~~~~~~~~~~

Reportes creados como resultados finales y presentaciones.

📁 src
~~~~~~~

Codigo principal de pipeline para la recoleccion , extructuracion de los datos , el entrenamiento , ejecucion de los modelos y la generacion de los reportes.

📁 data
^^^^^^^^

Contiene los scripts SQL para la extraccion y transformacion de datos desde la base de datos.

📁 features
^^^^^^^^^^^

Scripts para la ingenieria de caracteristicas y preprocesamiento de datos.

📁 models
^^^^^^^^^

Scripts para el entrenamiento, evaluacion y serializacion de los modelos de machine learning.

📁 visualization
^^^^^^^^^^^^^^^^

Scripts para la generacion de graficos y visualizaciones de los resultados.

Tecnologías Utilizadas
----------------------

**Lenguajes de Programación**
   - Python 3.13 para análisis de datos y machine learning
   - SQL para extracción y transformación de datos

**Librerías y Frameworks**
   - **Pandas**: Manipulación y análisis de datos
   - **NumPy**: Operaciones numéricas
   - **Scikit-learn**: Algoritmos de machine learning
   - **Matplotlib/Seaborn**: Visualización de datos
   - **Jupyter Notebooks**: Experimentación y prototipado

**Base de Datos**
   - SQLite para almacenamiento de datos

**Documentación**
   - Sphinx para generación de documentación
   - reStructuredText como formato de documentación

3. Modelos Implementados
========================

Regresión Logística
-------------------

**Descripción**
   Modelo estadístico utilizado para problemas de clasificación binaria. Ideal para este caso de uso debido a su interpretabilidad y capacidad de proporcionar probabilidades de deserción.

**Ventajas**
   - Alta interpretabilidad de coeficientes
   - Rápido entrenamiento y predicción
   - Proporciona probabilidades calibradas
   - Robusto ante outliers

**Implementación**
   Ubicado en: ``notebooks/regresion_logistica.ipynb``

.. note::
   Se configuró con ``max_iter=1000`` para asegurar convergencia del algoritmo de optimización.

Modelos Futuros
---------------

Se planea implementar los siguientes modelos para comparar rendimiento:

- **Random Forest**: Para capturar relaciones no lineales
- **Gradient Boosting**: Para optimizar métricas específicas
- **Support Vector Machine**: Para casos con datos de alta dimensionalidad
- **Redes Neuronales**: Para patrones complejos en los datos

4. Resultados y Métricas
========================

Métricas de Evaluación
----------------------

Para evaluar el rendimiento de los modelos se utilizan las siguientes métricas:

**Precision**
   Proporción de predicciones positivas que fueron correctas. Importante para minimizar falsas alarmas.

**Recall**
   Proporción de casos positivos reales que fueron identificados correctamente. Crítico para no perder estudiantes en riesgo.

**F1-Score**
   Media armónica entre precisión y recall. Métrica balanceada para evaluación general.

**Accuracy**
   Proporción total de predicciones correctas.

**AUC-ROC**
   Área bajo la curva ROC. Mide la capacidad del modelo de distinguir entre clases.

.. important::
   Dado el contexto del problema, se prioriza el **Recall** sobre la **Precisión**, ya que es preferible identificar a todos los estudiantes en riesgo (incluso con algunos falsos positivos) que perder casos reales de deserción.

5. Conclusiones
=================================

Pendiente

6. Referencias y Recursos Adicionales
=====================================

Documentación Técnica
---------------------

- `Scikit-learn Documentation <https://scikit-learn.org/stable/>`_
- `Pandas Documentation <https://pandas.pydata.org/docs/>`_
- `SQLite Documentation <https://sqlite.org/docs.html>`_

Contacto y Soporte
------------------

Para consultas técnicas o académicas sobre este proyecto:

- **Desarrollador Principal**: Andres Felipe Murillo
- **Institución**: Fundación Universitaria Católica Lumen Gentium
- **Semillero**: Ciencia de Datos y Machine Learning

.. note::
   Esta documentación es un documento vivo que se actualiza conforme evoluciona el proyecto.

.. toctree::
   :maxdepth: 2
   :caption: Contents: