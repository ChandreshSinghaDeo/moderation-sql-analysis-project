-- =========================================================
-- 6) EXPLORATORY DATA ANALYSIS
-- =========================================================

-- 1. Most common violation categories
SELECT violation_category, COUNT(*) AS total_cases
FROM moderation_log
WHERE violation_category IS NOT NULL
GROUP BY violation_category
ORDER BY total_cases DESC;

-- 2. Weekly moderation volume
SELECT fw, COUNT(*) AS volume
FROM moderation_log
GROUP BY fw
ORDER BY volume DESC;

-- 3. Moderator performance ranking
SELECT RANK() OVER (ORDER BY COUNT(*) DESC) AS manager_rank,
       community_manager,
       COUNT(*) AS data_moderated
FROM moderation_log
GROUP BY community_manager
ORDER BY manager_rank;

