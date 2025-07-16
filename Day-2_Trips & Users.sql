SELECT
    request_at AS Day,
    ROUND(SUM(status = "cancelled_by_driver" OR status = "cancelled_by_client") / COUNT(*), 2) AS "Cancellation Rate"
FROM
    trips t
JOIN
    users uc ON t.client_id = uc.users_id AND uc.banned = 'No' AND uc.role = 'client'
JOIN
    users ud ON t.driver_id = ud.users_id AND ud.banned = 'No' AND ud.role = 'driver'
WHERE 
    request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY 
    request_at
HAVING 
    COUNT(*) > 0;
