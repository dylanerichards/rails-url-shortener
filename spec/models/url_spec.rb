require 'rails_helper'

describe Url do
  it { should have_db_column(:long_url) }
  it { should have_db_column(:short_url) }

  describe "#shorten" do
    it 'creates shortened urls' do
    end
  end
end
