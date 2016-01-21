class User < ActiveRecord::Base
  attr_accessor :login
  has_many :injuries
  has_many :posts
  has_many :favorites, dependent: :destroy
  has_many :favorite_posts, through: :favorites, source: :favoriteable, source_type: :Post
  has_many :favorite_injuries, through: :favorites, source: :favoriteable, source_type: :Injury
  has_many :votes, dependent: :destroy
  has_many :feed_items, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup

    if login = conditions.delete(:login)
      where(conditions.to_hash).where(["username = :value OR email = :value", { value: login.downcase }]).first
    else
      where(conditions.to_hash).first
    end
  end

  def favorite_for(post_or_injury)
    favorites.where(favoriteable_id: post_or_injury.id, favoriteable_type: post_or_injury.class.name).first
  end

  validates :username, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 4}
  validates_format_of :username, with: /\A[a-zA-Z0-9_\.]*\z/
  validate :validate_username

  private
  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end
end
