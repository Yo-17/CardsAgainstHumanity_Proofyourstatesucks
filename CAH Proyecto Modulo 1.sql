USE CAH;
SHOW tables;

DROP TABLE IF EXISTS Female_Participants, grad_degree, bach_degree, high_school, Male_Participants, Political_Party_frequency, PoliView_by_Education, some_high_school;

Select * from CAH_table01;

#Revisar que toda la informacion se subio correctamente
Select Count(*) from CAH_table01;

#Crear una tabla que contenga a todos los participantes que se identifican como mujeres
CREATE TABLE Female_Participants AS 
  SELECT *
  FROM CAH_table01
  WHERE Gender = 'Woman';
  
  Select Count(*) from Female_Participants;
  
  #Crear una tabla que contenga a todos los participantes que se identifican como hombres
CREATE TABLE Male_Participants AS 
  SELECT *
  FROM CAH_table01
  WHERE Gender = 'Man';
  
  Select Count(*) from Male_Participants;
  
  Select Count(*) From CAH_table01 WHERE PoliticalParty = 'Democrat';
  
  #Crear una tabla donde se agrupen los participantes por political party 
  CREATE TABLE Political_Party_Frequency AS
  SELECT Count(PoliticalParty) AS Total 
  FROM CAH_table01 group by PoliticalParty;

## Query 2: Agrupar por puntos de vista politico segun nivel educativo - Tabla PoliView_by_Education
SELECT * FROM CAH_table01;

CREATE TABLE some_high_school AS
SELECT PoliticalViews, count(ParticipantID) AS some_high_school_count FROM CAH_table01 WHERE education = "Some high school" GROUP BY PoliticalViews;

CREATE TABLE high_school AS
SELECT PoliticalViews, count(ParticipantID) AS high_school_count FROM CAH_table01 WHERE education = "High school or high school equivalent" GROUP BY PoliticalViews;

CREATE TABLE grad_degree AS
SELECT PoliticalViews, count(ParticipantID) AS grad_degree_count FROM CAH_table01 WHERE education = "Graduate degree" GROUP BY PoliticalViews;

CREATE TABLE bach_degree AS
SELECT PoliticalViews, count(ParticipantID) AS bach_degree_count FROM CAH_table01 WHERE education = "Bachelor's degree or equivalent" GROUP BY PoliticalViews;

CREATE TABLE PoliView_by_Education AS
SELECT some_high_school.PoliticalViews, some_high_school.some_high_school_count, high_school.high_school_count, grad_degree.grad_degree_count, bach_degree.bach_degree_count
FROM some_high_school
LEFT JOIN high_school ON some_high_school.PoliticalViews = high_school.PoliticalViews
LEFT JOIN grad_degree ON some_high_school.PoliticalViews = grad_degree.PoliticalViews
LEFT JOIN bach_degree ON some_high_school.PoliticalViews = bach_degree.PoliticalViews;

## Query 2:  Agrupar por grado de educación segun perspectiva del aborto - Tabla AbortionViews_by_Education

#DROP TABLE Education;

CREATE TEMPORARY TABLE some_high_school AS
SELECT AbortionViews, count(ParticipantID) AS some_high_school_count FROM CAH_table01 WHERE education = "Some high school" GROUP BY AbortionViews;

CREATE TEMPORARY TABLE high_school AS
SELECT AbortionViews, count(ParticipantID) AS high_school_count FROM CAH_table01 WHERE education = "High school or high school equivalent" GROUP BY AbortionViews;

CREATE TEMPORARY TABLE grad_degree AS
SELECT AbortionViews, count(ParticipantID) AS grad_degree_count FROM CAH_table01 WHERE education = "Graduate degree" GROUP BY AbortionViews;

CREATE TEMPORARY TABLE bach_degree AS
SELECT AbortionViews, count(ParticipantID) AS bach_degree_count FROM CAH_table01 WHERE education = "Bachelor's degree or equivalent" GROUP BY AbortionViews;

CREATE TABLE AbortionView_by_Education AS
SELECT some_high_school.AbortionViews, some_high_school.some_high_school_count, high_school.high_school_count, grad_degree.grad_degree_count, bach_degree.bach_degree_count
FROM some_high_school
LEFT JOIN high_school ON some_high_school.AbortionViews = high_school.AbortionViews
LEFT JOIN grad_degree ON some_high_school.AbortionViews = grad_degree.AbortionViews
LEFT JOIN bach_degree ON some_high_school.AbortionViews = bach_degree.AbortionViews;

SELECT * FROM AbortionView_by_Education;