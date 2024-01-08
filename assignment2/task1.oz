% \insert ’List.oz’ % Couldn't get this to work, so I've just copied the code at the bottom of this file


% Task 1 a)

% Implement fun {Lex Input}, which that takes a string as input and returns an array of lexemes as
% output. You may assume that that lexemes are separated by a single whitespace character. (Hint: you may
% want to use String.tokens function). For example,
% {Lex "1 2 + 3 *"}
% must return the list ["1" "2" "+" "3" "*"].

declare fun {Lex Input}
    {String.tokens Input & }
end


{System.show {Lex "1 2 + 3 *"}} % [[49] [50] [43] [51] [42]]



% Task 1 b)

% Implement fun {Tokenize Lexemes}, which puts each lexeme into a record. The function returns a
% list of records. The following records have to be used: operator(type:plus), operator(type:minus),
% operator(type:multiply),operator(type:divide), number(N) where N is any number. For example,
% {Tokenize ["1" "2" "+" "3" "*"]}
% must return the list [number(1) number(2) operator(type:plus) number(3) operator(type:multiply)].

% Recursion is used to go through the list of lexemes and add the appropriate record to the output list.
declare fun {Tokenize Lexemes}
   case Lexemes of Head|Tail then
      case Head of
         "+" then
            operator(type:plus) | {Tokenize Tail}
         [] "-" then
            operator(type:minus) | {Tokenize Tail}
         [] "*" then
            operator(type:multiply) | {Tokenize Tail}
         [] "/" then
            operator(type:divide) | {Tokenize Tail}
         [] "p" then
            command(type:print) | {Tokenize Tail}
         [] "d" then
            command(type:duplicate) | {Tokenize Tail}
         [] "i" then
            command(type:invert) | {Tokenize Tail}
         [] "c" then
            command(type:clear) | {Tokenize Tail}
         [] _ then % If it's not an operator, it must be a number
            number({String.toFloat Head}) | {Tokenize Tail} % Convert the string to a float so that it can be shown as a number in the output
      end
   else
      nil
   end
end


{Browse {Tokenize ["1" "2" "+" "3" "*"]}} % [[number(1)] [number(2)] [operator(type:plus)] [number(3)] [operator(type:multiply)]]



% Task 1 c)

% Implement fun {Interpret Tokens}, which interprets the list of records from b). This means to interpret
% the commands from the mdc language, modifying its internal stack until no operators are left. The function
% returns the stack. Valid operators are those corresponding to the record above, i.e., +, -, *, and /, with /
% being floating point division. For example,
% {Interpret [number(1) number(2) number(3) operator(type:plus)]}
% Must return the corresponding stack (i.e., list) after processing all the symbols in the input, that is [5 1].
% Note that the functions you are developing can be chained, that is, the above is the same as writing:
% {Interpret {Tokenize {Lex "1 2 3 +"}}}
% which should also return [5 1].


% Task 1 d), continued from c)

% Add a matching rule for command “p”, which prints the current content of the stack. Use the record
% command(print). For example,
% {Interpret {Tokenize {Lex "1 2 p 3 +"}}}
% must print [2 1] on the Emulator buffer or the terminal, and must also return [5 1], as the new command
% does not alter the content of the stack.


% Task 1 e), continued from d)

% Add a matching rule for “d”, which duplicates the top element on the stack. For example,
% {Interpret {Tokenize {Lex "1 2 3 + d"}}}
% must return [5 5 1].


% Task 1 f), continued from e)

% Add a matching rule for “i”, which flips the sign of the number at the top of the stack.d You can use any
% record name you find appropriate.


% Task 1 g), continued from f)

% Add a matching rule for “c”, which clears the stack (i.e., makes it empty). You can use any record name
% you find appropriate.

% Takes a list of tokens and returns the stack after interpreting the tokens.
% The function is called recursively, and the stack is passed as an argument to the helper function.
declare fun {Interpret Tokens}

   fun {InterpretHelper Tokens Stack}

      case Tokens of Head|Tail then

         case Head of
            number(N) then
               {InterpretHelper Tail N|Stack}
            [] command(type:print) then
               {System.show Stack}
               {InterpretHelper Tail Stack}
            [] command(type:duplicate) then
               {InterpretHelper Tail Stack.1|Stack}
            [] command(type:invert) then
               {InterpretHelper Tail ~Stack.1|{Pop Stack}} % ~ is used to flip the sign of the number, as it is not possible to use - in this context
            [] command(type:clear) then
               {InterpretHelper Tail nil}
            [] operator(type:Op) then

               case Stack of
                  Num1 | Num2 | Rest then

                     case Op of
                        plus then
                           {InterpretHelper Tail  Num1 + Num2|Rest}
                        [] minus then
                           {InterpretHelper Tail  Num1 - Num2|Rest}
                        [] multiply then
                           {InterpretHelper Tail  Num1 * Num2|Rest}
                        [] divide then
                           {InterpretHelper Tail  Num1 / Num2|Rest}
                     end
                  else
                     {System.show 'Error: Not enough numbers on the stack for operator'}
                     nil
               end
         end
      else
         Stack
      end
   end
in
   {InterpretHelper Tokens nil}
end

% {Browse {Interpret {Tokenize {Lex "1 2 3 +"}}}} % [5 1]

% {Browse {Interpret {Tokenize {Lex "1 2 p 3 +"}}}} % returns [5 1] and prints [2 1] to the terminal

% {Browse {Interpret {Tokenize {Lex "1 2 3 + d"}}}} % [5 5 1]

% {Browse {Interpret {Tokenize {Lex "2 3 + i"}}}} % [~5]

{Browse {Interpret {Tokenize {Lex "1 2 3 + c"}}}} % []





% --- --- --- --- --- ---
% Can't get \insert to work, so I've just copied the code here
% --- --- --- --- --- ---

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
