require 'rails_helper'

RSpec.describe "classrooms/show", type: :view do
  before(:each) do
    @classroom = assign(:classroom, Classroom.create!(
      :name => "Name",
      :code => "Code",
      :teacher => "Teacher",
      :student_count => 2,
      :active => false,
      :category => "Category"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Code/)
    expect(rendered).to match(/Teacher/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Category/)
  end
end
