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
    inicio_reserva TIME,
    fim_reserva TIME,
    id_quarto INT NOT NULL,
    id_hospede INT,
    CONSTRAINT fk_hospede FOREIGN KEY (id_hospede) REFERENCES hospedes(id_hospede),
    CONSTRAINT fk_quarto FOREIGN KEY (id_quarto) REFERENCES quartos(id_quarto)
);

INSERT INTO hospedes (nome, idade, telefone) VALUES ('Kevin Lima', 17, '(11) 99999-9999'), ('Carla Braga', 18, '(11) 88888-8888'), ('Maria Silva', 19, '(11) 77777-7777'), ('João Silva', 20, '(11) 66666-6666'), ('Ana Silva', 21, '(11) 55555-5555'), ('Pedro Silva', 22, '(11) 44444-4444'), ('Mariana Gomes', 19, '(11) 33333-3333');

INSERT INTO quartos (nome, preco) VALUES ('Suite 1', 100), ('Suite 2', 200), ('Suite 3', 300), ('Suite 4', 400), ('Suite 5', 500), ('Suite 6', 600), ('Suite 7', 700), ('Suite 8', 800), ('Suite 9', 900),  ('Suite 10', 1000);

INSERT INTO reservas (id_hospede, id_quarto, inicio_reserva, fim_reserva) VALUES (1, 10, '10:00', '11:00'), (2, 9, '12:00', '13:00'), (3, 8, '14:00', '15:00'), (4, 7, '16:00', '17:00'), (5, 6, '18:00', '19:00'), (6, 5, '20:00', null), (7, 4, '22:00', null);

(Saber os hospedes que estão em cada quarto, quando saíram e quando entraram)
SELECT 
	r.id_reserva,
	q.id_quarto,
	h.nome AS hospede,
	h.telefone,
	h.idade,
	q.nome AS quarto,
	q.preco,
	r.data_reserva,
	r.inicio_reserva,
	r.fim_reserva
FROM
	reservas r
JOIN
	hospedes h ON r.id_hospede = h.id_hospede
JOIN
	quartos q ON r.id_quarto = q.id_quarto
WHERE
	r.fim_reserva IS NOT NULL;

(Ver todos os hospedes que habitam em cada quarto, contando com os que já saíram e os ainda ativos)    
SELECT 
	r.id_reserva,
	q.id_quarto,
	h.nome AS hospede,
	h.telefone,
	h.idade,
	q.nome AS quarto,
	q.preco,
	r.data_reserva,
	r.inicio_reserva,
	r.fim_reserva
FROM
	reservas r
JOIN
	hospedes h ON r.id_hospede = h.id_hospede
JOIN
	quartos q ON r.id_quarto = q.id_quarto;

(Mostrar todos os quartos que ainda não foram reservados)
SELECT 
	r.id_reserva,
	q.id_quarto,
	h.nome AS hospede,
	h.telefone,
	h.idade,
	q.nome AS quarto,
	q.preco,
	r.data_reserva,
	r.inicio_reserva,
	r.fim_reserva
FROM
	hospedes h
RIGHT JOIN 
	reservas r ON h.id_hospede = r.id_hospede
RIGHT JOIN
	quartos q ON r.id_quarto = q.id_quarto
WHERE
	r.inicio_reserva IS NULL;