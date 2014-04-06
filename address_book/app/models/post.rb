class Post < ActiveRecord::Base
  attr_accessible :text, :title #,:user_id
  has_many :comments, dependent: :destroy
  belongs_to :user
  validates :title, presence: true,
            length: { minimum: 5 }

end
