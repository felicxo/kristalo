class Tournament < Granite::Base
  adapter pg
  table_name tournament

  belongs_to :organisation

  primary id : Int64
  field title : String
  timestamps
end
