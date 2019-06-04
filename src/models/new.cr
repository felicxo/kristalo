class New < Granite::Base
  adapter pg
  table_name news

  belongs_to :user

  primary id : Int64
  field body : String
  timestamps
end
