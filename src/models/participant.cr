class Participant < Granite::Base
  adapter pg
  table_name participants

  belongs_to :user

  belongs_to :tournament

  primary id : Int64
  timestamps
end
