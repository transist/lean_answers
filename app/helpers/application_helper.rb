module ApplicationHelper
  def new_hypothesis_title(hypothesis)
    "New #{hypothesis.class.to_s.gsub('Hypothesis', '')} Hypothesis"
  end

  def edit_hypothesis_title(hypothesis)
    "Editing #{hypothesis.class.to_s.gsub('Hypothesis', '')} Hypothesis"
  end
end
