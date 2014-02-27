class Book < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 3 }, :uniqueness => true
  validates :rating, :inclusion => 1..5

end
