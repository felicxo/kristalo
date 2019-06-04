class Photo < Granite::Base
  adapter pg
  table_name photos

  belongs_to :organisation

  primary id : Int64
  field storage : String
  timestamps
end
