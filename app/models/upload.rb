class Upload
  include Mongoid::Document
  field :file, type: String
  field :filename, type: String
  field :count,type: Integer
  field :username, type: String
  validates :filename, :uniqueness =>{ :message => "  Already Exists" }
  validates :filename, :format => {:with => /$*\.(jpg|png|gif|jpeg|JPG|PNG|GIF|JPEG|doc|docx|pdf|PDF)/,:message => " must be of (jpg|png|gif|jpeg|doc|docx|pdf) extension"}

  has_many :mailids

 paginates_per 3

 mount_uploader :file, UploadFileUploader

end
