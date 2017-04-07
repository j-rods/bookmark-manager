feature "User signs out" do

  before(:each) do
    User.create(email: 'test@test.com', password: '1234', password_confirmation: '1234')
  end

  scenario 'while being signed in' do
    sign_in(email: 'test@test.com', password: '1234')
    click_button 'Sign out'
    expect(page).to have_content('Goodbye!')
    expect(page).not_to have_content('Welcome, test@test.com')
  end
end
