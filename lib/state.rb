class State

	def assign(assignee)
		raise IllegalStateTransitionException
	end

	def close
		raise IllegalStateTransitionException
	end

	def diagnose(diagnosis)
		raise IllegalStateTransitionException
	end

	def reopen
		raise IllegalStateTransitionException
	end

	def edit
		raise IllegalStateTransitionException
	end
end