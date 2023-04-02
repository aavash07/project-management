class Project < ApplicationRecord
  belongs_to :user
  enum project_type: %i[in_house external international]
  has_one_attached :thumbnail, dependent: :destroy
  has_many :contents, class_name: 'Content', dependent: :destroy
end
