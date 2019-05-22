class Article < ApplicationRecord

  # one to many #mark-relationship-1
  belongs_to :user

  # presence: true --> empty Validation
  # length: { minumum: 3, maximum: 50 } --> length char Validation

  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
  validates :user_id, presence: true

end
