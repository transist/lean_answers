class MakeHypotheses < Spinach::FeatureSteps
  include UserSigninSteps

  Given 'there is a project' do
    @project = create(:project)
  end

  And 'I signed in as a member of the project' do
    create_the_user
    signin_with_email_password_of_the_user
    @project.add_member(@user)
  end

  When 'I make a customer hypothesis' do
    make_hypothesis('customer')
  end

  Then 'the customer hypothesis should be created as backlogged' do
    page.current_path.should == project_hypotheses_path(@project)
    within('#backlogged .CustomerHypothesis') do
      page.should have_content('Content of customer hypothesis')
    end
  end

  When 'I make a problem hypothesis' do
    make_hypothesis('problem')
  end

  Then 'the problem hypothesis should be created as backlogged' do
    page.current_path.should == project_hypotheses_path(@project)
    within('#backlogged .ProblemHypothesis') do
      page.should have_content('Content of problem hypothesis')
    end
  end

  When 'I make a solution hypothesis' do
    make_hypothesis('solution')
  end

  Then 'the solution hypothesis should be created as backlogged' do
    page.current_path.should == project_hypotheses_path(@project)
    within('#backlogged .SolutionHypothesis') do
      page.should have_content('Content of solution hypothesis')
    end
  end

  private

  def make_hypothesis(type)
    visit project_path(@project)
    click_on 'Hypotheses'
    click_on "New #{type.camelize} Hypothesis"
    fill_in 'Hypothesis', with: "Content of #{type} hypothesis"
    click_on 'Create'
  end
end
