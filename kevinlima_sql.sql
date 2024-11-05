CREATE DATABASE reservas_quartos;

\c reservas_quartos;

CREATE TABLE hospedes (
    id_hospede SERIAL PRIMARY KEY,
    nome VARCHAR(40) NOT NULL,
    idade INT NOT NULL,
    telefone VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE quartos (
    id_quarto SERIAL PRIMARY KEY,
    nome VARCHAR(40) NOT NULL,
    preco DECIMAL(7,2) NOT NULL
);

CREATE TABLE reservas (
    id_reserva SERIAL PRIMARY KEY,
    data_reserva DATE NOT NULL DEFAULT CURRENT_DATE,
    inicio_reserva VARCHAR(10) NOT NULL,
    fim_reserva VARCHAR(10) NOT NULL,
    id_quarto INT NOT NULL,
    id_hospede INT NOT NULL,
    status BOOLEAN NOT NULL,
    CONSTRAINT fk_hospede FOREIGN KEY (id_hospede) REFERENCES hospedes(id_hospede),
    CONSTRAINT fk_quarto FOREIGN KEY (id_quarto) REFERENCES quartos(id_quarto)
);

INSERT INTO hospedes (nome, idade, telefone) VALUES ('Kevin Lima', 17, '(11) 99999-9999'), ('Carla Braga', 18, '(11) 88888-8888'), ('Maria Silva', 19, '(11) 77777-7777'), ('João Silva', 20, '(11) 66666-6666'), ('Ana Silva', 21, '(11) 55555-5555'), ('Pedro Silva', 22, '(11) 44444-4444'), ('Mariana Gomes', 19, '(11) 33333-3333');

INSERT INTO quartos (nome, preco) VALUES ('Suite 1', 100), ('Suite 2', 200), ('Suite 3', 300), ('Suite 4', 400), ('Suite 5', 500), ('Suite 6', 600), ('Suite 7', 700), ('Suite 8', 800), ('Suite 9', 900),  ('Suite 10', 1000);
