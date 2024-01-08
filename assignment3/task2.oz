
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
