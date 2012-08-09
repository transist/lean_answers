class SendEmail
  include Sidekiq::Worker

  def perform(id)
    Email.find(id).send!
  end
end