
% Task 4

% Implement fun {Quadratic A B C} that returns a function which can be used to
% calculate the value of a quadratic polynomial: f(x) = Ax^2 + Bx + C
% {System.show {{Quadratic 3 2 1} 2}} should display 17.

declare fun {Quadratic A B C}
    fun {$ X}
        A*X*X + B*X + C
    end
end


{System.show {{Quadratic 3 2 1} 2}} % 17
