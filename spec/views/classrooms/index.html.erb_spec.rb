require 'rails_helper'

RSpec.describe "classrooms/index", type: :view do
  before(:each) do
    assign(:classrooms, [
      Classroom.create!(
        :name => "Name",
        :code => "Code",
        :teacher => "Teacher",
        :student_count => 2,
        :active => false,
        :category => "Category"
      ),
      Classroom.create!(
        :name => "Name",
        :code => "Code",
        :teacher => "Teacher",
        :student_count => 2,
        :active => false,
        :category => "Category"
      )
    ])
  end

  it "renders a list of classrooms" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    assert_select "tr>td", :text => "Teacher".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Category".to_s, :count => 2
  end
end
