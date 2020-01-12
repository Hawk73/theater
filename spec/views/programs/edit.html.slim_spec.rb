require 'rails_helper'

RSpec.describe "programs/edit", type: :view do
  before(:each) do
    pending
    @program = assign(:program, Program.create!(
      :title => "MyString",
      :activity_period => ""
    ))
  end

  it "renders the edit program form" do
    render

    assert_select "form[action=?][method=?]", program_path(@program), "post" do

      assert_select "input[name=?]", "program[title]"

      assert_select "input[name=?]", "program[activity_period]"
    end
  end
end
