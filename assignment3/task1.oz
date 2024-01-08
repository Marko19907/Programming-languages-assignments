
% Task 1 a)

% Implement proc {QuadraticEquation A B C ?RealSol ?X1 ?X2}. X1 and X2 should bind to the real
% solution(s) to the quadratic equation. RealSol binds to true if there exists a real solution, false otherwise.
% See the appendix for more information about the quadratic equation. When there are no real solution, you
% may ignore complex solutions, and just set RealSol to false.

declare proc {QuadraticEquation A B C ?RealSol ?X1 ?X2}
    local Temp in
        Temp = B*B - (4.0 * A * C)

        if (Temp < 0.0) then
            RealSol = false
            X1 = nil
            X2 = nil
        else
            RealSol = true
            X1 = (~B + {Float.sqrt 0.0 + Temp})/(2.0 * A)
            X2 = (~B - {Float.sqrt 0.0 + Temp})/(2.0 * A)
        end
    end
end

% Helper proc to print the result
declare proc {QuadraticEquationHelper A B C}
    local RealSol X1 X2 in
        {QuadraticEquation A B C RealSol X1 X2}
        if RealSol then
            {System.show X1}
            {System.show X2}
        else
            {System.show 'No real solution'}
        end
    end
end


% My tests
% {QuadraticEquationHelper 1.0 2.0 ~3.0} % 1 -3
% {QuadraticEquationHelper 1.0 3.0 5.0}  % No real solution

% Tests from the assignment text
{QuadraticEquationHelper 2.0 1.0 ~1.0} % 0.5 -1
{QuadraticEquationHelper 2.0 1.0 2.0}  % No real solution
