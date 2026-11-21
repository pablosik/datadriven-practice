SELECT ad_campaign, 
COUNT(*) AS impressions, 
SUM(revenue) AS total_revenue, 
ROUND(100.0 * SUM(clicked) / COUNT(*), 1) AS ctr
FROM ad_impressions 
GROUP BY ad_campaign
HAVING COUNT(*) > 15
ORDER BY ctr DESC, ad_campaign
