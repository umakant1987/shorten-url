module Api
	module V3
		class ShortensController < ApplicationController
			before_action :authenticate_user_via_access_token
			extend Apipie::DSL::Concern
			api :POST, "/v3/shortens",'This API is used to create shorten url.'
			description <<-EOS
			    == Create shorten url for an url
			     This API is used to create shorten url.
			    === Authentication required
			     Authentication token(api key genereated by user) has to be passed as part of the request. It can be passed as parameter(access_token) or HTTP header(AUTH-TOKEN). 
			  EOS

			  error :code => 401, :desc => "Unathorised access"
			  formats ['json']
			  header 'access_token', 'Your API token'
			  param :shorten, Hash, :description => "shorten" do
			    param :original_url, String, :desc => "input original url", :required => true
			   
			  end


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