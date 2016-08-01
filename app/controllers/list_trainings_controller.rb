class ListTrainingsController < ApplicationController
	before_filter :authenticate_user!
	def index
		@training=Training.all
	end
end
