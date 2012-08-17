class UserSignup < Spinach::FeatureSteps
  When 'I sign up with email and password' do
    visit signup_path

    fill_in 'Name', with: 'Rainux'
    fill_in 'Email', with: 'rainux@transi.st'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'

    click_button 'Sign up'
  end

  Then 'I should be signed in' do
    page.should have_content('Welcome! You have signed up successfully.')
  end
end
