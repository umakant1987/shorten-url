class ApiKeysController < ApplicationController

	before_action :authenticate_user!
	def index
		@user_keys = current_user.api_keys
	end
	def new 
		@api_key = ApiKey.new()
		chars = ['0'..'9', 'A'..'Z', 'a'..'z'].map { |range| range.to_a }.flatten
		@api_key.user_id = current_user.id
		@api_key.name=10.times.map { chars.sample }.join
		if @api_key.save
			redirect_to api_keys_path(), notice: "Successfully created"
		else
			render action: "new"
		end
	end
end
