-- E-commerce Checkout Funnel Analysis
-- Dataset: 2,000 synthetic sessions
-- Period: October 12–25, 2026


-- 1. Overall Checkout Funnel
-- Count unique sessions at each funnel stage.

SELECT
    event_name,
    COUNT(DISTINCT session_id) AS total_sessions,
    COUNT(*) AS total_events
FROM checkout_events
GROUP BY event_name
ORDER BY total_sessions DESC;


-- 2. Weekly Funnel Comparison
-- Compare funnel activity between the two weeks.

SELECT
    DATE_TRUNC('week', event_time) AS week_start,
    event_name,
    COUNT(DISTINCT session_id) AS total_sessions
FROM checkout_events
GROUP BY week_start, event_name
ORDER BY week_start ASC, event_name ASC;


-- 3. Device Segmentation
-- Compare cart and checkout sessions by device.

SELECT
    DATE_TRUNC('week', event_time) AS week_start,
    device_type,
    COUNT(DISTINCT session_id)
        FILTER (WHERE event_name = 'cart_viewed') AS cart_sessions,
    COUNT(DISTINCT session_id)
        FILTER (WHERE event_name = 'checkout_started') AS checkout_sessions
FROM checkout_events
GROUP BY week_start, device_type
ORDER BY week_start ASC, device_type ASC;


-- 4. User Type Segmentation
-- Compare new and returning users.

SELECT
    DATE_TRUNC('week', event_time) AS week_start,
    user_type,
    COUNT(DISTINCT session_id)
        FILTER (WHERE event_name = 'cart_viewed') AS cart_sessions,
    COUNT(DISTINCT session_id)
        FILTER (WHERE event_name = 'checkout_started') AS checkout_sessions
FROM checkout_events
GROUP BY week_start, user_type
ORDER BY week_start ASC, user_type ASC;


-- 5. Traffic Source Segmentation
-- Compare organic, direct, and paid traffic.

SELECT
    DATE_TRUNC('week', event_time) AS week_start,
    traffic_source,
    COUNT(DISTINCT session_id)
        FILTER (WHERE event_name = 'cart_viewed') AS cart_sessions,
    COUNT(DISTINCT session_id)
        FILTER (WHERE event_name = 'checkout_started') AS checkout_sessions
FROM checkout_events
GROUP BY week_start, traffic_source
ORDER BY week_start ASC, traffic_source ASC;