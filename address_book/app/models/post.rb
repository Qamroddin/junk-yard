class Post < ActiveRecord::Base
  attr_accessible :text, :title,:user_id
  has_many :comments, dependent: :destroy
  belongs_to :user
  validates :title, presence: true,
            length: { minimum: 5 }
  after_create :save_post_published
  def save_post_published
    self.user_id = User.current_user.id
  end
end
