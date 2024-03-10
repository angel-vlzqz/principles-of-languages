% Define parent, male, and female predicates
parent(john, ann).
parent(john, bob).
parent(sue, ann).
parent(sue, bob).
parent(bob, charlie).
parent(bob, david).

male(john).
male(bob).
male(charlie).
male(david).

female(sue).
female(ann).

% Predicate to define mother(X, Y)
mother(X, Y) :-
    parent(X, Y),
    female(X).

% Predicate to define sister(X, Y)
sister(X, Y) :-
    parent(Z, X),
    parent(Z, Y),
    female(X),
    X \= Y.

% Predicate to find the maximum of a list of numbers
max_list([X], X).
max_list([H|T], Max) :-
    max_list(T, TailMax),
    (H > TailMax -> Max = H ; Max = TailMax).

% Predicate to find the intersection of two lists
intersection([], _, []).
intersection([H|T], List2, [H|Result]) :-
    member(H, List2),
    intersection(T, List2, Result).
intersection([_|T], List2, Result) :-
    intersection(T, List2, Result).

% Predicate to return the union of two lists
union([], List, List).
union([H|T], List, Result) :-
    member(H, List),
    union(T, List, Result).
union([H|T], List, [H|Result]) :-
    \+ member(H, List),
    union(T, List, Result).

% Predicate to sort a list
sort_list(List, SortedList) :-
    predsort(compare, List, SortedList).

% Test Cases
:- begin_tests(mother).
test(mother_1, [nondet]) :-
    mother(sue, ann).
test(mother_2, [fail]) :-
    mother(john, bob).
:- end_tests(mother).

:- begin_tests(sister).
test(sister_1, [nondet]) :-
    sister(ann, bob).
test(sister_2, [fail]) :-
    sister(charlie, david).
:- end_tests(sister).

:- begin_tests(max_list).
test(max_list_1, [nondet]) :-
    max_list([3, 7, 1, 9, 4], 9).
test(max_list_2, [fail]) :-
    max_list([2, 5, 8], 2).
:- end_tests(max_list).

:- begin_tests(intersection).
test(intersection_1, [nondet]) :-
    intersection([1, 2, 3, 4], [3, 4, 5, 6], [3, 4]).
test(intersection_2, [fail]) :-
    intersection([a, b, c], [d, e, f], _).
:- end_tests(intersection).

:- begin_tests(union).
test(union_1, [nondet]) :-
    union([1, 2, 3], [3, 4, 5], [1, 2, 3, 4, 5]).
test(union_2, [fail]) :-
    union([a, b, c], [d, e, f], _).
:- end_tests(union).

:- begin_tests(sort_list).
test(sort_list_1, [nondet]) :-
    sort_list([3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5], [1, 1, 2, 3, 3, 4, 5, 5, 5, 6, 9]).
test(sort_list_2, [fail]) :-
    sort_list([a, b, c], _).
:- end_tests(sort_list).

% Run all tests
:- run_tests.

