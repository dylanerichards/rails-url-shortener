require 'rails_helper'

describe Url do
  it { should have_db_column(:long_url) }
  it { should have_db_column(:short_path) }

  describe "#shorten" do
    it 'saves a short path to the record' do
      url = Url.create(long_url: "www.wwe.com")

      expect(url.short_path).to eq "1"
    end

    it 'uses the optional slug as the short path if available' do
      url = Url.create(long_url: "www.wwe.com", slug: "this-is-short")

      expect(url.short_path).to eq("this-is-short")
    end

    it 'defaults to a path generated using base36 if the slug is already taken' do
      url = Url.create(long_url: "www.wwe.com", slug: "this-is-short")
      url2 = Url.create(long_url: "www.dylan.com", slug: "this-is-short")

      expect(url2.short_path).to eq("2")
    end
  end

  describe "#unique_slug?" do
    it 'returns false when the slug is not unique' do
      url = Url.create(long_url: "www.wwe.com", slug: "this-is-cool")
      url2 = Url.create(long_url: "www.wwe.com", slug: "this-is-cool")

      expect(url2.unique_slug?).to eq false
    end

    it 'returns true when the slug is unique' do
      url = Url.create(long_url: "www.wwe.com", slug: "this-is-cool")
      url2 = Url.create(long_url: "www.wwe.com", slug: "this-is-not-cool")

      expect(url.unique_slug?).to eq true
    end
  end
end
