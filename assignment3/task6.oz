
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
