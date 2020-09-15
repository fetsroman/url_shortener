class Url < ApplicationRecord
  validates_presence_of :original_url
  before_create :generate_password
  before_save :generate_short_url

  def generate_password
    self.password = SecureRandom.hex(8)
  end

  def generate_short_url
    url = SecureRandom.hex(5)
    if Url.find_by_short_url(url)
      self.generate_short_url
    else
      self.short_url = url
    end
  end
end
