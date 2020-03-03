fib(0, 0).
fib(1, 1).
fib(N, Nty) :-
    N > 1,
    M is N - 1,
    MM is N - 2,
    fib(MM, Nmm),
    fib(M, Nm),
    Nty is Nm + Nmm.