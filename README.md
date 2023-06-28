# CardsAgainstHumanity_Proofyourstatesucks
# Repositorio de Consultas de Base de Datos

Este repositorio fue creado como un ejercicio para el Módulo I del curso Ciencia de Datos de BEDU. En su primera sección se encuentran consultas SQL para la base de datos en MySQL Workbench. Las consultas están diseñadas para analizar diferentes aspectos relacionados con puntos de vista políticos, nivel educativo, perspectivas sobre el aborto, afiliación a partidos políticos, género, opiniones sobre la separación del Estado y la Iglesia, así como sobre la pena de muerte.
En la segunda sección del trabajo se incluyen las consultas de MongoDB utilizando la misma base de datos para el análisis de datos relacionados con opiniones sobre embarazos accidentales y leyes del aborto. Las consultas se dividen en tres categorías: promedio por género de opiniones sobre embarazos accidentales con diferentes métodos anticonceptivos, estados con diferentes perspectivas sobre las leyes del aborto y personas que ven la pena de muerte según su percepción política.

## Consultas Disponibles en MySQL

1. **Agrupar por puntos de vista político según nivel educativo - Tabla PoliView_by_Education**

   Esta consulta agrupa los datos por puntos de vista político y nivel educativo de los encuestados.
   <img width="724" alt="Captura de pantalla 2023-06-26 a la(s) 6 41 16 p m" src="https://github.com/Yo-17/CardsAgainstHumanity_Proofyourstatesucks/assets/131808869/2e8990b2-4722-49b3-a9e8-b5d083a98c5f">


2. **Agrupar por grado de educación según perspectiva del aborto - Tabla AbortionViews_by_Education**

   Esta consulta agrupa los datos por grado de educación y perspectiva sobre el aborto de los encuestados.
   <img width="1436" alt="Captura de pantalla 2023-06-26 a la(s) 6 44 04 p m" src="https://github.com/Yo-17/CardsAgainstHumanity_Proofyourstatesucks/assets/131808869/e029c61c-5b88-4c46-a23a-69cb2b477080">


3. **Agrupar por opinión de la separación del Estado y la Iglesia según afiliación a partido político - SepChurchState_by_PoliticalParty**

   Esta consulta agrupa los datos por opinión sobre la separación del Estado y la Iglesia y afiliación a partido político de los encuestados.
  
La consulta arrojará la siguiente tabla, en esta no se encuentran las columnas de porcentaje, sólo las de los conteos, para ver los porcentajes hemos creado tres vistas que se presentan al final de esta sección:

<img width="717" alt="Captura de pantalla 2023-06-26 a la(s) 6 51 49 p m" src="https://github.com/Yo-17/CardsAgainstHumanity_Proofyourstatesucks/assets/131808869/494b2f3c-7a77-425b-8423-0bce62265d22">


4. **Criminalización del Aborto - Opiniones por género - PatientPenalty_by_Gender**

   Esta consulta muestra las opiniones sobre la criminalización del aborto, agrupadas por género de los encuestados.
   
<img width="1368" alt="Captura de pantalla 2023-06-26 a la(s) 11 53 23 p m" src="https://github.com/Yo-17/CardsAgainstHumanity_Proofyourstatesucks/assets/131808869/49f9db93-017e-44da-8ce4-dcd1bd8d5ea1">


5. **Organizar de mayor a menor los Estados con mayor número de personas que aprueban la anulación de la sentencia de Roe v. Wade - Yes_CourtApproval_by_State**

   Esta consulta organiza los estados de mayor a menor según el número de personas que aprueban la anulación de la sentencia de Roe v. Wade:

<img width="1373" alt="Captura de pantalla 2023-06-26 a la(s) 11 54 27 p m" src="https://github.com/Yo-17/CardsAgainstHumanity_Proofyourstatesucks/assets/131808869/6b591380-13e6-4e4e-9a5b-5bb1430660a1">


6. **¿Qué tan de acuerdo se encuentran las personas encuestadas con las leyes sobre el aborto en sus estados? - StateLawViews_by_State**

   Esta consulta muestra el nivel de acuerdo de las personas encuestadas con las leyes sobre el aborto en sus respectivos estados.

<img width="1431" alt="Captura de pantalla 2023-06-26 a la(s) 11 58 42 p m" src="https://github.com/Yo-17/CardsAgainstHumanity_Proofyourstatesucks/assets/131808869/859bbf04-d540-4677-9183-ee192e5b5c53">


7. **La opinión sobre la pena de muerte agrupada por posicionamiento ideológico de los participantes - DeathPenaltyViews_by_PoliticalViews**

   Esta consulta agrupa la opinión sobre la pena de muerte según el posicionamiento ideológico de los participantes.

   <img width="1424" alt="Captura de pantalla 2023-06-27 a la(s) 12 01 36 a m" src="https://github.com/Yo-17/CardsAgainstHumanity_Proofyourstatesucks/assets/131808869/40d48e0c-d451-478e-ad45-d47fadb037e9">


