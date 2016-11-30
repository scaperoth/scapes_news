require 'rails_helper'

RSpec.describe "news_sources/edit", type: :view do
  before(:each) do
    @news_source = assign(:news_source, NewsSource.create!())
  end

  it "renders the edit news_source form" do
    render

    assert_select "form[action=?][method=?]", news_source_path(@news_source), "post" do
    end
  end
end
