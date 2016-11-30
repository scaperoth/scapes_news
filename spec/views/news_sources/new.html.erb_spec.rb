require 'rails_helper'

RSpec.describe "news_sources/new", type: :view do
  before(:each) do
    assign(:news_source, NewsSource.new())
  end

  it "renders new news_source form" do
    render

    assert_select "form[action=?][method=?]", news_sources_path, "post" do
    end
  end
end
