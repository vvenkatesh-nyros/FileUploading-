class People
  include Mongoid::Document
  field :username, type: String 
  field :password, type: String
  field :name, type: String
  field :email, type: String


  validates :username, :uniqueness =>{ :message => "  Already Exists" }

  paginates_per 2
end
