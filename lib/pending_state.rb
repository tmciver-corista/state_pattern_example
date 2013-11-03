require_relative 'state'
require_relative 'assigned_state'

class PendingState < State
	def initialize(aCase)
		@aCase = aCase
	end

	def assign(assignee)
		# assignment code

		# transition to the 'assigned' state
		@aCase.state = AssignedState.new(@aCase)
	end
end