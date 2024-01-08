
% Task 8 a)
% Implement {Push List Element}. It should return an updated version of List, in which
% Element has been added in the first position.

declare fun {Push List Element}
   [Element|List]
end

{System.showInfo {Push [a b c] d}} % [d a b c]



% Task 8 b)
% Implement {Peek List}. It should return the element in the first position of List, or nil if the
% stack (list) is empty.

declare fun {Peek List}
   if List == nil then nil
   else List.1 end
end

{System.showInfo {Peek [a b c]}} % a
{System.showInfo {Peek nil}}     % nil



% Task 8 c)
% Implement {Pop List}. It should return an updated version of List, in which the first element
% has been removed.

declare fun {Pop List}
   case List of X|Tail then
      Tail
   else 
      nil
   end
end

{Browse {Pop [a b c]}} % [b c]
