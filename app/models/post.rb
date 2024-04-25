class Post < ApplicationRecord
  validates :name, presence: true, length:{maximum: 30}
  validates :description, presence:true, length:{maximum: 255}

  belongs_to :user
end
