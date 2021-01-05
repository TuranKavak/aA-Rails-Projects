require 'rails_helper'

RSpec.describe "subs/show", type: :view do
  before(:each) do
    @sub = assign(:sub, Sub.create!(
      :title => "Title",
      :description => "MyText",
      :moderator => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
  end
end
