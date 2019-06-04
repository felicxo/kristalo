-- +micrate Up
CREATE TABLE debts (
  id BIGSERIAL PRIMARY KEY,
  from_id BIGINT,
  to_id BIGINT,
  amount INT,
  label VARCHAR,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);
CREATE INDEX debt_from_id_idx ON debts (from_id);
CREATE INDEX debt_to_id_idx ON debts (to_id);

-- +micrate Down
DROP TABLE IF EXISTS debts;
