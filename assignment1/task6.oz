
/* 
% The example below shows how the stack is used when a function is called
declare fun {IncUntil Start Stop} A in
   {System.showInfo "Pushing Start: "#Start}
   if Start < Stop then
      A = {IncUntil Start+1 Stop}
   else
      A = Stop
   end
   {System.showInfo "Popping Start: "#Start}
   A
end

{System.showInfo {IncUntil 10 15}}
*/


declare fun {Factorial N} A in
   % {System.showInfo "Pushing N: "#N}
   if N == 0 then
      A = 1
   else
      A = N * {Factorial N-1}
   end
   % {System.showInfo "Popping N: "#N}
   A
end

{System.showInfo {Factorial 5}} % 120
