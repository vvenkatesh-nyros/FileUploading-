class Mailid
  include Mongoid::Document
  field :mail
  field :upload_id
  belongs_to :upload

end
