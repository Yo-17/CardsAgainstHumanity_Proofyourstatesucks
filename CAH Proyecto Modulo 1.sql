USE CAH;
SHOW tables;

Select * from CAH_table01;

#Revisar que toda la informacion se subio correctamente
Select Count(*) from CAH_table01;

#Crear una tabla que contenga a todos los participantes que se identifican como mujeres
CREATE TABLE Female_Participants AS 
  SELECT *
  FROM CAH_table01
  WHERE 4_Gender = 'Woman';
  
  Select Count(*) from Female_Participants;
  
  #Crear una tabla que contenga a todos los participantes que se identifican como hombres
CREATE TABLE Male_Participants AS 
  SELECT *
  FROM CAH_table01
  WHERE 4_Gender = 'Man';
  
  Select Count(*) from Male_Participants;
  
  Select Count(*) From CAH_table01 WHERE 5_PoliticalParty = 'Democrat';
  
  #Crear una tabla donde se agrupen los participantes por political party 
  CREATE TABLE Political_Party_Frequency AS
  SELECT Count(5_PoliticalParty) AS Total 
  FROM CAH_table01 group by 5_PoliticalParty;

#TESTCHANGE
