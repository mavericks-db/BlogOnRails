class User < ApplicationRecord
  before_create :set_defaults
  after_initialize :init
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy

  def recent_3_posts
    posts.includes(:user).limit(3).order(created_at: :desc)
  end

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def admin?
    is? :admin
  end

  private

  def set_defaults
    self.photo = 'https://picsum.photos/200/300'
  end

  def init
    self.posts_counter ||= 0
  end

  ROLES = %i[admin default].freeze

  def is?(assigned_role)
    role == assigned_role.to_s
  end
end
