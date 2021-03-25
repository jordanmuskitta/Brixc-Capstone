-- SELECT COUNT(*) FROM CreditTransactions ct WHERE orderId IS NOT NULL

-- SELECT COUNT(DISTINCT accountCreditId) AS accountID FROM CreditTransactions ct

-- SELECT COUNT(DISTINCT accountCreditId) FROM AccountCredits ac 

-- SELECT COUNT(DISTINCT customerShopAccountId) FROM CreditTransactions ct  
-- #~7000
-- SELECT COUNT(DISTINCT id) FROM CustomerShopAccounts csa 
-- #~69K
-- SELECT COUNT(DISTINCT customerShopAccountId) FROM Orders
-- #~4k
-- 
-- SELECT COUNT(DISTINCT orderId) FROM CreditTransactions ct 
-- #~107K
-- 
-- SELECT COUNT(DISTINCT orderId) FROM Orders o; 
-- 
-- SELECT DISTINCT(orderId) FROM Orders
-- SELECT DISTINCT(orderId) FROM CreditTransactions ct 

SELECT Orders.orderId, Orders.customerId, c.source, ct.createdAt AS CreditTransDTS,Orders.submittedDTS, i.packageQty, i.creditPackageId, i.amount, 
ct.creditsBefore, ct.creditsAfter, ct.creditAmount, ct.bonusBefore, ct.bonusAfter, ct.bonusAmount, 
ct.isSubscriptionFee, s.subscriptionTypeId, s.isCanceled AS SubCanceled 
FROM Orders 
JOIN CreditTransactions ct ON Orders.orderId = ct.orderId 
JOIN Invoices i ON ct.invoiceId = i.invoiceId 
LEFT OUTER JOIN Subscriptions s ON ct.accountCreditId = s.accountCreditId 
LEFT OUTER JOIN Customers c ON Orders.customerId = c.customerId

-- SELECT * FROM Orders 
-- JOIN CreditTransactions ct ON Orders.orderId = ct.orderId

-- SELECT COUNT(DISTINCT invoiceId) FROM CreditTransactions ct  


-- SELECT s.lastActiveCheckedDTS FROM Subscriptions s
-- JOIN CreditTransactions ct ON s.accountCreditId = ct.accountCreditId 
-- JOIN Orders o ON ct.orderId = o.orderId
-- JOIN Customers c ON o.customerId = c.customerId

SELECT * FROM Subscriptions s 





