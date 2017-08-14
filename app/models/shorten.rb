class Shorten < ActiveRecord::Base
	belongs_to :user

   
	def build_tiny_url
		"http://localhost:3000/#{self.tiny_url}"
	end

	def self.generate_short_url
		chars = ['0'..'9', 'A'..'Z', 'a'..'z'].map { |range| range.to_a }.flatten
		short_url=6.times.map { chars.sample }.join
		return short_url
	end
end
