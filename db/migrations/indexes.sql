-- Index for faster email lookups
CREATE INDEX idx_users_email ON users(email);

-- Index for device ownership
CREATE INDEX idx_devices_user_id ON devices(user_id);

-- Index for time-series queries
CREATE INDEX idx_energy_readings_time ON energy_readings(reading_time);
