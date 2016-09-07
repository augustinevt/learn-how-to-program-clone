require 'rails_helper'

describe 'the section feauture' do

  it "should add a new section" do
    course = Course.create(name: "Intro to Programming")
    course.lessons.create(name: "HTML Basics", content: "foo")
    visit courses_path
    click_link "Intro to Programming"
    click_link "HTML Basics"
    click_link "Add Section"
    fill_in 'Name', :with => "Header Tags"
    fill_in 'Number', :with => 1
    click_on 'Create Section'
    expect(page).to have_content 'Header Tags'
  end


  it 'should list all section belonging to a lesson' do
    course = Course.create(name: "Intro to Programming")
    course.lessons.create(name: "HTML Basics", content: "foo")
    visit courses_path
    click_link "Intro to Programming"
    click_link "HTML Basics"
    expect(page).to have_content 'Header Tags'
  end

end
