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

CREATE TEMPORARY TABLE some_high_school AS
SELECT PoliticalViews, count(ParticipantID) AS some_high_school_count FROM CAH_table01 WHERE education = "Some high school" GROUP BY PoliticalViews;

CREATE TEMPORARY TABLE high_school AS
SELECT PoliticalViews, count(ParticipantID) AS high_school_count FROM CAH_table01 WHERE education = "High school or high school equivalent" GROUP BY PoliticalViews;

CREATE TEMPORARY TABLE grad_degree AS
SELECT PoliticalViews, count(ParticipantID) AS grad_degree_count FROM CAH_table01 WHERE education = "Graduate degree" GROUP BY PoliticalViews;

CREATE TEMPORARY TABLE bach_degree AS
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

## Query 3: Agrupar por opinion de la separacion del Edo y la Iglesia segun afiliacion a partido politico - SepChurchState_by_PoliticalParty
#Drop table Stop_Enforcing;

#Create Enforce_Separation
CREATE TABLE Enforce_Separation AS
SELECT PoliticalParty, count(ParticipantID) AS Enforce_Separation_count 
FROM CAH_table01 WHERE SepChurchState = "The federal government should enforce separation of church and state." 
GROUP BY PoliticalParty;

SELECT PoliticalParty, Enforce_Separation_count,
round(((Enforce_Separation_count * 100) / temp.Enforce_Separation_countSUM),2) AS Enforce_Separation_Percentage
FROM Enforce_Separation
CROSS JOIN (SELECT SUM(Enforce_Separation_count) AS Enforce_Separation_countSUM FROM Enforce_Separation) temp;

#Create Stop_Enforcing
CREATE TABLE Stop_Enforcing AS
SELECT PoliticalParty, count(ParticipantID) AS Stop_Enforcing_count 
FROM CAH_table01 WHERE SepChurchState = "The federal government should stop enforcing separation of church and state." 
GROUP BY PoliticalParty;

SELECT PoliticalParty, Stop_Enforcing_count,
round(((Stop_Enforcing_count * 100) / temp.Stop_Enforcing_countSUM),2) AS Stop_Enforcing_Percentage
FROM Stop_Enforcing
CROSS JOIN (SELECT SUM(Stop_Enforcing_count) AS Stop_Enforcing_countSUM FROM Stop_Enforcing) temp;

# Table - SepChurchState_by_PoliticalParty 
## Percentage columns are not included in this table, looking for solutions 
CREATE TABLE SepChurchState_by_PoliticalParty AS
SELECT Enforce_Separation.PoliticalParty, Enforce_Separation.Enforce_Separation_count, Stop_Enforcing.Stop_Enforcing_count
FROM Enforce_Separation
LEFT JOIN Stop_Enforcing ON Enforce_Separation.PoliticalParty = Stop_Enforcing.PoliticalParty;

##Query 4: Criminalizacion del Aborto - Opiniones por genero - PatientPenalty_by_Gender
#Drop table penalty_female;

CREATE TEMPORARY TABLE penalty_female AS
SELECT PatientPenalty, count(ParticipantID) AS f_penalty_count FROM Female_Participants GROUP BY PatientPenalty;

CREATE TEMPORARY TABLE penalty_male AS
SELECT PatientPenalty, count(ParticipantID) AS m_penalty_count FROM Male_Participants GROUP BY PatientPenalty;

CREATE TABLE PatientPenalty_by_Gender AS
SELECT penalty_female.PatientPenalty, penalty_female.f_penalty_count, penalty_male.m_penalty_count
FROM penalty_female
LEFT JOIN penalty_male ON penalty_female.PatientPenalty = penalty_male.PatientPenalty;

##Query 5: Organizar de mayor a menor los Estados con mayor numero de personas que aprueban la anulacion de la sentencia de Roe v. Wade
Drop table Yes_CourtApproval_by_State;

CREATE TABLE Yes_CourtApproval_by_State AS
SELECT State,
COUNT(IF(CourtApproval = 'Yes', State, NULL)) AS Buu_RvW 
FROM CAH_table01 GROUP BY State ORDER BY Buu_RvW DESC;

Select * From Yes_CourtApproval_by_State;