CREATE TABLE customers(
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

CREATE TABLE seats(
    seats_id SERIAL PRIMARY KEY,
    row_num VARCHAR(5),
    seat_num VARCHAR(5),
    customer_id INTEGER,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- add fk for movies_id 
CREATE TABLE tickets(
    tickets_id SERIAL PRIMARY KEY,
    quantity INTEGER,
    seats_id INTEGER,
    FOREIGN KEY (seats_id) REFERENCES seats(seats_id),
    customer_id INTEGER,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE concessions(
    concessions_id SERIAL PRIMARY KEY,
    conession_type VARCHAR(100),
    quantity INTEGER,
    tickets_id INTEGER,
    FOREIGN KEY (tickets_id) REFERENCES tickets(tickets_id)
);

CREATE TABLE movies(
    movies_id SERIAL PRIMARY KEY,
    title VARCHAR(100),
    director VARCHAR(100),
    movie_cast VARCHAR(100),
    movie_description VARCHAR(500),
    genre VARCHAR(100),
    duration_min INTEGER,
    rating VARCHAR(5),
    seats_id INTEGER,
    FOREIGN KEY (seats_id) REFERENCES seats(seats_id)
);

-- add foreign key for movies_id to tickets table
ALTER TABLE tickets
ADD movies_id INTEGER;

ALTER TABLE tickets
ADD FOREIGN KEY (movies_id) REFERENCES movies(movies_id);

-- alter first and last name to be set to not null
ALTER TABLE customers
ALTER COLUMN first_name SET NOT NULL;

ALTER TABLE customers
ALTER COLUMN last_name SET NOT NULL;

-- fix typo
ALTER TABLE concessions
RENAME COLUMN conession_type TO concession_type;

-- alter movie_cast type
ALTER TABLE movies
ALTER COLUMN movie_cast TYPE VARCHAR(500);