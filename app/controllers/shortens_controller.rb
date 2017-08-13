class ShortensController < ApplicationController
	before_action :authenticate_user!
	def index
		@shortenr = current_user.shortens
	end
	def new
		@shorten = Shorten.new
	end

	def create 
		@shorten = Shorten.new(project_params)
		chars = ['0'..'9', 'A'..'Z', 'a'..'z'].map { |range| range.to_a }.flatten
		@shorten.user_id = current_user.id
		@shorten.tiny_url=6.times.map { chars.sample }.join
		if @shorten.save
			redirect_to shortens_path(), notice: "Successfully created"
		else
			render action: "new"
		end
	end

	def get_original_url
		@org_url=Shorten.find_by_tiny_url(params[:id])
		if @org_url
			redirect_to @org_url.original_url
		else
			redirect_to shortens_path(), notice: "No Shorten Url exist"
		end
	end
	def project_params
		params[:shorten].permit(:original_url)
	end



end
