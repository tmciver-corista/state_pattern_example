require_relative 'pending_state'
require_relative 'illegal_state_transition_exception'

class Case
	attr_reader :name
	attr_accessor :state

	def initialize(name)
		@name = name

		# a case starts off in the 'pending' state
		@state = PendingState.new(self)
	end

	def assign(assignee)
		@state.assign(assignee)
	end

	def diagnose(diagnosis)
		@state.diagnose(diagnosis)
	end

	def close
		@state.close
	end

	def reopen
		@state.reopen
	end

	def edit
		@state.edit
	end
end