
declare fun {Length List}
   case List of _|Tail then
      1 + {Length Tail} 
   else 
      0
   end
end


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


declare fun {Append List1 List2}
   case List1 of X|Tail then
      X|{Append Tail List2}
   else
      List2
   end
end


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


declare fun {Position List Element}
   case List of X|Tail then
      if X == Element then
         0
      else
         1 + {Position Tail Element}
      end
   end
end


declare fun {Push List Element}
   [Element|List]
end


declare fun {Peek List}
   if List == nil then nil
   else List.1 end
end


declare fun {Pop List}
   case List of X|Tail then
      Tail
   else 
      nil
   end
end

