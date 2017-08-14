if @notice=='NORecordFound'
	node(:error){'Record not found'}
else
object @employee
attributes :first_name,:last_name, :age,:designation
node(:success){"Employee added succesfuly"}

end