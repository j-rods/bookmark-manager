feature "Filter tags" do

  before(:each) do
    Link.create(url: 'http://www.gamekult.com', title: 'Gamekult', tags: [Tag.first_or_create(name: 'games')])
    Link.create(url: 'http://www.google.com', title: 'Google', tags: [Tag.first_or_create(name: 'search')])
    Link.create(url: 'http://www.ign.com', title: 'IGN', tags: [Tag.first_or_create(name: 'games')])
    Link.create(url: 'http://www.reddit.com/cat', title: 'Reddit for cat', tags: [Tag.first_or_create(name: 'cat')])
  end

  scenario "Filter by specific tag" do
    visit "/tags/games"
    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).not_to have_content 'search'
      expect(page).not_to have_content 'cats'
      expect(page).to have_content 'games'
    end


  end


end
