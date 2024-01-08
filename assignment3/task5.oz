
% Task 5 a)

% Implement fun {LazyNumberGenerator StartValue} that generates an infinite list of incrementing
% integers on demand, using higher-order programming. Do not use the built-in Lazy keyword neither take
% advantage of threads or dataflow variables to implement the laziness.
%
% “{LazyNumberGenerator 0}.1” should return 0.
% “{{LazyNumberGenerator 0}.2}.1” should return 1.
% “{{{{{{LazyNumberGenerator 0}.2}.2}.2}.2}.2}.1” should return 5.

declare fun {LazyNumberGenerator StartValue}
    StartValue | fun {$} {LazyNumberGenerator StartValue + 1} end
end


{System.show {LazyNumberGenerator 0}.1}                     % 0
{System.show {{LazyNumberGenerator 0}.2}.1}                 % 1
{System.show {{{{{{LazyNumberGenerator 0}.2}.2}.2}.2}.2}.1} % 5
