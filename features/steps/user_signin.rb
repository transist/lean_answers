class UserSignin < Spinach::FeatureSteps
  Given 'there is a user' do
    @user = create(:user)
  end

  When 'I sign in with email and password of the user' do
    visit signin_path

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password

    click_button 'Sign in'
  end

  Then 'I should be signed in' do
    page.should have_content('Signed in successfully.')
  end
end
