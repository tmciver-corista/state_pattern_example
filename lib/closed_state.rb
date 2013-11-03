require_relative 'state'
require_relative 'assigned_state'

class ClosedState < State
	def initialize(aCase)
		@aCase = aCase
	end

	def reopen
		# transition to the 'assigned' state
		@aCase.state = AssignedState.new(@aCase)
	end
end
