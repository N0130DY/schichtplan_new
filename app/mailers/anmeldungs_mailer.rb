class AnmeldungsMailer < ActionMailer::Base
  default from: "derschichtplan@gmail.com"

  # Mailfunktion bei anmeldung
  def anmeldungs_email(user)
    @user = user
    mail(to: @user.email, subject: 'Einladung zum Schichtplan')
  end
end
