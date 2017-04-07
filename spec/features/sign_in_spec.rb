feature "user sign in" do
  let!(:user) do
    User.create(email: "user@example.com", password: "1234", password_confirmation: "1234")
  end

  scenario "with correct credentials" do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Welcome, #{user.email}"
  end
end
