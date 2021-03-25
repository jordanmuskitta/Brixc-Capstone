-- SELECT * FROM Subscriptions JOIN CreditTransactions ON (Subscriptions.accountCreditId = CreditTransactions.accountCreditId)  
-- SELECT * FROM CreditTransactions ct
-- SELECT * FROM Customers ORDER BY customerId DESC

-- SELECT * FROM Subscriptions s WHERE isCanceled = 1 ORDER BY subscriptionId DESC; 

-- SELECT * FROM SubscriptionTypes st 

-- SELECT * FROM DeliveryResults dr ORDER BY createdAt DESC

-- SELECT customerId, SUM(currentBonus)  FROM AccountCredits ac GROUP BY customerId ORDER BY customerId 

-- SELECT * FROM CreditPackagePrices

-- SELECT o.customerId, Customers.ordersDeliveredCount, Customers.ordersCount AS CompletedOrders, 
-- Customers.createdAt, s.lastActiveCheckedDTS, Customers.lastOrderDTS,s.lastChargeDTS, Customers.accountCreditCurrentTotal, Customers.accountCreditCurrentBonus, 
-- SUM(o.usedCredits), 
-- cpp.creditPackageId, cpp.price, SUM(ct.creditAmount), s.isCanceled, s.subscriptionTypeId 
-- FROM Orders o 
-- LEFT JOIN Customers 
-- 	ON o.customerId = Customers.customerId 
-- LEFT JOIN CreditPackagePrices cpp 
-- 	ON Customers.creditPackageId = cpp.creditPackageId 
-- LEFT JOIN AccountCredits ac 
-- 	ON o.customerId = ac.customerId 
-- LEFT JOIN Subscriptions s 
-- 	ON ac.accountCreditId = s.accountCreditId 
-- LEFT JOIN CreditTransactions ct 
-- 	ON s.accountCreditId = ct.accountCreditId 
-- GROUP BY customerId
-- ORDER BY CompletedOrders DESC;



-- SELECT * FROM Orders  WHERE customerId = 72;

-- SELECT * FROM CreditPackages cp 


-- SELECT i.createdAt, i.amount, o.customerId FROM Invoices i LEFT JOIN Orders o ON i.createdAt = o.createdAt ORDER BY i.invoiceId DESC

-- SELECT * FROM Invoices i2 LEFT JOIN CreditTransactions ct ON i2.createdAt = ct.createdAt ;

-- SELECT * FROM CreditTransactions ct; 


-- SELECT accountCreditId, SUM(creditAmount) FROM CreditTransactions ct GROUP BY accountCreditId ORDER BY 2 DESC

-- SELECT o.customerId, Customers.ordersDeliveredCount, Customers.ordersCount AS CompletedOrders, 
-- Customers.createdAt, s.lastActiveCheckedDTS, Customers.lastOrderDTS,s.lastChargeDTS, Customers.accountCreditCurrentTotal, Customers.accountCreditCurrentBonus, 
-- SUM(o.usedCredits),
-- cpp.creditPackageId, cpp.price, s.isCanceled, s.subscriptionTypeId 
-- FROM Orders o 
-- LEFT JOIN Customers 
-- 	ON o.customerId = Customers.customerId 
-- LEFT JOIN CreditPackagePrices cpp 
-- 	ON Customers.creditPackageId = cpp.creditPackageId 
-- LEFT JOIN AccountCredits ac 
-- 	ON o.customerId = ac.customerId 
-- LEFT JOIN Subscriptions s 
-- 	ON ac.accountCreditId = s.accountCreditId 
-- GROUP BY customerId
-- ORDER BY CompletedOrders DESC;
-- 
-- SELECT c.customerId, ct.creditAmount, SUM(i.amount) OVER (PARTITION BY c.customerId) AS same_total FROM Customers c 
-- LEFT JOIN AccountCredits ac ON c.customerId = ac.customerId 
-- LEFT JOIN CreditTransactions ct ON ac.accountCreditId = ct.accountCreditId 
-- LEFT JOIN Invoices i ON  ct.invoiceId = i.invoiceId 
-- ORDER BY 1 DESC


-- SELECT count(*) FROM Customers c WHERE YEAR(createdAt) = 2015

-- SELECT count(*) FROM Customers c WHERE YEAR(createdAt) = 2016  

-- SELECT c.createdAt, ac.customerId, c.email, lastChargeDTS, 
-- c.ordersCount, c.ordersDeliveredCount, isCanceled, c.trialEndDTS 
-- FROM Subscriptions s LEFT JOIN AccountCredits ac ON s.accountCreditId = ac.accountCreditId 
-- LEFT JOIN Customers c ON ac.customerId = c.customerId 
-- WHERE s.subscriptionTypeId = 3

-- SELECT * FROM Customers c 

-- SELECT * FROM Invoices i 

-- SELECT * FROM SubscriptionQuotas sq 

-- SELECT ct.createdAt, ac.customerId, c.email, s.subscriptionTypeId , lastChargeDTS, 
-- c.ordersCount, c.ordersDeliveredCount, isCanceled, s.endDTS 
-- FROM Subscriptions s LEFT JOIN AccountCredits ac ON s.accountCreditId = ac.accountCreditId 
-- LEFT JOIN Customers c ON ac.customerId = c.customerId 
-- LEFT JOIN CreditTransactions ct ON s.accountCreditId = ct.accountCreditId 
-- WHERE s.subscriptionTypeId = 3

-- SELECT ct.updatedAt, ac.customerId, c.email, s.subscriptionTypeId , lastChargeDTS, 
-- c.ordersCount, c.ordersDeliveredCount, s.isCanceled, s.endDTS 
-- FROM Subscriptions s 
-- JOIN CreditTransactions ct ON s.accountCreditId = ct.accountCreditId 
-- JOIN AccountCredits ac ON s.accountCreditId = ac.accountCreditId 
-- JOIN Customers c ON ac.customerId = c.customerId 
-- WHERE c.customerId = 7314

-- SELECT ct.createdAt ,Orders.orderId, ct.orderId , Orders.customerId FROM Orders
-- LEFT JOIN Customers ON Orders.customerId = Customers.customerId
-- LEFT JOIN CreditTransactions ct ON Orders.orderId = ct.orderId
-- ORDER BY 1 DESC; 


-- SELECT * FROM Orders JOIN CreditTransactions ct ON Orders.orderId = ct.orderId 


-- SELECT ct.createdAt AS CreditTransactionDTS, ct.orderId, Orders.deliveredDTS AS OrderDelivered, c.customerId ,
-- ct.creditAmount, ct.invoiceId, s.subscriptionTypeId, s.isCanceled
-- FROM CreditTransactions ct
-- INNER JOIN Orders ON ct.orderId = Orders.orderId 
-- INNER JOIN Subscriptions s ON ct.accountCreditId = s.accountCreditId 
-- INNER JOIN AccountCredits ac ON ct.accountCreditId = ac.accountCreditId 
-- INNER JOIN Customers c ON ac.customerId = c.customerId 
-- ORDER BY 4,1 ASC


