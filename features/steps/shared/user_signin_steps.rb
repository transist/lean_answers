module UserSigninSteps

  private

  def create_the_user
    @user = create(:user)
  end

  def signin_with_email_password_of_the_user
    visit signin_path

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password

    click_button 'Sign in'
  end
end
