-- +micrate Up
CREATE TABLE organisations (
  id BIGSERIAL PRIMARY KEY,
  name VARCHAR,
  cover_image VARCHAR,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);


-- +micrate Down
DROP TABLE IF EXISTS organisations;
