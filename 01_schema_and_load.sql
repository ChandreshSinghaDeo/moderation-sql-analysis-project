-- =========================================================
-- 0) SETUP: Enable UTF-8 encoding for proper text handling
-- =========================================================
SET NAMES 'utf8mb4';

-- Optional: Enable local file import (may require privileges)
-- SET GLOBAL local_infile = 1;


-- =========================================================
-- 1) DATABASE CREATION
-- =========================================================
CREATE DATABASE IF NOT EXISTS moderation_project
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

USE moderation_project;


-- =========================================================
-- 2) TABLE CREATION (Schema Design)
-- =========================================================
DROP TABLE IF EXISTS moderation_log;

CREATE TABLE moderation_log (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,  -- Unique identifier

  language VARCHAR(100),                 -- Language of content
  fw VARCHAR(20),                        -- Fiscal Week (e.g., FW27)
  moderation_date DATE,                  -- Moderation date

  board_name VARCHAR(255),               -- Main board
  sub_board VARCHAR(255),                -- Sub-board category

  post_title TEXT,                       -- Title of post
  post_content TEXT,                     -- Full content
  post_time DATETIME,                    -- Timestamp of post

  username VARCHAR(255),                 -- User who posted
  new_thread TINYINT,                    -- 1 = Yes, 0 = No

  link TEXT,                             -- Post link
  community_manager VARCHAR(255),        -- Moderator
  action_taken VARCHAR(255),             -- Action (Delete, Warning, etc.)
  violation_comment TEXT,                -- Moderation notes
  violation_category VARCHAR(255),       -- Category of violation
  spammers_ip VARCHAR(100),              -- Spam IP
  spammers_email VARCHAR(255),           -- Spam email

  translated_title TEXT,                 -- Reserved for translation
  translated_post_content TEXT,

  created_at DATETIME DEFAULT CURRENT_TIMESTAMP  -- Auto timestamp
) CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;


-- =========================================================
-- 3) INDEXING (Performance Optimization)
-- =========================================================
CREATE INDEX idx_moderation_date ON moderation_log(moderation_date);
CREATE INDEX idx_violation_category ON moderation_log(violation_category);
CREATE INDEX idx_username ON moderation_log(username);


-- =========================================================
-- 4) DATA LOADING + CLEANING (ETL)
-- =========================================================
LOAD DATA LOCAL INFILE 'D:\\SQL Projects\\Dell Moderation Log SQL Project\\cleaned_english_moderation_log.csv'
INTO TABLE moderation_log
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(
  @fw,
  @moderation_date_str,
  @board_name,
  @sub_board,
  @post_title,
  @post_content,
  @post_time_str,
  @username,
  @new_thread_raw,
  @link,
  @community_manager,
  @action_taken,
  @violation_comment,
  @violation_category,
  @spammers_ip,
  @spammers_email
)
SET
  language = 'English',

  -- Clean FW field
  fw = NULLIF(TRIM(@fw),''),

  -- Convert string → DATE
  moderation_date = STR_TO_DATE(TRIM(@moderation_date_str), '%d-%m-%Y'),

  -- Clean text fields
  board_name = NULLIF(TRIM(@board_name),''),
  sub_board = NULLIF(TRIM(@sub_board),''),
  post_title = NULLIF(TRIM(@post_title),''),
  post_content = NULLIF(TRIM(@post_content),''),

  -- Convert string → DATETIME
  post_time = STR_TO_DATE(TRIM(@post_time_str), '%d-%m-%Y %H:%i:%s'),

  username = NULLIF(TRIM(@username),''),

  -- Convert Y/N → 1/0
  new_thread = CASE
                 WHEN UPPER(NULLIF(TRIM(@new_thread_raw),'')) = 'Y' THEN 1
                 WHEN UPPER(NULLIF(TRIM(@new_thread_raw),'')) = 'N' THEN 0
                 ELSE NULL
               END,

  link = NULLIF(TRIM(@link),''),
  community_manager = NULLIF(TRIM(@community_manager),''),
  action_taken = NULLIF(TRIM(@action_taken),''),
  violation_comment = NULLIF(TRIM(@violation_comment),''),
  violation_category = NULLIF(TRIM(@violation_category),''),
  spammers_ip = NULLIF(TRIM(@spammers_ip),''),
  spammers_email = NULLIF(TRIM(@spammers_email),''),

  -- Placeholder columns
  translated_title = NULL,
  translated_post_content = NULL;
