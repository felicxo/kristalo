class Debt < Granite::Base
  adapter pg
  table_name debts

  belongs_to from : User
  belongs_to to : User

  primary id : Int64
  field amount : Int32
  field label : String
  timestamps
end
