class UserSignin < Spinach::FeatureSteps
  include UserSigninSteps

  Given 'there is a user' do
    create_the_user
  end

  When 'I sign in with email and password of the user' do
    signin_with_email_password_of_the_user
  end

  Then 'I should be signed in' do
    page.should have_content('Signed in successfully.')
  end
end
