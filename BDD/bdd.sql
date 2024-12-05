DROP DATABASE IF EXISTS chatoid;
CREATE DATABASE chatoid;
USE chatoid;


CREATE TABLE Roles (
    id_role INT AUTO_INCREMENT PRIMARY KEY,
    role VARCHAR(255) NOT NULL
);

CREATE TABLE Users (
    id_user INT AUTO_INCREMENT PRIMARY KEY,
    lastname VARCHAR(255) NOT NULL,
    firstname VARCHAR(255) NOT NULL,
    mail VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(15),
    password VARCHAR(255) NOT NULL,
    job VARCHAR(255),
    is_blocked BOOLEAN DEFAULT FALSE
);


CREATE TABLE Affecter (
    id_role INT,
    id_user INT,
    PRIMARY KEY (id_role, id_user),
    FOREIGN KEY (id_role) REFERENCES Roles (id_role),
    FOREIGN KEY (id_user) REFERENCES Users (id_user) 
);


CREATE TABLE Chats (
    id_chat INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    is_group BOOLEAN DEFAULT FALSE,
    id_admin INT NOT NULL,
    FOREIGN KEY (id_admin) REFERENCES Users (id_user)
);


CREATE TABLE Participer (
    id_chat INT,
    id_user INT,
    PRIMARY KEY (id_chat, id_user),
    FOREIGN KEY (id_chat) REFERENCES Chats (id_chat),
    FOREIGN KEY (id_user) REFERENCES Users (id_user)
);


CREATE TABLE Messages (
    id_message INT AUTO_INCREMENT PRIMARY KEY,
    message TEXT NOT NULL,
    create_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    update_date DATETIME ON UPDATE CURRENT_TIMESTAMP,
    id_user INT NOT NULL,
    id_chat INT NOT NULL,
    FOREIGN KEY (id_user) REFERENCES Users (id_user),
    FOREIGN KEY (id_chat) REFERENCES Chats (id_chat)
);

INSERT INTO Roles (role) VALUES 
('Administrateur'),
('Utilisateur');

INSERT INTO Users (lastname, firstname, mail, phone, password, job, is_blocked) VALUES
('Missoum', 'Rayan', 'r@gmail.com', '0601020304', 'password123', 'Développeur', FALSE),
('Picq', 'Elian', 'e@gmail.com', '0612345678', 'password456', 'Designer', FALSE),
('Poliak', 'Mathieu', 'm@gmail.com', '0623456789', 'password789', 'Manager', TRUE);

INSERT INTO Affecter (id_role, id_user) VALUES 
(1, 1), 
(2, 2), 
(2, 3);

INSERT INTO Chats (title, is_group, id_admin) VALUES 
('', TRUE, 1), 
('', FALSE, 1); 

INSERT INTO Participer (id_chat, id_user) VALUES 
(1, 1), 
(1, 2), 
(2, 2); 

INSERT INTO Messages (message, id_user, id_chat) VALUES 
('Bonjour à tous !', 1, 1), 
('Salut Jean !', 2, 1), 
('Quand est la prochaine réunion ?', 2, 2); 

-- SELECT * FROM Roles;
-- SELECT * FROM Users;
-- SELECT * FROM Affecter;
-- SELECT * FROM Chats;
-- SELECT * FROM Participer;
-- SELECT * FROM Messages;
