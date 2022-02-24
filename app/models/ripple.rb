class Ripple < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  validates :author, :message, presence: true
  validates :website, allow_blank: true, format: {
  with: URI::regexp(%w(http https)),
      message: "Must be a url starting with http:// or https://"
  }
end
