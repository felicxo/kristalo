-- +micrate Up
ALTER TABLE users
  ADD COLUMN first_name VARCHAR,
  ADD COLUMN last_name VARCHAR,
  ADD COLUMN profile_image VARCHAR,
  ADD COLUMN organisation_id BIGINT;

CREATE INDEX user_organisation_id_idx ON users (organisation_id);

-- +micrate Down