## Vistas Disponibles en MySQL

**1. Vista de los porcentajes de personas que están de acuerdo o en contra de la separación del Estado y la Iglesia**

**Para consultar los porcentajes de participantes que desean frenar la separación del Estado y de la Iglesia según su afiliación política se puede utilizar la siguiente vista:**

   ```
   CREATE VIEW Stop_Enforcing_Percentage AS
   SELECT PoliticalParty, Stop_Enforcing_count,
   round(((Stop_Enforcing_count * 100) / temp.Stop_Enforcing_countSUM),2) AS Stop_Enforcing_Percentage
   FROM Stop_Enforcing
   CROSS JOIN (SELECT SUM(Stop_Enforcing_count) AS Stop_Enforcing_countSUM FROM Stop_Enforcing) temp;
   ```

Esto nos arroja la siguiente tabla:
<img width="1429" alt="Captura de pantalla 2023-06-26 a la(s) 11 42 53 p m" src="https://github.com/Yo-17/CardsAgainstHumanity_Proofyourstatesucks/assets/131808869/09940649-5405-40b1-b240-865bf30df419">


 **Para consultar los porcentajes de participantes que desean que haya una separación del Estado y de la Iglesia según su afiliación política se puede utilizar la siguiente vista:**
   
   ```
   CREATE VIEW Enforce_Separation_Percentage AS
   SELECT PoliticalParty, Enforce_Separation_count,
   round(((Enforce_Separation_count * 100) / temp.Enforce_Separation_countSUM),2) AS Enforce_Separation_Percentage
   FROM Enforce_Separation
   CROSS JOIN (SELECT SUM(Enforce_Separation_count) AS Enforce_Separation_countSUM FROM Enforce_Separation) temp;
   ```
   
   Esto nos arroja la siguiente tabla:
   
   <img width="1411" alt="Captura de pantalla 2023-06-26 a la(s) 11 40 51 p m" src="https://github.com/Yo-17/CardsAgainstHumanity_Proofyourstatesucks/assets/131808869/9f0a3a2d-28a7-4bcd-8eb2-78b71772df54">

   **A partir de estas dos vistas podemos hacer una tercera vista donde se comparen las dos columnas de porcentajes:**

   <img width="1371" alt="Captura de pantalla 2023-06-26 a la(s) 11 50 55 p m" src="https://github.com/Yo-17/CardsAgainstHumanity_Proofyourstatesucks/assets/131808869/9090eda2-33ea-43a1-9113-e13a8e45a8cb">
   
**Otros ejemplos de lo que podemos hacer con vistas son**
1. Crear una tabla donde se cuenten las personas que estan a favor y en contra de la separación del Estado y de la Iglesia, utilizando tablas temporales y después unirla con la tabla DeathPenaltyViews_by_PoliticalViews para comparar ambos posicionamientos ideológicos por como se identifican los participantes:

<img width="1117" alt="Captura de pantalla 2023-06-27 a la(s) 1 02 55 a m" src="https://github.com/Yo-17/CardsAgainstHumanity_Proofyourstatesucks/assets/131808869/b04ff5fa-5fde-4a05-9247-32e986a9ef05">

2. Comparar el número de personas que están de acuerdo con la derogación de Roe v. Wade y los que creen que las leyes en torno al aborto deberían ser mas permisivas y más restrictivas.

<img width="1044" alt="Captura de pantalla 2023-06-27 a la(s) 1 18 49 a m" src="https://github.com/Yo-17/CardsAgainstHumanity_Proofyourstatesucks/assets/131808869/8117f447-9a6c-43f8-8a51-a597c64a10e3">

3. Filtrar el número de personas que están de acuerdo con la derogación de Roe v. Wade pero creen que las leyes entorno al aborto deberían ser más permisivas por estado en orden descendente.
   
<img width="1117" alt="Captura de pantalla 2023-06-27 a la(s) 1 31 17 a m" src="https://github.com/Yo-17/CardsAgainstHumanity_Proofyourstatesucks/assets/131808869/b7970297-1d28-4634-a787-f39a5fa3d5f2">


## Instrucciones de Uso - MySQL Workbench

1. Asegúrate de tener MySQL Workbench instalado y configurado en tu sistema.

2. Clona este repositorio en tu máquina local.

   ```
   git clone https://github.com/Yo-17/CardsAgainstHumanity_Proofyourstatesucks.git
   ```

3. Abre MySQL Workbench y crea una nueva conexión a tu base de datos.

4. Importa la base de datos proporcionada en el repositorio.

