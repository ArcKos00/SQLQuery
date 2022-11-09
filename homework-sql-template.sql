--------------------------ДОМАШКА----------------------------

----------------------ЗАДАНИЕ №1-----------------------------
--Вывести всю информацию из таблицы Sales.Customer 
-------------------------------------------------------------

SELECT * 
FROM Sales.Customer

GO

----------------------ЗАДАНИЕ №2-----------------------------
--Вывести всю информацию из таблицы Sales.Store отсортированную 
--по Name в алфавитном порядке
-------------------------------------------------------------
SELECT *
FROM Sales.Store store
ORDER BY store.Name

GO

----------------------ЗАДАНИЕ №3-----------------------------
--Вывести из таблицы HumanResources.Employee всю информацию
--о десяти сотрудниках, которые родились позже 1989-09-28
-------------------------------------------------------------

SELECT TOP 10 *
FROM HumanResources.Employee employee
WHERE employee.BirthDate > '1989-09-28'

GO

----------------------ЗАДАНИЕ №4-----------------------------
--Вывести из таблицы HumanResources.Employee сотрудников
--у которых последний символ LoginID является 0.
--Вывести только NationalIDNumber, LoginID, JobTitle.
--Данные должны быть отсортированы по JobTitle по убиванию
-------------------------------------------------------------
SELECT
	employee.NationalIDNumber,
	employee.LoginID,
	employee.JobTitle
FROM HumanResources.Employee employee
WHERE employee.LoginID LIKE '%0'
ORDER BY employee.JobTitle DESC

GO

----------------------ЗАДАНИЕ №5-----------------------------
--Вывести из таблицы Person.Person всю информацию о записях, которые были 
--обновлены в 2008 году (ModifiedDate) и MiddleName содержит
--значение и Title не содержит значение 9
-------------------------------------------------------------
SELECT *
FROM Person.Person person
WHERE person.ModifiedDate BETWEEN '2008-01-01 00:00:00.000' and '2008-12-31 23:59:59.998'
	AND person.MiddleName IS NOT NULL
	AND person.Title IS NULL

GO

----------------------ЗАДАНИЕ №6-----------------------------
--Вывести название отдела (HumanResources.Department.Name) БЕЗ повторений
--в которых есть сотрудники
--Использовать таблицы HumanResources.EmployeeDepartmentHistory и HumanResources.Department
-------------------------------------------------------------

SELECT DISTINCT dep.Name
FROM HumanResources.Department dep

INNER JOIN HumanResources.EmployeeDepartmentHistory history
	ON dep.DepartmentID = history.DepartmentID
INNER JOIN HumanResources.Department depart
	ON dep.DepartmentID = depart.DepartmentID

GO

----------------------ЗАДАНИЕ №7-----------------------------
--Сгрупировать данные из таблицы Sales.SalesPerson по TerritoryID
--и вывести сумму CommissionPct, если она больше 0
-------------------------------------------------------------
SELECT
	SUM(sales.CommissionPct) [SUM]
FROM Sales.SalesPerson sales
WHERE sales.CommissionPct > 0
GROUP BY sales.TerritoryID

GO

----------------------ЗАДАНИЕ №8-----------------------------
--Вывести всю информацию о сотрудниках (HumanResources.Employee) 
--которые имеют самое большое кол-во 
--отпуска (HumanResources.Employee.VacationHours)
-------------------------------------------------------------
SELECT *
FROM HumanResources.Employee employee
WHERE employee.VacationHours =
(
	SELECT 
		MAX(emp.VacationHours)
	FROM HumanResources.Employee emp
)

GO

----------------------ЗАДАНИЕ №9-----------------------------
--Вывести всю информацию о сотрудниках (HumanResources.Employee) 
--которые имеют позицию (HumanResources.Employee.JobTitle)
--'Sales Representative' или 'Network Administrator' или 'Network Manager'
-------------------------------------------------------------
SELECT *
FROM HumanResources.Employee employee
WHERE employee.JobTitle = 'Sales Representative'
	OR employee.JobTitle= 'Network Administrator' 
	OR employee.JobTitle= 'Network Manager'

GO

----------------------ЗАДАНИЕ №10-----------------------------
--Вывести всю информацию о сотрудниках (HumanResources.Employee) и 
--их заказах (Purchasing.PurchaseOrderHeader). ЕСЛИ У СОТРУДНИКА НЕТ
--ЗАКАЗОВ ОН ДОЛЖЕН БЫТЬ ВЫВЕДЕН ТОЖЕ!!!
-------------------------------------------------------------
SELECT *
FROM HumanResources.Employee employee
FULL JOIN Purchasing.PurchaseOrderHeader purchase
	ON purchase.EmployeeID = employee.BusinessEntityID
GO

