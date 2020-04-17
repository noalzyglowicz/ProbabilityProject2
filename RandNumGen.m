%recursive solution
%{
function [u_i] = RandNumGen(numArray)
    [u_i] = zeros(1, length(numArray));
    idx = 1;
    for j = (numArray(1):1:(numArray(1)+length(numArray)-1))
        u_i(1, idx) = lin_cong(j);
        idx = idx + 1;
    end
end
%}

%faked recursion with array
function [u_i] = RandNumGen(numArray)
    [u_i] = zeros(1, length(numArray));
    prev_num_idx = 1;
    idx = 1;
    for n = (numArray(1):1:(numArray(1)+length(numArray)-1))
        if(n ~= 1)
            u_i(1, idx) = (mod((24693 * (((u_i(prev_num_idx))*(2^17))) + 3967), (2^17))) / (2^17);
            prev_num_idx = prev_num_idx + 1;
        else 
            u_i(1, idx) = (mod((24693 * (1000) + 3967), (2^17))) / (2^17);
        end
        idx = idx + 1;
    end
end
