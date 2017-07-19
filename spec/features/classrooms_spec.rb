require 'rails_helper'

feature 'Index - Without Classrooms', js: true do
  before(:each) do
    visit(classrooms_path)
  end

  scenario 'Displays the correct no classrooms message on empty classrooms' do
    expect(page).to have_content('No Classrooms, Please Create One!')
    expect(page).to_not have_selector('table')
  end

  scenario 'Displays the classrooms table when classrooms in the database' do
    # Manual - Long Hand.
    classroom_name = 'DPL'
    Classroom.create(name: classroom_name, code: 'PROG 101', teacher: 'Jake')
    visit(classrooms_path)
    # Use FactoryGirl Instead - Recommended.
    expect(page).to have_selector('table')
    expect(page).to have_content(classroom_name)
  end

  scenario 'New Button goes to the new form' do
    click_link('New Classroom')
    expect(page).to have_current_path("/classrooms/new")
  end

  scenario 'Show link goes to the correct show template' do
    classroom_name = 'DPL'
    classroom = Classroom.create(name: classroom_name, code: 'PROG 101', teacher: 'Jake')
    visit(classrooms_path)
    expect(page).to have_content(classroom_name)
    click_link('Show')
    expect(page).to have_current_path("/classrooms/#{classroom.id}")
  end

  scenario 'Edit link goes to the correct edit template' do
    classroom_name = 'DPL'
    classroom = Classroom.create(name: classroom_name, code: 'PROG 101', teacher: 'Jake')
    visit(classrooms_path)
    expect(page).to have_content(classroom_name)
    click_link('Edit')
    expect(page).to have_current_path("/classrooms/1/edit")
  end

  scenario 'Delete links works and removes classroom' do
    classroom_name = 'DPL'
    classroom = Classroom.create(name: classroom_name, code: 'PROG 101', teacher: 'Jake')
    visit(classrooms_path)
    expect(page).to have_content(classroom_name)
    click_link('Destroy')
    expect(page).to have_current_path("/classrooms/1")
  end
end
   
