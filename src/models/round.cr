class Round < Granite::Base
  adapter pg
  table_name rounds

  belongs_to winner : Participant
  belongs_to participant_1 : Participant
  belongs_to participant_2 : Participant

  belongs_to previous_round_1 : Round
  belongs_to previous_round_2 : Round

  primary id : Int64
  timestamps
end
