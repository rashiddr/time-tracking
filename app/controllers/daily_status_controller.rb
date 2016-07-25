class DailyStatusController < ApplicationController
	project_list=Project.find(:all,:select => 'project_name');
end
