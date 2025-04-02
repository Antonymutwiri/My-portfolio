-- Create the database
CREATE DATABASE antony_portfolio;
USE antony_portfolio;

-- Users table (for potential admin/contact form)
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Personal information table
CREATE TABLE personal_info (
    info_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    title VARCHAR(100) NOT NULL,
    location VARCHAR(100) NOT NULL,
    bio TEXT,
    years_experience INT,
    projects_completed INT,
    profile_image_path VARCHAR(255),
    logo_path VARCHAR(255),
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Skills table
CREATE TABLE skills (
    skill_id INT AUTO_INCREMENT PRIMARY KEY,
    skill_name VARCHAR(50) NOT NULL,
    proficiency INT CHECK (proficiency BETWEEN 0 AND 100),
    category VARCHAR(50),
    display_order INT,
    icon_class VARCHAR(50)
);

-- Portfolio projects table
CREATE TABLE projects (
    project_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    category VARCHAR(50),
    image_path VARCHAR(255),
    github_url VARCHAR(255),
    live_url VARCHAR(255),
    featured BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Blog posts table
CREATE TABLE blog_posts (
    post_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    excerpt TEXT,
    image_path VARCHAR(255),
    category VARCHAR(50),
    slug VARCHAR(255) UNIQUE,
    published BOOLEAN DEFAULT FALSE,
    published_at TIMESTAMP NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Contact information table
CREATE TABLE contact_info (
    contact_id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    address TEXT,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Contact form submissions
CREATE TABLE contact_submissions (
    submission_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    message TEXT NOT NULL,
    ip_address VARCHAR(45),
    user_agent TEXT,
    submitted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_read BOOLEAN DEFAULT FALSE
);

-- Social media links
CREATE TABLE social_links (
    link_id INT AUTO_INCREMENT PRIMARY KEY,
    platform_name VARCHAR(50) NOT NULL,
    url VARCHAR(255) NOT NULL,
    icon_class VARCHAR(50),
    display_order INT
);

-- Navigation menu items
CREATE TABLE navigation_menu (
    menu_id INT AUTO_INCREMENT PRIMARY KEY,
    label VARCHAR(50) NOT NULL,
    url VARCHAR(255) NOT NULL,
    display_order INT NOT NULL,
    is_external BOOLEAN DEFAULT FALSE,
    is_active BOOLEAN DEFAULT TRUE
);

-- CV/Resume versions
CREATE TABLE resumes (
    resume_id INT AUTO_INCREMENT PRIMARY KEY,
    file_path VARCHAR(255) NOT NULL,
    version VARCHAR(50),
    upload_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_current BOOLEAN DEFAULT TRUE
);

-- Testimonials
CREATE TABLE testimonials (
    testimonial_id INT AUTO_INCREMENT PRIMARY KEY,
    client_name VARCHAR(100) NOT NULL,
    client_title VARCHAR(100),
    content TEXT NOT NULL,
    image_path VARCHAR(255),
    display_order INT,
    is_featured BOOLEAN DEFAULT FALSE
);

-- Insert initial personal info
INSERT INTO personal_info (full_name, title, location, bio, years_experience, projects_completed)
VALUES ('Antony Mutwiri', 'Software Developer from Nairobi Kenya', 'Nairobi, Kenya', 
        'I specialize in creating dynamic and beautiful Web/Mobile Applications.', 3, 20);

-- Insert contact info
INSERT INTO contact_info (email, phone, address)
VALUES ('antonymtwi@gmail.com', '+254742278301', '00100, Nairobi, Kenya');

-- Insert navigation menu items
INSERT INTO navigation_menu (label, url, display_order) VALUES
('Home', '#home', 1),
('About', '#about', 2),
('Portfolio', '#portfolio', 3),
('Skills', '#skills', 4),
('Contact', '#contact', 5),
('Blog', '#blog', 6);

-- Insert sample skills
INSERT INTO skills (skill_name, proficiency, category, display_order) VALUES
('Bootstrap5', 95, 'Frontend', 1),
('React', 75, 'Frontend', 2),
('MongoDB', 90, 'Backend', 3),
('Python', 70, 'Backend', 4),
('DJango', 80, 'Backend', 5),
('JavaScript', 75, 'Frontend', 6);

-- Insert sample projects
INSERT INTO projects (title, description, category, featured) VALUES
('Web Application for Desiverse', 'Web application development project', 'Web Applications', TRUE),
('Mobile Application for Desiverse', 'Mobile app development project', 'Mobile Applications', TRUE),
('Network Solution for Company X', 'Network engineering project', 'Network Engineer', TRUE);

-- Insert sample blog posts
INSERT INTO blog_posts (title, content, excerpt, category, published, published_at) VALUES
('Top Web Development Trends to Watch in 2025', 'Content about web dev trends...', 'Stay updated with the latest web development trends', 'Web Development', TRUE, NOW()),
('How to Build Scalable and Efficient Web Applications', 'Content about scalable apps...', 'Learn best practices for scalable applications', 'Web Development', TRUE, NOW()),
('10 Ways to Improve Website Performance and Speed', 'Content about performance...', 'Optimize your website for better performance', 'Performance Optimization', TRUE, NOW());