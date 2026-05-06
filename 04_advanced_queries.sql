-- =========================================================
-- 7) ADVANCED ANALYTICS (WINDOW FUNCTIONS)
-- =========================================================

-- Daily trend with previous day comparison
SELECT moderation_date,
       COUNT(*) AS Daily_Count,
       LAG(COUNT(*)) OVER (ORDER BY moderation_date) AS Previous_Day_Count
FROM moderation_log
GROUP BY moderation_date;

-- Running total over time
SELECT moderation_date,
       COUNT(*) AS daily_actions,
       SUM(COUNT(*)) OVER (ORDER BY moderation_date) AS running_total
FROM moderation_log
GROUP BY moderation_date;


-- =========================================================
-- 8) CTE BASED ANALYSIS
-- =========================================================

-- Above-average moderators
WITH moderator_counts AS (
    SELECT community_manager,
           COUNT(*) AS actions_taken
    FROM moderation_log
    GROUP BY community_manager
),
avg_performance AS (
    SELECT AVG(actions_taken) AS avg_actions
    FROM moderator_counts
)
SELECT mc.*
FROM moderator_counts mc, avg_performance ap
WHERE mc.actions_taken > ap.avg_actions;


-- Top 5 boards by violations
WITH highest_boards AS (
    SELECT board_name, COUNT(*) AS No_Count
    FROM moderation_log
    GROUP BY board_name
)
SELECT *
FROM highest_boards
ORDER BY No_Count DESC
LIMIT 5;


-- Monthly spikes above average
WITH Monthly_date AS (
    SELECT DATE_FORMAT(moderation_date,'%Y-%M') AS Month,
           COUNT(*) AS Monthly_Count
    FROM moderation_log
    GROUP BY Month
),
Average_monthly AS (
    SELECT AVG(Monthly_Count) AS Avg_action
    FROM Monthly_date
)
SELECT md.*
FROM Monthly_date md, Average_monthly am
WHERE md.Monthly_Count > am.Avg_action;


-- Executive dashboard summary
WITH board_kpis AS (
    SELECT board_name,
           COUNT(*) AS total_cases,
           COUNT(DISTINCT username) AS unique_users,
           COUNT(DISTINCT community_manager) AS active_moderators
    FROM moderation_log
    GROUP BY board_name
)
SELECT *
FROM board_kpis
ORDER BY total_cases DESC;