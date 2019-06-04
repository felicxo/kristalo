-- +micrate Up
CREATE TABLE news (
  id BIGSERIAL PRIMARY KEY,
  body VARCHAR,
  user_id BIGINT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);
CREATE INDEX new_user_id_idx ON news (user_id);

-- +micrate Down
DROP TABLE IF EXISTS news;
