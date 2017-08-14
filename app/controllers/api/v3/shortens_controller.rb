module Api
	module V3
		class ShortensController < ApplicationController
			before_action :authenticate_user_via_access_token
			def create
				if !@user.nil?
					@shorten = Shorten.new(project_params)
					#chars = ['0'..'9', 'A'..'Z', 'a'..'z'].map { |range| range.to_a }.flatten
					@shorten.user_id = @user.id
					t_url=Shorten.generate_short_url()
			        @shorten.tiny_url=t_url
					@shorten.save
				end
			end
			private
			def authenticate_user_via_access_token
				if params[:access_token]
					@user=ApiKey.find_by_name(params[:access_token])
			   end
			   return @user
			end
			def project_params
				params[:shorten].permit(:original_url)
			end
		end

	end

end