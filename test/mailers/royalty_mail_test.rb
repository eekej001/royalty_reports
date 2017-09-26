require 'test_helper'

class RoyaltyMailTest < ActionMailer::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  def sample_mail_preview
    ExampleMailer.sample_email(User.first)
  end




end
