require 'rails_helper'


describe 'form page' do
  it 'form renders with the new action' do
    visit new_school_class_path
    expect(page).to have_content("School Class Form")
  end
end

 

describe 'Show page' do
  let(:school_class) { SchoolClass.create(title: "Computer Science", room_number: 5) }

  it 'renders properly' do
    visit school_class_path(school_class)
    expect(page.status_code).to eq(200)
  end

  it 'renders the school class title' do
    visit school_class_path(school_class)
    expect(page).to have_content("Computer Science")
  end
end