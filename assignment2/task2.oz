% Task 2: Convert postfix notation into an expression tree

% You will implement fun {ExpressionTree Tokens}, where Tokens is a list of tokens as defined in Task 1.
% The function will return a record organized as a tree, representing the expression parsed from the postfix
% representation of the mdc-style input string.
% For example, when receiving the input:
% [number(2) number(3) operator(type:plus) number(5) operator(type:divide)]
% the function should return the output:
% divide(5 plus(3 2))
% corresponding to the expression 5/(3 + 2).
% Your algorithm will process the tokens in the input list from left to right, recursively calling itself whilst
% building an stack of expressions. You can assume that the input represents a valid postfix expression, “1 +”
% being an example of invalid input. You can also assume that the expression only contains numbers and the
% mathematical operators + - * /. That is, you do not need to consider the “p” and “d” commands from
% Task 1.


% Task 2 a)

% Implement fun {ExpressionTreeInternal Tokens ExpressionStack}, as follows:
%   • When you encounter a non-operator token in the input list, push it to the expression stack.
%   • When you encounter an operator token in the input list, remove two expressions from the expression
%     stack and use them as operands, in a newly built expression according to the received operator (e.g.,
%     plus(EXP1 EXP2)). Then, push this new expression to the expression stack.
%   • When all the input tokens have been processed, return the element at the top of the expression stack.


declare fun {ExpressionTreeInternal Tokens ExpressionStack}
    case Tokens of Head | Tail then
        local NewTail = Tail in % Done because the Tail will be out of scope after the case where it is actually used
            case Head of 
                number(N) then
                    {ExpressionTreeInternal NewTail N|ExpressionStack}
                [] operator(type:Op) then
                    case ExpressionStack of
                      Num1 | Num2 | Rest then
                        case Op of
                          plus then
                            {ExpressionTreeInternal NewTail plus(Num1 Num2)|Rest}
                          [] minus then
                            {ExpressionTreeInternal NewTail minus(Num1 Num2)|Rest}
                          [] multiply then
                            {ExpressionTreeInternal NewTail multiply(Num1 Num2)|Rest}
                          [] divide then
                            {ExpressionTreeInternal NewTail divide(Num1 Num2)|Rest}
                          [] _ then
                            {System.showInfo "Invalid operator"}
                        end
                      end
                end
            end
        else
            ExpressionStack
    end
end

{Browse {ExpressionTreeInternal [number(2) number(3) operator(type:plus) number(5) operator(type:divide)] nil}} % divide(5 plus(3 2))



% Task 2 b)

% Implement ExpressionTree by calling ExpressionTreeInternal with the appropriate arguments.
% {ExpressionTree [number(3) number(10) number(9) operator(type:multiply) operator(type:minus) number(7) operator(type:plus)]}
% The same, but easier to read
% {ExpressionTree {Tokenize {Lex "3 10 9 * - 7 +"}}}
% must return something equivalent to the record:
% plus(7 minus(multiply(9 10) 3))
% which in turns corresponds to the expression (7 + ((9 ∗ 10) − 3)).


declare fun {ExpressionTree Tokens}
    {ExpressionTreeInternal Tokens nil}
end

{Browse {ExpressionTree [number(3) number(10) number(9) operator(type:multiply) operator(type:minus) number(7) operator(type:plus)]}} % plus(7 minus(multiply(9 10) 3))


/*
HOW DOES IT WORK?
The code processes a list of tokens in postfix notation (Reverse Polish Notation), which can be numbers, operators, or commands.
It employs recursive traversal to analyze each token's type. 

When a number is encountered, it's placed on a stack and when an operator is found, the two most recent stack elements are retrieved,
and an unambiguous infix expression is constructed, enclosed in parentheses.

This new infix expression is then pushed onto the stack. In the case of a command, the top stack element is removed,
and an infix-style expression incorporating the command is generated and placed back on the stack. 
This process continues until the token list is empty.

Finally, the resulting stack is returned, representing the infix representation of the initial input.
*/
