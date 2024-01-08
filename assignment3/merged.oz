
% Task 1 a)

% Implement proc {QuadraticEquation A B C ?RealSol ?X1 ?X2}. X1 and X2 should bind to the real
% solution(s) to the quadratic equation. RealSol binds to true if there exists a real solution, false otherwise.
% See the appendix for more information about the quadratic equation. When there are no real solution, you
% may ignore complex solutions, and just set RealSol to false.

declare proc {QuadraticEquation A B C ?RealSol ?X1 ?X2}
    local Temp in
        Temp = B*B - (4.0 * A * C)

        if (Temp < 0.0) then
            RealSol = false
            X1 = nil
            X2 = nil
        else
            RealSol = true
            X1 = (~B + {Float.sqrt 0.0 + Temp})/(2.0 * A)
            X2 = (~B - {Float.sqrt 0.0 + Temp})/(2.0 * A)
        end
    end
end

% Helper proc to print the result
declare proc {QuadraticEquationHelper A B C}
    local RealSol X1 X2 in
        {QuadraticEquation A B C RealSol X1 X2}
        if RealSol then
            {System.show X1}
            {System.show X2}
        else
            {System.show 'No real solution'}
        end
    end
end


% My tests
% {QuadraticEquationHelper 1.0 2.0 ~3.0} % 1 -3
% {QuadraticEquationHelper 1.0 3.0 5.0}  % No real solution

% Tests from the assignment text
{QuadraticEquationHelper 2.0 1.0 ~1.0} % 0.5 -1
{QuadraticEquationHelper 2.0 1.0 2.0}  % No real solution



% Task 2

% Implement fun {Sum List}, which returns the sum of the values of
% elements in the list. For example, {Sum [1 2 3]} returns 6.

declare fun {Sum List}
    case List of Head | Tail then
        Head + {Sum Tail}
    [] nil then
        0
    end
end


{System.show {Sum [1 2 3]}}     % 6
{System.show {Sum [1 2 3 4 5]}} % 15



% Task 3

% Write a function fun {RightFold List Op U}, which goes through a list recursively and, through the use
% of a combining operation Op, accumulates and returns a result. U is the neutral elements for the operation.
% The function should be right-associative, meaning it should perform the calculation from right to left. 
% 
% For example, if the operation Op is addition and the list is [1 2 3 4], the RightFold function should calculate
% (1 + (2 + (3 + 4))) and return 10. If the operation is length, the function should calculate (1 + (1 + (1
% + 1))) and return 4. Re-implement Length and Sum using RightFold and test your solution using {Length
% [1 2 3 4]} and {Sum [1 2 3 4]}.

% Tip: The Op parameter can be provided as an anonymous function, e.g.:
% fun {$ X Y} <functionbody> end

declare fun {RightFold List Op U}
    case List of Head | Tail then
        {Op Head {RightFold Tail Op U}}
    [] _ then
        U
    end
end


declare fun {Length List}
    {RightFold List fun {$ _ Y} Y + 1 end 0}
end

declare fun {Sum List}
    {RightFold List fun {$ X Y} X + Y end 0}
end


{System.show {Length [1 2 3 4]}} % 4
{System.show {Sum [1 2 3 4]}}    % 10



% Task 4

% Implement fun {Quadratic A B C} that returns a function which can be used to
% calculate the value of a quadratic polynomial: f(x) = Ax^2 + Bx + C
% {System.show {{Quadratic 3 2 1} 2}} should display 17.

declare fun {Quadratic A B C}
    fun {$ X}
        A*X*X + B*X + C
    end
end


{System.show {{Quadratic 3 2 1} 2}} % 17



% Task 5 a)

% Implement fun {LazyNumberGenerator StartValue} that generates an infinite list of incrementing
% integers on demand, using higher-order programming. Do not use the built-in Lazy keyword neither take
% advantage of threads or dataflow variables to implement the laziness.
%
% “{LazyNumberGenerator 0}.1” should return 0.
% “{{LazyNumberGenerator 0}.2}.1” should return 1.
% “{{{{{{LazyNumberGenerator 0}.2}.2}.2}.2}.2}.1” should return 5.

declare fun {LazyNumberGenerator StartValue}
    StartValue | fun {$} {LazyNumberGenerator StartValue + 1} end
end


{System.show {LazyNumberGenerator 0}.1}                     % 0
{System.show {{LazyNumberGenerator 0}.2}.1}                 % 1
{System.show {{{{{{LazyNumberGenerator 0}.2}.2}.2}.2}.2}.1} % 5



% Task 6

% Implement a tail-recursive version of the function {Sum List} from task 2.
% For example, {Sum [1 2 3]} returns 6.

declare fun {SumHelper List Sum}
    case List of Head | Tail then
        {SumHelper Tail Head + Sum}
    [] nil then
        Sum
    end
end

declare fun {Sum List}
    {SumHelper List 0}
end


{System.show {Sum [1 2 3]}}     % 6
{System.show {Sum [1 2 3 4 5]}} % 15
