require 'rails_helper'

RSpec.describe "programs/index", type: :view do
  before(:each) do
    assign(:programs, [
      Program.create!(
        :title => "Title 1",
        :activity_period => Date.new(2019, 1, 1)..Date.new(2019, 1, 2)
      ),
      Program.create!(
        :title => "Title 2",
        :activity_period => Date.new(2019, 1, 3)..Date.new(2019, 1, 4)
      )
    ])
  end

  it "renders a list of programs" do
    render
    assert_select "tr>td", :text => "Title 1", :count => 1
    assert_select "tr>td", :text => "Title 2", :count => 1
    #assert_select "tr>td", :text => "2019-01-01", :count => 1
    #assert_select "tr>td", :text => "2019-01-03", :count => 1
  end
end
