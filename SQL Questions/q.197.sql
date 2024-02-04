WITH cte AS (
    SELECT *, DATE_ADD(recordDate, INTERVAL -1 DAY) AS yesterday_date,
    LAG(recordDate) OVER (ORDER BY recordDate) AS prev_recordDate,
    LAG(temperature) OVER (ORDER BY recordDate) AS prev_temp
    FROM Weather
)
SELECT Id
FROM cte
WHERE yesterday_date = prev_recordDate
AND temperature > prev_temp;