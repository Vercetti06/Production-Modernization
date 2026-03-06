-- Insert sample user
INSERT INTO users (full_name, email)
VALUES ('Test User', 'test@ecostream.com');

-- Insert sample device
INSERT INTO devices (user_id, device_name, location, installed_on)
VALUES (1, 'Solar Panel A1', 'Kerala, India', '2024-01-10');

-- Insert sample energy reading
INSERT INTO energy_readings (device_id, energy_output_kw)
VALUES (1, 5.75);
