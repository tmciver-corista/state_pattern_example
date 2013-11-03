require_relative 'state'

class DiagnosedState < State
	def initialize(aCase)
		@aCase = aCase
	end

	def close
		# close the case

		# transition to the 'closed' state
		@aCase.state = ClosedState.new(@aCase)
	end
end
