def create_link_and_tag
  visit '/links/new'
  fill_in :title, with: "icanhazburgers"
  fill_in :url, with: "http://icanhas.cheezburger.com/cats"
  fill_in :tags, with: "cats"
  click_button "Save link"
end
