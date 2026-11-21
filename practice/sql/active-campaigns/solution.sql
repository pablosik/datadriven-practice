SELECT ad_campaign, 
COUNT(impression_id) AS impressions, 
SUM(revenue) AS total_revenue, 
ROUND(CAST(COUNT(CASE WHEN clicked = true THEN impression_id END) AS DECIMAL) / CAST(COUNT(impression_id) AS DECIMAL) * 100, 1) AS ctr
FROM ad_impressions 
GROUP BY ad_campaign
HAVING COUNT(impression_id) > 15
ORDER BY ctr DESC, ad_campaign
