require 'rails_helper'

RSpec.describe "subs/new", type: :view do
  before(:each) do
    assign(:sub, Sub.new(
      :title => "MyString",
      :description => "MyText",
      :moderator => 1
    ))
  end

  it "renders new sub form" do
    render

    assert_select "form[action=?][method=?]", subs_path, "post" do

      assert_select "input[name=?]", "sub[title]"

      assert_select "textarea[name=?]", "sub[description]"

      assert_select "input[name=?]", "sub[moderator]"
    end
  end
end
