-- Create extension for UUID if needed (optional)
-- CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Telemetry Data Table
CREATE TABLE IF NOT EXISTS telemetry_data (
    id SERIAL PRIMARY KEY,
    device_id VARCHAR(100),
    payload JSONB NOT NULL,
    status VARCHAR(50) DEFAULT 'received',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Indexing for faster queries on JSONB and timestamps
CREATE INDEX IF NOT EXISTS idx_telemetry_created_at ON telemetry_data(created_at);
CREATE INDEX IF NOT EXISTS idx_telemetry_device_id ON telemetry_data((payload->>'device_id'));