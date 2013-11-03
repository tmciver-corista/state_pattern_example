require_relative 'state'
require_relative 'closed_state'
require_relative 'assigned_state'

class DiagnosedState < State
	def initialize(aCase)
		@aCase = aCase
	end

	def close
		# close the case

		# transition to the 'closed' state
		@aCase.state = ClosedState.new(@aCase)
	end

	def reopen
		@aCase.state = AssignedState.new(@aCase)
	end
end
