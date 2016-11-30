require 'rails_helper'

RSpec.describe "news_sources/show", type: :view do
  before(:each) do
    @news_source = assign(:news_source, NewsSource.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
