class Post < ActiveRecord::Base
  validates :title, presence: true,
                    lenght: { minimum: 5 }
end
