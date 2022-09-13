class GifSenderJob < ApplicationJob
  queue_as :default

  # gets called whenever a job appears for our worker to do
  def perform(email, thought)
    UserNotifierMailer.send_randomness_email(email, thought).deliver_now
  end
end
