require 'rails_helper'

RSpec.describe "classrooms/edit", type: :view do
  before(:each) do
    @classroom = assign(:classroom, Classroom.create!(
      :name => "MyString",
      :code => "MyString",
      :teacher => "MyString",
      :student_count => 1,
      :active => false,
      :category => "MyString"
    ))
  end

  it "renders the edit classroom form" do
    render

    assert_select "form[action=?][method=?]", classroom_path(@classroom), "post" do

      assert_select "input[name=?]", "classroom[name]"

      assert_select "input[name=?]", "classroom[code]"

      assert_select "input[name=?]", "classroom[teacher]"

      assert_select "input[name=?]", "classroom[student_count]"

      assert_select "input[name=?]", "classroom[active]"

      assert_select "input[name=?]", "classroom[category]"
    end
  end
end
