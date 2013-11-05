state_pattern_example
=====================

Some Ruby code to demonstrate how Corista might use the [State Pattern](http://en.wikipedia.org/wiki/State_pattern) to enforce the state transitions in the case state machine.

To run unit test driver:

    $ ruby test/test_case.rb

Some things to note about this implementation:

* The `Case` class has a member variable called `@state` that should hold a reference to one of the subclasses of the `State` class.
* This member variable is initialize to the `PendingState` when a `Case` is created.
* The `State` class implements the same interface as the `Case` class (at least the state-transitioning parts of the interface).
* The state-transitioning parts of the `Case` API should do nothing more than to delegate the call to the `@state` object.
* All methods of this interface are implemented in the `State` class and the default behavior is to simply throw an `IllegalStateTransitionException`.
* The particular `State` subclasses override the parts of the interface that they are concerned about.
* Each `State` subclass is responsible for changing the state object of the `Case` object.
* Attempts to transition to an invalid state by calling a state-transitioning method of a `Case` object will result in the default implementation in the `State` class being used which throws the `IllegalStateTransitionException`.
* The `@state` member variable of the `Case` class is effectively hidden from clients of the `Case` class and should not be accessed by clients.
