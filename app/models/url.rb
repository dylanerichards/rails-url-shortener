class Url < ApplicationRecord
  after_create :shorten

  def shorten
    if unique_slug?
      self.short_path = slug
    else
      self.short_path = id.to_s(36)
    end

    self.save
  end

  def unique_slug?
    urls = Url.select { |url| url.id != self.id }
    self.slug && !(urls).map(&:slug).include?(self.slug)
  end
end
