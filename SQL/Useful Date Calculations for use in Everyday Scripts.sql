SELECT
--Start Year--
DATEADD(yy, DATEDIFF(yy, 0, GETDATE()), 0) AS StartOfYear

--End of Year--
,DATEADD(yy, DATEDIFF(yy, 0, GETDATE()) +1, -1) AS EndOfYear

--Prior Month--
,DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE())-1, 0) FirstDayOfPriorMonth
,DATEADD(DAY, -(DAY(GETDATE())), GETDATE())   LastDayOfPreviousMonth

--Current Month--
,DATEADD(mm, DATEDIFF(mm, 0, GETDATE()), 0) FirstDayOfCurrentMonth
,DATEADD (dd, -1, DATEADD(mm, DATEDIFF(mm, 0, GETDATE()) + 1, 0)) LastDayOfTheCurrentMonth

--Next Month--
,DATEADD(mm, DATEDIFF(mm, 0, GETDATE()) + 1, 0) FirstDayOfNextMonth
,DATEADD (dd, -1, DATEADD(mm, DATEDIFF(mm, 0, GETDATE()) + 2, 0)) LastDayofNextMonth

--Months Ago--
,DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE())-12, 0)AS FirstDayOfTwelveMonthago,

--Yesterday and today--
dateadd(day,datediff(day,1,GETDATE()),0) Yesterday,
dateadd(day,datediff(day,0,GETDATE()),0) Today,

--Years Ago - first of year--
DATEADD(yy, DATEDIFF(yy, 0, GETDATE()) - 1, 0) StartOfLastYear,
DATEADD(yy, DATEDIFF(yy, 0, GETDATE()) - 2, 0) StartOfTwoYearsAgo,

--Calculation Example--
DateDiff(year,DATEADD(yy, DATEDIFF(yy, 0, GETDATE()) - 2, 0),GETDATE()) YearsLookBack

