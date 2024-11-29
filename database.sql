CREATE DATABASE property_listing;

USE property_listing;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('admin', 'agent', 'listing_user') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE forms (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    listing_type ENUM('Rental', 'Sales'),
    category VARCHAR(50),
    emirates VARCHAR(50),
    sub_location VARCHAR(100),
    street_name VARCHAR(100),
    google_coordinates VARCHAR(100),
    price DECIMAL(10, 2),
    security_deposit_type ENUM('Cash', 'Cheque', 'No Deposit'),
    security_deposit_amount DECIMAL(10, 2),
    agency_commission DECIMAL(10, 2),
    owner_name VARCHAR(100),
    owner_number VARCHAR(15),
    uploaded_to_social_media BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE form_fields (
    id INT AUTO_INCREMENT PRIMARY KEY,
    form_id INT,
    field_name VARCHAR(100),
    field_value TEXT,
    FOREIGN KEY (form_id) REFERENCES forms(id)
);

CREATE TABLE uploads (
    id INT AUTO_INCREMENT PRIMARY KEY,
    form_id INT,
    media_type ENUM('image', 'video'),
    file_path VARCHAR(255),
    FOREIGN KEY (form_id) REFERENCES forms(id)
);