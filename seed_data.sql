-- Generate synthetic checkout funnel data
-- 2,000 sessions across two weeks

WITH sessions AS (
    SELECT
        session_number,
        CASE
            WHEN session_number <= 1000
                THEN '2026-10-12'::timestamp
            ELSE '2026-10-19'::timestamp
        END AS session_date,
        CASE
            WHEN session_number <= 1000 THEN 820
            ELSE 700
        END AS checkout_threshold
    FROM generate_series(1, 2000) AS session_number
),

events AS (
    SELECT
        s.session_number AS session_id,
        e.event_name,
        s.session_date
            + (s.session_number % 600) * interval '1 minute'
            + e.step * interval '2 minutes' AS event_time,

        CASE
            WHEN s.session_number % 3 = 0 THEN 'desktop'
            ELSE 'mobile'
        END AS device_type,

        CASE
            WHEN s.session_number % 2 = 0 THEN 'new'
            ELSE 'returning'
        END AS user_type,

        CASE
            WHEN s.session_number % 3 = 0 THEN 'organic'
            WHEN s.session_number % 3 = 1 THEN 'paid_ads'
            ELSE 'direct'
        END AS traffic_source

    FROM sessions s

    CROSS JOIN (
        VALUES
            (1, 'cart_viewed'),
            (2, 'checkout_started'),
            (3, 'shipping_submitted'),
            (4, 'payment_attempted'),
            (5, 'purchase_completed')
    ) AS e(step, event_name)

    WHERE e.step = 1
        OR (
            e.step = 2
            AND (s.session_number - 1) % 1000 < s.checkout_threshold
        )
        OR (
            e.step = 3
            AND (s.session_number - 1) % 1000 < s.checkout_threshold * 0.8
        )
        OR (
            e.step = 4
            AND (s.session_number - 1) % 1000 < s.checkout_threshold * 0.6
        )
        OR (
            e.step = 5
            AND (s.session_number - 1) % 1000 < s.checkout_threshold * 0.45
        )
)

INSERT INTO checkout_events (
    session_id,
    event_name,
    event_time,
    device_type,
    user_type,
    traffic_source
)

SELECT
    session_id,
    event_name,
    event_time,
    device_type,
    user_type,
    traffic_source
FROM events;