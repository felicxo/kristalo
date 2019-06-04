-- +micrate Up
CREATE TABLE participants (
  id BIGSERIAL PRIMARY KEY,
  user_id BIGINT,
  tournament_id BIGINT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);
CREATE INDEX participant_user_id_idx ON participants (user_id);
CREATE INDEX participant_tournament_id_idx ON participants (tournament_id);

-- +micrate Down
DROP TABLE IF EXISTS participants;
