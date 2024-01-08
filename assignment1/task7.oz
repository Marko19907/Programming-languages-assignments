
% Task 7 a)
% Implement {Length List}. It should return the element count of List.

declare fun {Length List}
   case List of _|Tail then
      1 + {Length Tail} 
   else 
      0
   end
end

{System.showInfo {Length [1 2 3 4 5]}} % 5



% Task 7 b)
% Implement {Take List Count}. It should return a list of the first Count elements. If Count is
% bigger than the amount of elements in the list, it should return the entire List.

declare fun {Take List Count}
   if {Length List} < Count then
      List
   else
      case List of X|Tail then
         if Count > 0 then
            X|{Take Tail Count - 1}
         else
            nil
         end
      else
         nil
      end
   end
end

{System.showInfo {Take [1 2 3 4 5] 3}} % [1 2 3]



% Task 7 c)
% Implement {Drop List Count}. It should return a list without the first Count values. If Count
% is greater than the length of the list, the function should return nil.

declare fun {Drop List Count}
   if {Length List} < Count then
      nil
   else
      case List of _|Tail then
         if Count > 0 then
            {Drop Tail Count - 1}
         else
            List
         end
      else
         nil
      end
   end
end

{System.showInfo {Drop [1 2 3 4 5] 3}} % [4 5]



% Task 7 d)
% Implement {Append List1 List2}. It should return a list of all the elements in List1 followed
% by all the elements in List2.

declare fun {Append List1 List2}
   case List1 of X|Tail then
      X|{Append Tail List2}
   else
      List2
   end
end

{System.showInfo {Append [1 2 3] [4 5 6]}} % [1 2 3 4 5 6]



% Task 7 e)
% Implement {Member List Element}. It should return true if Element is present in List, false otherwise.

declare fun {Member List Element}
   case List of X|Tail then
      if X == Element then
         true
      else
         {Member Tail Element}
      end
   else
      false
   end
end

{Show {Member [1 2 3 4 5] 3}} % true



% Task 7 f)
% Implement {Position List Element} It should return the position of Element in List. You
% can in this case assume that the element is present in the list.

declare fun {Position List Element}
   case List of X|Tail then
      if X == Element then
         0
      else
         1 + {Position Tail Element}
      end
   end
end

{System.showInfo {Position [1 2 3 4 5] 3}} % 2
