feature "User Sign Up" do

  scenario "user signs up" do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content "Welcome, cat@catmail.com!"
    expect(User.first.email).to eq('cat@catmail.com')
  end

  scenario "no new user created on mismatching password" do
    visit '/users/new'
    fill_in :email, with: "jrods@gmail.com"
    fill_in :password, with: "pizza1234"
    fill_in :password_confirmation, with: "pizza12345"
    expect { click_button "Sign up" }.to_not change(User, :count).from(0)
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Password and confirmation password do not match'
  end

  scenario "user can't sign up with blank email" do
    visit "/users/new"
    fill_in :password, with: "pizza12"
    fill_in :password_confirmation, with: "pizza12"
    expect { click_button "Sign up" }.to_not change(User, :count).from(0)
  end

  scenario "user can't sign up with invalid email format" do
    visit "/users/new"
    fill_in :email, with: "jrods@gmail"
    fill_in :password, with: "pizza123"
    fill_in :password_confirmation, with: "pizza123"
    expect { click_button "Sign up" }.to_not change(User, :count).from(0)
  end

end
