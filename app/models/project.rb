class Project < ApplicationRecord
  belongs_to :user
  enum type: %i[in_house external international]
  has_one_attached :thumbnail, dependent: :destroy
  has_many :contents, class_name: 'Content', dependent: :destroy

  # allows usage of column name type by active record
  self.inheritance_column = nil 
end
