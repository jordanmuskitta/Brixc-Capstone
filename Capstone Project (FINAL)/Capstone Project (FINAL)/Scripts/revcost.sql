SELECT ct.createdAt, ct.amount, ct.accountCreditId, ct.creditsBefore, ct.creditsAfter, 
ct.creditAmount, ct.bonusBefore ,ct.bonusAfter, ct.bonusAmount, s.subscriptionTypeId, s.active, ac.customerId, s.isCanceled, c2.isDeleted  
FROM CreditTransactions ct LEFT OUTER JOIN Subscriptions s ON ct.accountCreditId = s.accountCreditId 
LEFT OUTER JOIN AccountCredits ac ON s.accountCreditId = ac.accountCreditId 
LEFT OUTER JOIN Customers c2 ON ac.customerId = c2.customerId 


SELECT o.orderId, o.customerId, oip.featurePriceId, SUM(oip.amount) AS GrossCost 
FROM Orders o 
LEFT JOIN OrderImagePrices oip ON o.orderId = oip.orderId
GROUP BY o.customerId 
ORDER BY 2 DESC

SELECT o.customerId, SUM(oip.amount) AS grossCost FROM OrderImagePrices oip 
JOIN Orders o ON oip.orderId = o.orderId GROUP BY o.customerId 

SELECT ac.customerId, SUM(ct.amount) AS GrossRevenue FROM CreditTransactions ct 
LEFT JOIN AccountCredits ac ON ct.accountCreditId = ac.accountCreditId 
GROUP BY ac.customerId 


SELECT o.customerId, SUM(oip.amount) FROM Orders o 
LEFT JOIN OrderImagePrices oip  ON o.orderId = oip.orderId 
JOIN (SELECT ac.customerId, SUM(ct.amount) AS GrossRevenue FROM CreditTransactions ct 
LEFT JOIN AccountCredits ac ON ct.accountCreditId = ac.accountCreditId 
LEFT JOIN Orders o ON ac.customerId = o.customerId 
GROUP BY ac.customerId) a ON o.customerId = a.customerId

SELECT ac.customerId, SUM(ct.amount) AS GrossRevenue FROM CreditTransactions ct 
LEFT JOIN AccountCredits ac ON ct.accountCreditId = ac.accountCreditId
GROUP BY ac.customerId 





WITH cte1 AS (SELECT oip.orderId, oip.orderImageId, o.customerId , SUM(oip.amount) AS GrossCost,
ac.currentBonus, ac.currentTotal 
FROM OrderImagePrices oip 
LEFT JOIN Orders o ON oip.orderId = o.orderId 
LEFT JOIN AccountCredits ac ON o.customerId = ac.customerId
GROUP BY customerId),
cte2 AS (SELECT ac.customerId, SUM(ct.amount) AS GrossRevenue FROM CreditTransactions ct 
LEFT JOIN AccountCredits ac ON ct.accountCreditId = ac.accountCreditId 
LEFT JOIN Orders o ON ac.customerId = o.customerId 
GROUP BY ac.customerId )
SELECT *,(b.GrossRevenue - a.GrossCost) FROM cte1 a JOIN cte2 b ON a.customerId = b.customerId;


