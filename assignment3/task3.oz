
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
