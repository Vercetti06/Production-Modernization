-- Create users table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create devices table (solar installations)
CREATE TABLE devices (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    device_name VARCHAR(100),
    location VARCHAR(150),
    installed_on DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create energy readings table
CREATE TABLE energy_readings (
    id SERIAL PRIMARY KEY,
    device_id INT REFERENCES devices(id),
    energy_output_kw DECIMAL(10,2),
    reading_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
