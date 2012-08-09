module ApplicationHelper
  def new_hypothesis_title(hypothesis)
    "New #{hypothesis.class.to_s.gsub('Hypothesis', '')} Hypothesis"
  end
  
  def edit_hypothesis_title(hypothesis)
    "Editing #{hypothesis.class.to_s.gsub('Hypothesis', '')} Hypothesis"
  end
  
  def state_css(state)
    case state
    when 'current'
      'label-info'
    when 'pending'
      ''
    when 'rejected'
      'label-inverse'
    when 'accepted'
      'label-success'
    end
  end
  def type_css(type)
    case type
    when 'SolutionHypothesis'
      'label-important'
    when 'ProblemHypothesis'
      'label-warning'
    when 'CustomerHypothesis'
      'label-info'
    end
  end
end
