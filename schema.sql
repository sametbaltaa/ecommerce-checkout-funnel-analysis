CREATE TABLE checkout_events (
    event_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    session_id INTEGER NOT NULL,
    event_name VARCHAR(50) NOT NULL,
    event_time TIMESTAMP NOT NULL,
    device_type VARCHAR(20) NOT NULL,
    user_type VARCHAR(20) NOT NULL,
    traffic_source VARCHAR(30) NOT NULL
);