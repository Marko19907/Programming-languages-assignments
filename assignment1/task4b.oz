
declare proc {PrintGreater X Y}
   if X > Y then
      {System.showInfo X}
   else 
      {System.showInfo Y}
   end 
end


{PrintGreater 10 89} % 89
