require 'rails_helper'

RSpec.describe "news_sources/index", type: :view do
  before(:each) do
    assign(:news_sources, [
      NewsSource.create!(),
      NewsSource.create!()
    ])
  end

  it "renders a list of news_sources" do
    render
  end
end
