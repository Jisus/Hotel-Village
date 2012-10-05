require 'test_helper'

class DefaultMailerTest < ActionMailer::TestCase
  test "confirma_reserva" do
    mail = DefaultMailer.confirma_reserva
    assert_equal "Confirma reserva", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
