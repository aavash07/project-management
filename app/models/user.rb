class User < ApplicationRecord
  has_secure_password
  has_many :projects, class_name: 'Project', dependent: :destroy
end
