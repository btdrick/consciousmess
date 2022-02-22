class Ripple < ApplicationRecord
  validates :author, :message, presence: true
end
