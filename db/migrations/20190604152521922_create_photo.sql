-- +micrate Up
CREATE TABLE photos (
  id BIGSERIAL PRIMARY KEY,
  storage VARCHAR,
  organisation_id BIGINT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);
CREATE INDEX photo_organisation_id_idx ON photos (organisation_id);

-- +micrate Down
DROP TABLE IF EXISTS photos;
