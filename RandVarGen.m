function [x_i] = RandVarGen(u_i)
    x_i = sqrt(-2*(1/((1/57)^2))*log((1.0 - u_i)));
end