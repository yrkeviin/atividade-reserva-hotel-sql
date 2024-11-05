CREATE DATABASE reservas_quartos;

\c reservas_quartos;

CREATE TABLE hospedes (
    id_hospede SERIAL PRIMARY KEY,
    nome VARCHAR(40) NOT NULL,
    idade INT NOT NULL,
    telefone VARCHAR(20) NOT NULL UNIQUE,
);

CREATE TABLE quartos (
    id_quarto SERIAL PRIMARY KEY,
    nome VARCHAR(40) NOT NULL,
    preco DECIMAL(5,2) NOT NULL,
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
