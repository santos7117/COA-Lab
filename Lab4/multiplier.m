# Booth's Algorithm for multiplication
# Takes 2 signed binary number
#
# mpc =  5 => [0 1 0 1]
# mpl = -5 => [1 0 1 1]
#           *___________
# p = [1 1 1 0 0 1 1 1]
# Since MSB == 1
# ans = TwosCompplement(p) = [0 0 0 1 1 0 0 1]
function [p] = multiplier(mpc, mpl)
    
    len_mpl = length(mpl);
    len_mpc = length(mpc);
    
    acc = zeros(1, len_mpc);
    sh_mpc = mpc; lsb = 0;

    for i = len_mpl : -1 : 1

        tmp = zeros(1, len_mpl);

        if ( sh_mpc(len_mpc)==0 && lsb==1 )
            tmp = mpl;
        endif
        if ( sh_mpc(len_mpc)==1 && lsb==0 )
            tmp = TwosComplement(mpl);
        endif

        acc = adder(acc, tmp);
        [acc sh_mpc lsb] = ASHR(acc, sh_mpc);
        disp([acc sh_mpc lsb]);

    endfor

    p = [acc sh_mpc];
    msb = p(1);
    if (msb)
        disp("Negative");
        p = TwosComplement(p);
    endif
    
endfunction



# Arithmetic Shift Right for accumulator and multiplicand
#
# acc    = [1 0 1]            tmp = [0 0 1]
#            \ \ \                    \ \ \
# sh_acc = [0 1 0] -> 1 -> sh_tmp = [1 0 0] -> 1
#                                        lsb = 1
function [sh_acc sh_tmp lsb] = ASHR(acc, tmp)

    len = length(acc);
    [sh lsb] = shiftRight([acc tmp]);
    sh_acc = sh(1 : len);
    sh_tmp = sh(len+1 : end);

endfunction



# Shift Right for a binary number
#
#    bin = [1 0 0 1]
#            \ \ \ \
# sh_tmp = [0 1 0 0] -> 1
#                 lsb = 1
function [sh_bin lsb] = shiftRight(bin)
    
    msb = bin(1);
    lsb = bin(end);
    sh_bin = [msb bin(1 : end-1)];
    
endfunction
