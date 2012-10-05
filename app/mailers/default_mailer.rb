class DefaultMailer < ActionMailer::Base
  default from: "hotel.classica@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.default_mailer.confirma_reserva.subject
  #
  def confirma_reserva(reserva)
    @reserva = reserva
    mail to: reserva.Cliente.email
  end
end
