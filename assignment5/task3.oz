
% Task 3 a)

% Implement the function fun {ListDivisorsOf Number}, which produces a stream of all the divisors of
% the integer number Number. A number d ∈ N is a divisor of n ∈ N if the rest of the integer division n/d is zero.
% The modulo operation (i.e., rest of integer division) is denoted with the keyword mod in Oz. ListDivisorOf
% must be implemented as a consumer of Enumerate.

declare fun {ListDivisorsOf Number}
    local
        Input Result FilterDivisors
    in
        thread Input = {Enumerate 1 Number} end
        fun {FilterDivisors List}
            case List of H|T then
                if Number mod H == 0 then
                    H | {FilterDivisors T}
                else
                    {FilterDivisors T}
                end
            else nil end
        end
        thread Result = {FilterDivisors Input} end
        Result
    end
end


{Browse {ListDivisorsOf 20}} % [1 2 4 5 10 20]



% Task 3 b)

% Implement the function fun {ListPrimesUntil N}, which produces a stream of all the prime numbers
% up to the number N. A number n is prime if its only divisors are 1 and n itself. ListDivisorOf must be
% implemented as a consumer of Enumerate.
% Hint: You can chain multiple streams, and also consume multiple streams in the implementation of a function.
% In particular, you should also consume the stream produced by ListDivisorsOf.

declare fun {ListPrimesUntil N}
    local
        Input Result FilterPrimes
    in
        thread Input = {Enumerate 1 N} end
        fun {FilterPrimes List}
            case List of H|T then
                if {ListDivisorsOf H} == [1 H] then % if the list of divisors is 1 and the number H itself, [1 H], then H is prime
                    H | {FilterPrimes T}
                else
                    {FilterPrimes T}
                end
            else nil end
        end
        thread Result = {FilterPrimes Input} end
        Result
    end
end


{Browse {ListPrimesUntil 20}} % [2 3 5 7 11 13 17 19]





% Enumerate, copied from the previous exercise
% If you want to use this, this function must be defined before the functions above

declare fun {EnumerateHelper N Limit}
    if N > Limit then nil
    else
        N | {EnumerateHelper N + 1 Limit}
    end
end

declare fun {Enumerate Start End}
    thread
        {EnumerateHelper Start End}
    end
end
