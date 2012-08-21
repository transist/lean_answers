class CreateProject < Spinach::FeatureSteps
  include UserSigninSteps

  Given 'I am signed in' do
    create_the_user
    signin_with_email_password_of_the_user
  end

  When 'I create a project' do
    visit '/'
    click_on 'New Project'

    fill_in 'Name', with: 'LeanAnswers'
    fill_in 'Description', with: 'LeanAnswers help you find out the ultimate answers.'
    fill_in 'Tags', with: 'answers universe'

    click_on 'Create'
  end

  Then 'the project should be created' do
    page.should have_content('LeanAnswers')
    page.current_path.should == project_path(Project.last)
  end
end
