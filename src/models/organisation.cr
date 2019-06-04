class Organisation < Granite::Base
  adapter pg
  table_name organisations

  primary id : Int64
  field name : String
  field cover_image : String
  timestamps
end
