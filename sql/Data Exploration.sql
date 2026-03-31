/* =========================================================
-- E-commerce Data Exploration
-- Author: Mia Enciso
   ========================================================= */

USE ecommerce_project;

-- ============================================
-- 1. Overall Business KPIs
-- ============================================
SELECT 
    SUM(s.revenue) AS total_revenue,
    COUNT(s.session_id) AS total_sessions,
    SUM(s.converted) AS total_conversions,
    ROUND(AVG(CAST(s.converted AS FLOAT)) * 100, 2) AS conversion_rate_percent,
    ROUND(AVG(s.session_duration_seconds) / 60.0, 2) AS avg_session_duration_minutes,
    ROUND(AVG(s.pages_viewed), 2) AS avg_pages_viewed,
    ROUND(SUM(s.revenue) / NULLIF(SUM(s.converted), 0), 2) AS avg_revenue_per_order
FROM ecommerce_sessions s
JOIN ecommerce_users u
    ON s.user_id = u.user_id;



-- ============================================
-- 2. Revenue by Traffic Source
-- ============================================
SELECT 
    s.traffic_source,
    SUM(s.revenue) AS total_revenue,
    COUNT(*) AS sessions,
    SUM(s.converted) AS conversions,
    ROUND(AVG(CAST(s.converted AS FLOAT)) * 100, 2) AS conversion_rate_percent,
    ROUND(AVG(s.session_duration_seconds) / 60.0, 2) AS avg_session_duration_minutes,
    ROUND(AVG(s.pages_viewed), 2) AS avg_pages_viewed
FROM ecommerce_sessions s
GROUP BY s.traffic_source
ORDER BY total_revenue DESC;



-- ============================================
-- 3. Performance by Device Type
-- ============================================
SELECT 
    s.device_type,
    SUM(s.revenue) AS total_revenue,
    COUNT(*) AS sessions,
    SUM(s.converted) AS conversions,
    ROUND(AVG(CAST(s.converted AS FLOAT)) * 100, 2) AS conversion_rate_percent,
    ROUND(AVG(s.session_duration_seconds) / 60.0, 2) AS avg_session_duration_minutes,
    ROUND(AVG(s.pages_viewed), 2) AS avg_pages_viewed
FROM ecommerce_sessions s
GROUP BY s.device_type
ORDER BY total_revenue DESC;



-- ============================================
-- 4. Revenue by Customer Segment
-- ============================================
SELECT 
    u.customer_segment,
    SUM(s.revenue) AS total_revenue,
    COUNT(s.session_id) AS sessions,
    SUM(s.converted) AS conversions,
    ROUND(AVG(CAST(s.converted AS FLOAT)) * 100, 2) AS conversion_rate_percent
FROM ecommerce_sessions s
JOIN ecommerce_users u
    ON s.user_id = u.user_id
GROUP BY u.customer_segment
ORDER BY total_revenue DESC;



-- ============================================
-- 5. Revenue by Country
-- ============================================
SELECT 
    u.country,
    SUM(s.revenue) AS total_revenue,
    COUNT(s.session_id) AS sessions,
    SUM(s.converted) AS conversions,
    ROUND(AVG(CAST(s.converted AS FLOAT)) * 100, 2) AS conversion_rate_percent
FROM ecommerce_sessions s
JOIN ecommerce_users u
    ON s.user_id = u.user_id
GROUP BY u.country
ORDER BY total_revenue DESC;



-- ============================================
-- 6. Age Group Analysis
-- ============================================
SELECT 
    CASE 
        WHEN u.age BETWEEN 18 AND 29 THEN '18-29'
        WHEN u.age BETWEEN 30 AND 44 THEN '30-44'
        WHEN u.age BETWEEN 45 AND 59 THEN '45-59'
        WHEN u.age >= 60 THEN '60+'
    END AS age_group,
    SUM(s.revenue) AS total_revenue,
    COUNT(s.session_id) AS sessions,
    SUM(s.converted) AS conversions,
    ROUND(AVG(CAST(s.converted AS FLOAT)) * 100, 2) AS conversion_rate_percent
FROM ecommerce_sessions s
JOIN ecommerce_users u
    ON s.user_id = u.user_id
GROUP BY 
    CASE 
        WHEN u.age BETWEEN 18 AND 29 THEN '18-29'
        WHEN u.age BETWEEN 30 AND 44 THEN '30-44'
        WHEN u.age BETWEEN 45 AND 59 THEN '45-59'
        WHEN u.age >= 60 THEN '60+'
    END
ORDER BY total_revenue DESC;



-- ============================================
-- 7. Monthly Revenue Trend
-- ============================================
SELECT 
    YEAR(session_date) AS year,
    MONTH(session_date) AS month,
    SUM(revenue) AS total_revenue,
    COUNT(session_id) AS sessions,
    SUM(converted) AS conversions,
    ROUND(AVG(CAST(converted AS FLOAT)) * 100, 2) AS conversion_rate_percent
FROM ecommerce_sessions
GROUP BY 
    YEAR(session_date),
    MONTH(session_date)
ORDER BY 
    year, month;



-- ============================================
-- 8. Page Engagement vs Conversion and Revenue
-- ============================================
SELECT
    CASE 
        WHEN s.session_duration_seconds / 60.0 < 1 THEN '< 1 min'
        WHEN s.session_duration_seconds / 60.0 >= 1 AND s.session_duration_seconds / 60.0 < 3 THEN '1–3 min'
        WHEN s.session_duration_seconds / 60.0 >= 3 AND s.session_duration_seconds / 60.0 < 5 THEN '3–5 min'
        WHEN s.session_duration_seconds / 60.0 >= 5 AND s.session_duration_seconds / 60.0 < 10 THEN '5–10 min'
        WHEN s.session_duration_seconds / 60.0 >= 10 AND s.session_duration_seconds / 60.0 < 20 THEN '10–20 min'
        ELSE '20–60 min'
    END AS session_duration_bucket,
    COUNT(*) AS total_sessions,
    SUM(CASE WHEN s.converted = 1 THEN 1 ELSE 0 END) AS converted_sessions,
    ROUND(100.0 * SUM(CASE WHEN s.converted = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS conversion_rate_percent,
    MIN(s.pages_viewed) AS min_pages_viewed,
    MAX(s.pages_viewed) AS max_pages_viewed,
    ROUND(AVG(s.pages_viewed * 1.0), 2) AS avg_pages_viewed,
    ROUND(SUM(s.revenue), 2) AS total_revenue
FROM ecommerce_sessions s
GROUP BY 
    CASE 
        WHEN s.session_duration_seconds / 60.0 < 1 THEN '< 1 min'
        WHEN s.session_duration_seconds / 60.0 >= 1 AND s.session_duration_seconds / 60.0 < 3 THEN '1–3 min'
        WHEN s.session_duration_seconds / 60.0 >= 3 AND s.session_duration_seconds / 60.0 < 5 THEN '3–5 min'
        WHEN s.session_duration_seconds / 60.0 >= 5 AND s.session_duration_seconds / 60.0 < 10 THEN '5–10 min'
        WHEN s.session_duration_seconds / 60.0 >= 10 AND s.session_duration_seconds / 60.0 < 20 THEN '10–20 min'
        ELSE '20–60 min'
    END
ORDER BY 
    MIN(s.session_duration_seconds) / 60.0;