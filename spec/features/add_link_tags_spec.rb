feature "adding tags" do
  scenario "add 1 tag to link" do
    visit "/links/new"
    fill_in :title, with: "J-rods"
    fill_in :url, with: "www.j-rods-rocks.com"
    fill_in :tags, with: "rockstar"
    click_button "Save link"

    expect(page).to have_content("rockstar")
  end
end