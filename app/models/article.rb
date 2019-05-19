class Article < ApplicationRecord

  # presence: true --> empty Validation
  # length: { minumum: 3, maximum: 50 } --> length char Validation

  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }

end
