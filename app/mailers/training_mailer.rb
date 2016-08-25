class TrainingMailer < ApplicationMailer
	def invitation_email(users,training)
	    @user = users
	    @training=training
	    mail(to: @user.email, subject: 'Training Invitation')
    end
end
