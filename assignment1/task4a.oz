
declare fun {Max X Y}
   if X < Y then
      Y
   else
      X
   end
end


{System.showInfo {Max 10 89}} % 89
