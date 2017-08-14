if @user.nil?
  node(:error){"Unathorised access"}

else
	if @shorten.errors.any?
		node(:error){@shorten.errors.full_messages.join(',')}
	else
	object @shorten
	attributes :original_url,:tiny_url
	node(:success){"Tiny Url  updated succesfuly"}

	end
end