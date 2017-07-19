require 'rails_helper'

RSpec.describe "classrooms/new", type: :view do
  before(:each) do
    assign(:classroom, Classroom.new(
      :name => "MyString",
      :code => "MyString",
      :teacher => "MyString",
      :student_count => 1,
      :active => false,
      :category => "MyString"
    ))
  end

  it "renders new classroom form" do
    render

    assert_select "form[action=?][method=?]", classrooms_path, "post" do

      assert_select "input[name=?]", "classroom[name]"

      assert_select "input[name=?]", "classroom[code]"

      assert_select "input[name=?]", "classroom[teacher]"

      assert_select "input[name=?]", "classroom[student_count]"

      assert_select "input[name=?]", "classroom[active]"

      assert_select "input[name=?]", "classroom[category]"
    end
  end
end
