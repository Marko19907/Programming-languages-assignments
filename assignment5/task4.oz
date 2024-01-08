
% Task 4 a)

% Implement a function fun {Enumerate} as a lazy function that generates an infinite stream of numbers,
% starting from 1.

declare fun lazy {EnumerateHelper N}
    N | {EnumerateHelper N + 1}
end

declare fun lazy {Enumerate}
    {EnumerateHelper 1}
end


{Browse {List.take {Enumerate} 10}}  % [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]



% Task 4 b)

% Implement a function fun {Primes} as a lazy function that generates an infinite stream of prime
% numbers, starting from 2. You must implement Primes as a consumer of the stream produced by Enumerate,
% and any other streams you find useful.

declare fun lazy {Divisors N S}
    case S of H|T then
        if H mod N == 0 then
            {Filter N T}
        else
            H | {Filter N T}
        end
    else
        nil
    end
end

fun lazy {PrimesHelper S}
    case S of H|T then
        H | {PrimesHelper {Divisors H T}}
    else
        nil
    end
end

declare fun lazy {Primes}
    case {Enumerate} of H|T then
        {PrimesHelper T} % Call PrimesHelper with the tail of the stream to skip the first element so that we can start at 2
                         % An alternative would be to use {PrimesHelper {EnumerateHelper 2}} but the goal was to use Enumerate
    end
end


{Browse {List.take {Primes} 10}}  % [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
