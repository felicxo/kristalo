-- +micrate Up
CREATE TABLE tournament (
  id BIGSERIAL PRIMARY KEY,
  title VARCHAR,
  organisation_id BIGINT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);
CREATE INDEX tournament_organisation_id_idx ON tournament (organisation_id);

-- +micrate Down
DROP TABLE IF EXISTS tournament;
