class Customer < ActiveRecord::Base
  has_many :twitter_users
  has_many :order_items
  
  # [6]"Ruby on Rails Tutorial (3rd Ed.)", Softcover.io, 2021. [Online]. Available: https://3rd-edition.railstutorial.org/book/sign_up [Accessed: 23- May- 2021] 
  before_save { email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: EMAIL_REGEX  },
            uniqueness: { case_sensitive: false}
  has_secure_password
  validates :password, presence: true, length: { minimum: 6, maximum:20}, allow_nil: true

  def Customer.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost

    BCrypt::Password.create(string, cost: cost)
  end
end