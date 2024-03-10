% Define mother(X, Y) predicate
mother(X, Y) :- parent(X, Y), female(X).

% Define sister(X, Y) predicate
sister(X, Y) :- parent(Z, X), parent(Z, Y), female(X), X \= Y.

% Find the maximum of a list of numbers
max_list([X], X).
max_list([H | T], Max) :- max_list(T, TailMax), (H >= TailMax, Max = H; H < TailMax, Max = TailMax).

% Find the intersection of two lists
intersection([], _, []).
intersection([H | T], List2, [H | IntersectionTail]) :- member(H, List2), intersection(T, List2, IntersectionTail).
intersection([H | T], List2, Intersection) :- \+ member(H, List2), intersection(T, List2, Intersection).

% Find the union of two lists
union([], List, List).
union([H | T], List, [H | UnionTail]) :- \+ member(H, List), union(T, List, UnionTail).
union([H | T], List, Union) :- member(H, List), union(T, List, Union).

% Sort a list
sort_list([], []).
sort_list([Pivot | Rest], Sorted) :-
partition(Rest, Pivot, Smaller, Greater),
sort_list(Smaller, SmallerSorted),
sort_list(Greater, GreaterSorted),
append(SmallerSorted, [Pivot | GreaterSorted], Sorted).
partition([], _, [], []).
partition([H | T], Pivot, [H | Smaller], Greater) :- H < Pivot, partition(T, Pivot, Smaller, Greater).
partition([H | T], Pivot, Smaller, [H | Greater]) :- H >= Pivot, partition(T, Pivot, Smaller, Greater).

