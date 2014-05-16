require 'spec_helper'

describe "Flipbks" do
  it "saves a flipbook" do
    visit flipbks_path
    expect(page).to have_content('#fb_show')
  end
  
end


# Sample code:

# describe "Tasks" do
#   it "lists my tasks" do
#     visit root_path
#     expect(page).to have_content("My Tasks")
#   end
#   
#   it "creates a new task on the page", :js => true do
#     visit root_path
#     click_link("New Task")
#     save_and_open_page
#     fill_in("task[title]", :with => "Discard paint.")
#     click_button("Create Task")
#     expect(find('#incomplete_tasks')).to have_content("Discard paint.")
#   end
#   
#   it "starts out with a nonsensical task" do
#     visit root_path
#     expect(page).to have_content("Discover gold paint.")
#   end
# end