-- =========================================================
-- 5) DATA VALIDATION
-- =========================================================

-- Total records loaded
SELECT COUNT(*) FROM moderation_log;

-- Check date parsing issues
SELECT COUNT(*) AS null_moderation_dates
FROM moderation_log
WHERE moderation_date IS NULL;

-- Check datetime parsing issues
SELECT COUNT(*) AS null_Post_Time
FROM moderation_log
WHERE post_time IS NULL;

-- Inspect problematic rows
SELECT *
FROM moderation_log
WHERE post_time IS NULL;

-- Optional: remove bad rows
DELETE FROM moderation_log
WHERE post_time IS NULL;

