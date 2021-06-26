# Booth's Algorithm for multiplication
function [p] = multiplier(mpc, mpl)
    
    len_mpl = length(mpl);
    len_mpc = length(mpc);
    
    acc = zeros(1, len_mpc);
    tmp = zeros(1, len_mpl);
    sh_mpc = mpc; r = 0;

    for i = len_mpc : -1 : 1

        if ( sh_mpc(len_mpc)==0 && r==1 )
            tmp = mpl;
        endif
        if ( sh_mpc(len_mpc)==1 && r==0 )
            tmp = TwosComplement(mpl)
        endif

        acc = adder(acc, tmp)
        [acc sh_mpc r] = ASHR(acc, sh_mpc)

    endfor

    p = [acc sh_mpc];
    
endfunction



# Arithmetic SHR for accumulator and multiplicand
#
# acc    = [1 0 1]            tmp = [0 0 1]
#            \ \ \                    \ \ \
# sh_acc = [0 1 0] -> 1 -> sh_tmp = [1 0 0] -> 1
#                                          r = 1
function [sh_acc sh_tmp r] = ASHR(acc, tmp)

    len = length(acc);
    [sh r] = SHR([acc tmp]);
    sh_acc = sh(1 : len);
    sh_tmp = sh(len+1 : end);

endfunction



# Shift Right for a binary number
#
#    bin = [1 0 0 1]
#            \ \ \ \
# sh_tmp = [0 1 0 0] -> 1
#                   r = 1
function [sh_tmp r] = SHR(bin)
    
    r = bin(end);
    sh_tmp = [0 bin(1 : end-1)];
    
endfunction
