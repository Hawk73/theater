require 'rails_helper'

RSpec.describe "programs/new", type: :view do
  before(:each) do
    assign(:program, Program.new(
      :title => "MyString",
      :activity_period => ""
    ))
  end

  it "renders new program form" do
    render

    assert_select "form[action=?][method=?]", programs_path, "post" do

      assert_select "input[name=?]", "program[title]"

      assert_select "input[name=?]", "program[activity_period]"
    end
  end
end
