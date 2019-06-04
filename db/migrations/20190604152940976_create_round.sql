-- +micrate Up
CREATE TABLE rounds (
  id BIGSERIAL PRIMARY KEY,
  winner_id BIGINT,
  participant_1_id BIGINT,
  participant_2_id BIGINT,
  previous_round_1_id BIGINT,
  previous_round_2_id BIGINT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);
CREATE INDEX round_winner_id_idx ON rounds (winner_id);
CREATE INDEX round_participant_1_id_idx ON rounds (participant_1_id);
CREATE INDEX round_participant_2_id_idx ON rounds (participant_2_id);
CREATE INDEX round_previous_round_1_id_idx ON rounds (previous_round_1_id);
CREATE INDEX round_previous_round_2_id_idx ON rounds (previous_round_2_id);

-- +micrate Down
DROP TABLE IF EXISTS rounds;
