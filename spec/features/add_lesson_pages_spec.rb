require 'rails_helper'

describe "the lesson feature" do
  it "adds a new lesson" do
    Course.create(name: "Intro to Programming")
    visit courses_path
    click_link "Intro to Programming"
    click_link "Add Lesson"
    fill_in 'Name', :with => "HTML Basics"
    fill_in 'Content', :with => "stuff, things, etc."
    click_on 'Create Lesson'
    expect(page).to have_content 'HTML Basics'
  end

  it "deletes a lesson" do
    course = Course.create(name: "Intro to Programming")
    course.lessons.create(name: "HTML Basics", content: "foo")

    visit courses_path
    click_link "Intro to Programming"
    click_link "HTML Basics"

    click_link "Edit"
    click_link "Delete"

    expect(page).to_not(have_content("HTML Basics"))
  end

  it "updates a lesson" do
    course = Course.create(name: "Intro to Programming")
    course.lessons.create(name: "HTML Basics", content: "foo")

    visit courses_path
    click_link "Intro to Programming"
    click_link "HTML Basics"

    click_link "Edit"
    fill_in 'Name', :with => "html basics"
    fill_in 'Content', :with => "foo"
    click_on 'Update Lesson'
    expect(page).to have_content 'html basics'
  end

  it "return to courses index" do
    Course.create(name: "Intro to Programming")
    Course.create(name: "Java")
    visit courses_path
    click_link "Intro to Programming"
    click_link "Return to courses"
    expect(page).to have_content 'Java'
  end
end
