% Predicate to add an element to a list
addElement(Element, List, Result) :-
Result = [Element | List].

% Predicate to count occurrences of a value in a list
howMany(_, [], 0).
howMany(Value, [Value | Tail], Count) :-
howMany(Value, Tail, SubCount),
Count is SubCount + 1.
howMany(Value, [_ | Tail], Count) :-
howMany(Value, Tail, Count).

% Test cases for addElement
:- begin_tests(addElement).
test(addElement_1, [nondet]) :-
addElement(2, [3, 4, 5], X),
X = [2, 3, 4, 5].
test(addElement_2, [nondet]) :-
addElement(a, [b, c], X),
X = [a, b, c].
:- end_tests(addElement).

% Test cases for howMany
:- begin_tests(howMany).
test(howMany_1, [nondet]) :-
howMany(2, [3, 2, 3, 5, 2, 2], X),
X = 4.
test(howMany_2, [nondet]) :-
howMany(a, [a, b, c, a, d], X),
X = 2.
:- end_tests(howMany).

% Run all tests
:- run_tests.

