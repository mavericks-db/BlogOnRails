class User < ApplicationRecord
  before_create :set_defaults
  after_initialize :init
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable
  has_many :comments
  has_many :posts
  has_many :likes

  def recent_3_posts
    posts.includes(:user).limit(3).order(created_at: :desc)
  end

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  private

  def set_defaults
    self.photo = 'https://picsum.photos/200/300'
  end

  def init
    self.posts_counter ||= 0
  end
end
