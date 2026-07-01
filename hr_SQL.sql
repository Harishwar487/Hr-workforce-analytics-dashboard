select * from hrdata;

# ---Total Employees----
SELECT COUNT(*) AS Total_Employees
FROM hrdata;

# ---Active vs Terminated Employees----
SELECT
    Termd,
    COUNT(*) AS Employee_Count
FROM hrdata
GROUP BY Termd;

#---Attrition Rate---
SELECT
ROUND(
    SUM(Termd) * 100.0 / COUNT(*),
    2
) AS Attrition_Rate
FROM hrdata;

#---Department-wise Employee Count-----
SELECT
    Department,
    COUNT(*) AS Employees
FROM hrdata
GROUP BY Department
ORDER BY Employees DESC;

#---Department-wise Attrition---
SELECT
    Department,
    COUNT(*) AS Total_Employees,
    SUM(Termd) AS Employees_Left
FROM hrdata
GROUP BY Department
ORDER BY Employees_Left DESC;

#---Attrition Percentage by Department---
SELECT
    Department,
    ROUND(
        SUM(Termd)*100.0/COUNT(*),
        2
    ) AS Attrition_Percentage
FROM hrdata
GROUP BY Department
ORDER BY Attrition_Percentage DESC;

#---Gender Distribution--
SELECT
    Gender,
    COUNT(*) AS Employees
FROM hrdata
GROUP BY Gender;

#---Gender-wise Attrition----
SELECT
    Gender,
    SUM(Termd) AS Employees_Left
FROM hrdata
GROUP BY Gender;

#---Average Salary by Department----
SELECT
    Department,
    ROUND(AVG(Salary),2) AS Avg_Salary
FROM hrdata
GROUP BY Department
ORDER BY Avg_Salary DESC;

#---Highest Paid Employees---
SELECT
    Employee_Name,
    Department,
    Salary
FROM hrdata
ORDER BY Salary DESC
LIMIT 10;

#---Lowest Paid Employees---
SELECT
    Employee_Name,
    Department,
    Salary
FROM hrdata
ORDER BY Salary ASC
LIMIT 10;

#---Average Salary by Position---
SELECT
    Position,
    ROUND(AVG(Salary),2) AS Avg_Salary
FROM hrdata
GROUP BY Position
ORDER BY Avg_Salary DESC;

#---Satisfaction Analysis---
SELECT
    Termd,
    ROUND(AVG(EmpSatisfaction),2) AS Avg_Satisfaction
FROM hrdata
GROUP BY Termd;

#---Engagement Survey Analysis---
SELECT
    Termd,
    ROUND(AVG(EngagementSurvey),2) AS Avg_Engagement
FROM HR
GROUP BY Termd;

#---Absence Analysis----
SELECT
    Termd,
    ROUND(AVG(Absences),2) AS Avg_Absences
FROM hrdata
GROUP BY Termd;

#---Late Coming Analysis---
SELECT
    Termd,
    ROUND(AVG(DaysLateLast30),2) AS Avg_Late_Days
FROM hrdata
GROUP BY Termd;

#---Recruitment Source Attrition---
SELECT
    RecruitmentSource,
    SUM(Termd) AS Employees_Left
FROM hrdata
GROUP BY RecruitmentSource
ORDER BY Employees_Left DESC;

#---Performance vs Attrition---
SELECT
    PerformanceScore,
    SUM(Termd) AS Employees_Left
FROM hrdata
GROUP BY PerformanceScore
ORDER BY Employees_Left DESC;

#---Top 5 Departments with Highest Attrition---
SELECT
    Department,
    SUM(Termd) AS Attrition_Count
FROM hrdata
GROUP BY Department
ORDER BY Attrition_Count DESC
LIMIT 5;

#---Top Recruitment Sources with Lowest Attrition---
SELECT
    RecruitmentSource,
    ROUND(
        SUM(Termd)*100.0/COUNT(*),
        2
    ) AS Attrition_Percentage
FROM hrdata
GROUP BY RecruitmentSource
ORDER BY Attrition_Percentage ASC;