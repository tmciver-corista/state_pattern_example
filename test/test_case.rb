require 'test/unit'
require_relative '../lib/pathology_case'
require_relative '../lib/pending_state'

class TestCase < Test::Unit::TestCase

	def testNewCaseState
		# create a new case
		aCase = Case.new('John Doe')

		# verify that the case is in the 'pending' state
		assert(aCase.state.instance_of?(PendingState))
	end
end