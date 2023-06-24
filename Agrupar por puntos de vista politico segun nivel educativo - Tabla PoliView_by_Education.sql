USE CAH;

## 1 Query: Agrupar por puntos de vista politico segun nivel educativo - Tabla PoliView_by_Education
SELECT * FROM CAH_table01;
DROP TABLE some_high_school;

CREATE TABLE some_high_school AS
SELECT 7_PoliticalViews, count(ParticipantID) AS some_high_school_count FROM CAH_table01 WHERE 6_education = "Some high school" GROUP BY 7_PoliticalViews;

CREATE TABLE high_school AS
SELECT 7_PoliticalViews, count(ParticipantID) AS high_school_count FROM CAH_table01 WHERE 6_education = "High school or high school equivalent" GROUP BY 7_PoliticalViews;

CREATE TABLE grad_degree AS
SELECT 7_PoliticalViews, count(ParticipantID) AS grad_degree_count FROM CAH_table01 WHERE 6_education = "Graduate degree" GROUP BY 7_PoliticalViews;

CREATE TABLE bach_degree AS
SELECT 7_PoliticalViews, count(ParticipantID) AS bach_degree_count FROM CAH_table01 WHERE 6_education = "Bachelor's degree or equivalent" GROUP BY 7_PoliticalViews;

CREATE TABLE PoliView_by_Education AS
SELECT some_high_school.7_PoliticalViews, some_high_school.some_high_school_count, high_school.high_school_count, grad_degree.grad_degree_count, bach_degree.bach_degree_count
FROM some_high_school
LEFT JOIN high_school ON some_high_school.7_PoliticalViews = high_school.7_PoliticalViews
LEFT JOIN grad_degree ON some_high_school.7_PoliticalViews = grad_degree.7_PoliticalViews
LEFT JOIN bach_degree ON some_high_school.7_PoliticalViews = bach_degree.7_PoliticalViews;
