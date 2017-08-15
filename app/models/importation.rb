class Importation < ApplicationRecord
  mount_uploader :file, FileUploader

  validates_presence_of :file

  has_many :sales, dependent: :nullify
end
