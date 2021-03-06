class User < ApplicationRecord

  # has_many :articles --> one to many #mark-relationship-1
  # dependent: :destroy --> to delete user and their articles created
  has_many :articles, dependent: :destroy

  # before user hit the database, we make email to lowercase
  before_save { self.email = email.downcase }

  # Validation
  # username & email must be present and unique
  # validate email format using regex
  # case_sensitive: false is between, can't save if username (Firman and firMaN)

  validates :username,
  presence: true, uniqueness: {case_sensitive: false}, length: { minimum: 3, maximum: 25 }

  # tested on https://rubular.com/
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,
  presence: true, uniqueness: {case_sensitive: false}, length: { minimum: 3, maximum: 105 },
  format: { with: VALID_EMAIL_REGEX }

  validates :password, presence: true, length: { minimum: 3, maximum: 25 }

  has_secure_password

end
