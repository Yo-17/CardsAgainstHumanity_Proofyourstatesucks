# CardsAgainstHumanity_Proofyourstatesucks
# Repositorio de Consultas de Base de Datos

Este repositorio contiene consultas SQL para la base de datos en MySQL Workbench. Las consultas están diseñadas para analizar diferentes aspectos relacionados con puntos de vista políticos, nivel educativo, perspectivas sobre el aborto, afiliación a partidos políticos, género, opiniones sobre la separación del Estado y la Iglesia, así como sobre la pena de muerte.

## Consultas Disponibles

1. **Agrupar por puntos de vista político según nivel educativo - Tabla PoliView_by_Education**

   Esta consulta agrupa los datos por puntos de vista político y nivel educativo de los encuestados.

2. **Agrupar por grado de educación según perspectiva del aborto - Tabla AbortionViews_by_Education**

   Esta consulta agrupa los datos por grado de educación y perspectiva sobre el aborto de los encuestados.

3. **Agrupar por opinión de la separación del Estado y la Iglesia según afiliación a partido político - SepChurchState_by_PoliticalParty**

   Esta consulta agrupa los datos por opinión sobre la separación del Estado y la Iglesia y afiliación a partido político de los encuestados.

4. **Criminalización del Aborto - Opiniones por género - PatientPenalty_by_Gender**

   Esta consulta muestra las opiniones sobre la criminalización del aborto, agrupadas por género de los encuestados.

5. **Organizar de mayor a menor los Estados con mayor número de personas que aprueban la anulación de la sentencia de Roe v. Wade - Yes_CourtApproval_by_State**

   Esta consulta organiza los estados de mayor a menor según el número de personas que aprueban la anulación de la sentencia de Roe v. Wade.

6. **¿Qué tan de acuerdo se encuentran las personas encuestadas con las leyes sobre el aborto en sus estados? - StateLawViews_by_State**

   Esta consulta muestra el nivel de acuerdo de las personas encuestadas con las leyes sobre el aborto en sus respectivos estados.

7. **La opinión sobre la pena de muerte agrupada por posicionamiento ideológico de los participantes - DeathPenaltyViews_by_PoliticalViews**

   Esta consulta agrupa la opinión sobre la pena de muerte según el posicionamiento ideológico de los participantes.

## Instrucciones de Uso

1. Asegúrate de tener MySQL Workbench instalado y configurado en tu sistema.

2. Clona este repositorio en tu máquina local.

   ```
   git clone https://github.com/tu-usuario/repositorio-base-datos.git
   ```

3. Abre MySQL Workbench y crea una nueva conexión a tu base de datos.

4. Importa la base de datos proporcionada en el repositorio.

5. Ejecuta las consultas según tus necesidades de análisis.

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
  
