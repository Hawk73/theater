require 'rails_helper'

RSpec.describe "programs/show", type: :view do
  before(:each) do
    pending
    @program = assign(:program, Program.create!(
      :title => "Title",
      :activity_period => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(//)
  end
end
