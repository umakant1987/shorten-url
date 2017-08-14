if @employee.errors.any?
	node(:error){@employee.errors.full_messages.join(',')}
else
object @employee
attributes :first_name,:last_name, :age,:designation
node(:success){"Employee updated succesfuly"}

end