5. Ejecuta las consultas según tus necesidades de análisis.

## Consultas Disponibles para MongoDB

### Opiniones sobre embarazos accidentales con condón en un plazo de 1 año

- **Promedio por género - Embarazos accidentales con condón**

  - Para hombres:
    ```
    db.getCollection('CAH_Data').aggregate(
      [
        { $project: { Gender: 1, Condoms: 1 } },
        { $match: { Gender: 'Man' } },
        {
          $group: {
            _id: '$Gender',
            avg_Condoms: { $avg: '$Condoms' }
          }
        }
      ],
      { maxTimeMS: 60000, allowDiskUse: true }
    );
    ```
![Captura de Pantalla 2023-06-27 a la(s) 17 52 42](https://github.com/Yo-17/CardsAgainstHumanity_Proofyourstatesucks/assets/137369012/f31c91de-c72a-4ed6-9fe5-1913e4f38518)
![Captura de Pantalla 2023-06-27 a la(s) 17 53 16](https://github.com/Yo-17/CardsAgainstHumanity_Proofyourstatesucks/assets/137369012/5075153e-d362-4470-ae04-195f01409159)
![Captura de Pantalla 2023-06-27 a la(s) 17 53 27](https://github.com/Yo-17/CardsAgainstHumanity_Proofyourstatesucks/assets/137369012/6a5a14da-22e3-4008-af2c-eb774ccf7bbb)



  - Para mujeres:
    ```
    db.getCollection('CAH_Data').aggregate(
      [
        { $project: { Gender: 1, Condoms: 1 } },
        { $match: { Gender: 'Woman' } },
        {
          $group: {
            _id: '$Gender',
            avg_Condoms: { $avg: '$Condoms' }
          }
        }
      ],
      { maxTimeMS: 60000, allowDiskUse: true }
    );
    ```
![Captura de Pantalla 2023-06-27 a la(s) 17 58 41](https://github.com/Yo-17/CardsAgainstHumanity_Proofyourstatesucks/assets/137369012/9d12f0a6-44ce-4f03-bd6d-4819925b358e)
![Captura de Pantalla 2023-06-27 a la(s) 17 58 49](https://github.com/Yo-17/CardsAgainstHumanity_Proofyourstatesucks/assets/137369012/04571fee-99b9-4213-82ce-c55592284e99)
![Captura de Pantalla 2023-06-27 a la(s) 17 58 57](https://github.com/Yo-17/CardsAgainstHumanity_Proofyourstatesucks/assets/137369012/f614caea-8e5d-4654-a3ef-711c92e1e61b)



### Opiniones sobre embarazos accidentales con anticonceptivos en un año

- **Promedio por género - Embarazos accidentales con anticonceptivos**

  - Para hombres:
    ```
    db.getCollection('CAH_Data').aggregate(
      [
        { $project: { Gender: 1, Pill: 1 } },
        { $match: { Gender: 'Man' } },
        {
          $group: {
            _id: '$Gender',
            avg_Pill: { $avg: '$Pill' }
          }
        }
      ],
      { maxTimeMS: 60000, allowDiskUse: true }
    );
    ```
![Captura de Pantalla 2023-06-27 a la(s) 18 00 10](https://github.com/Yo-17/CardsAgainstHumanity_Proofyourstatesucks/assets/137369012/bded0a97-78d7-4a75-aae1-dfdb26a56bb9)
![Captura de Pantalla 2023-06-27 a la(s) 18 00 16](https://github.com/Yo-17/CardsAgainstHumanity_Proofyourstatesucks/assets/137369012/0e7a32f3-1c09-45dc-b1ae-d29b46d06478)
![Captura de Pantalla 2023-06-27 a la(s) 18 00 23](https://github.com/Yo-17/CardsAgainstHumanity_Proofyourstatesucks/assets/137369012/a2fc691e-756a-4179-b28f-3709d0434be3)



  - Para mujeres:
    ```
    db.getCollection('CAH_Data').aggregate(
      [
        { $project: { Gender: 1, Pill: 1 } },
        { $match: { Gender: 'Woman' } },
        {
          $group: {
            _id: '$Gender',
            avg_Pill: { $avg: '$Pill' }
          }
        }
      ],
      { maxTimeMS: 60000, allowDiskUse: true }
    );
    ```

### Opiniones sobre embarazos accidentales con el método "Pulling out" en un año

- **Promedio por género - Embarazos accidentales con método "Pulling out"**

  - Para hombres:
    ```
    db.getCollection('CAH_Data').aggregate(
      [
        { $project: { Gender: 1, PullingOut: 1 } },
        { $match: { Gender: 'Man' } },
        {
          $group: {
            _id: '$Gender',
            avg_PullingOut: { $avg: '$PullingOut' }
          }
        }
      ],
      { maxTimeMS: 60000, allowDiskUse: true }


    );
    ```

  - Para mujeres:
    ```
    db.getCollection('CAH_Data').aggregate(
      [
        { $project: { Gender: 1, PullingOut: 1 } },
        { $match: { Gender: 'Woman' } },
        {
          $group: {
            _id: '$Gender',
            avg_PullingOut: { $avg: '$PullingOut' }
          }
        }
      ],
      { maxTimeMS: 60000, allowDiskUse: true }
    );
    ```

### Perspectivas sobre las leyes del aborto

- **Los 5 estados que consideran conformes las leyes del aborto**

  ```
  db.getCollection('CAH_Data').aggregate(
    [
      { $project: { StateLawViews: 1, State: 1 } },
      {
        $match: {
          StateLawViews: "My state's abortion laws are about right."
        }
      },
      {
        $group: {
          _id: '$State',
          count_StateLawViews: { $count: {} }
        }
      },
      { $sort: { count_StateLawViews: -1 } },
      { $limit: 5 }
    ],
    { maxTimeMS: 60000, allowDiskUse: true }
  );
  ```

- **Los 5 estados con más personas que consideran que las leyes del aborto deberían ser más restrictivas**

  ```
  db.getCollection('CAH_Data').aggregate(
    [
      { $project: { StateLawViews: 1, State: 1 } },
      {
        $match: {
          StateLawViews: "My state's abortion laws should be more restrictive."
        }
      },
      {
        $group: {
          _id: '$State',
          count_StateLawViews: { $count: {} }
        }
      },
      { $sort: { count_StateLawViews: -1 } },
      { $limit: 5 }
    ],
    { maxTimeMS: 60000, allowDiskUse: true }
  );
  ```

- **Los 5 estados con más personas que consideran que las leyes del aborto deberían ser más permisivas**

  ```
  db.getCollection('CAH_Data').aggregate(
    [
      { $project: { StateLawViews: 1, State: 1 } },
      {
        $match: {
          StateLawViews: "My state's abortion laws should be more permissive."
        }
      },
      {
        $group: {
          _id: '$State',
          count_StateLawViews: { $count: {} }
        }
      },
      { $sort: { count_StateLawViews: -1 } },
      { $limit: 5 }
    ],
    { maxTimeMS: 60000, allowDiskUse: true }
  );
  ```

- **Los 5 estados con más personas que no están familiarizadas con las leyes del aborto**

  ```
  db.getCollection('CAH_Data').aggregate(
    [
      { $project: { StateLawViews: 1, State: 1 } },
      {
        $match: {
          StateLawViews: "I'm not familiar with my state's abortion laws."
        }
      },
      {
        $group: {
          _id: '$State',
          count_StateLawViews: { $count: {} }
        }
      },
      { $sort: { count_StateLawViews: -1 } },
      { $limit: 5 }
    ],
    { maxTimeMS: 60000, allowDiskUse: true }
  );
  ```

## Instrucciones de Uso - MongoDB

Para utilizar las consultas de este repositorio, sigue los pasos a continuación:

1. Clona el repositorio en tu máquina local usando el siguiente comando:

   ```bash
   git clone https://github.com/tu-usuario/repositorio-mongodb.git
   ```

   Asegúrate de reemplazar `tu-usuario` con tu nombre de usuario de GitHub y `repositorio-mongodb` con el nombre del repositorio.

2. Accede al directorio clonado:

   ```bash
   cd repositorio-mongodb
   ```

3. Explora el directorio `consultas` para revisar las consultas disponibles. Abre el archivo correspondiente a la consulta que deseas ejecutar y copia su contenido.

4. Inicia una instancia de MongoDB y conéctate a tu base de datos.

5. Abre una interfaz de línea de comandos de MongoDB y pega la consulta copiada.

6. Ejecuta la consulta para obtener los resultados deseados.

7. Repite los pasos 3-6 para ejecutar otras consultas según tus necesidades.

## Contribuciones

Si deseas contribuir a este repositorio, por favor sigue los siguientes pasos:

1. Realiza un fork de este repositorio.

2. Crea una rama para tu contribución.

   ```
   git checkout -b feature/nueva-consulta
   ```

3. Realiza tus modificaciones y mejoras.

4. Asegúrate de que las consultas funcionen correctamente y que la documentación esté actualizada.

5. Haz commit de tus cambios.

   ```
   git commit -m "Añadir nueva consulta y actualizar documentación"

## Contacto

Si tienes alguna pregunta o inquietud relacionada con este repositorio, puedes contactarnos a través de nuestros perfiles de GitHub @Yo-17 y @marcocenl.

¡Gracias por utilizar este repositorio! Esperamos que sea útil para tu análisis de datos.
