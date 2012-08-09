class HardWorker
  include Sidekiq::Worker

  def perform(name, count)
    puts 'Doing hard work'
    puts count
    Email.create
  end
end