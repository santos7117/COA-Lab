# Restoring Division Algorithm
# Takes 2 signed or unsigned binary number
#
# dvd =  5 => [0 1 0 1]
                  /
# dvs = -5 => [1 0 1 1]
#
#       qtn = [1 1 1 0]
#       rmd = [0 0 0 0]
# Since MSB of qtn == 1
# ans = TwosCompplement(p) = [0 0 0 1]
#
function [qtn, rmd] = divider(dvd, dvs)

    len_dvd = length(dvd);
    len_dvs = length(dvs);

    acc = zeros(1, len_dvd);
    sh_dvd = dvd; msb = 0;

    for i = 1 : len_dvd
    
        [acc sh_dvd] = ASHL(acc, sh_dvd);
        tmp = acc;

        acc = substracter(acc, dvs);

        sh_dvd(end) = 1;
        msb = acc(1);
        if (msb)
            acc = tmp;          % restore acc
            sh_dvd(end) = 0;
        endif
        
        disp([acc sh_dvd]);

    endfor

    qtn = sh_dvd;
    rmd = acc;

    msb = qtn(1);
    if (msb)
        disp("Negative");
        qtn = TwosComplement(qtn);
    endif

endfunction



# Arithmetic Shift Left for accumulator and divident
#
# acc    =      [1 0 1]            tmp = [0 0 1]
#               / / /                    / / /
# sh_acc = 1 <- [0 1 1]    sh_tmp = 0 <- [0 1 1]
#    msb = 1
function [sh_acc sh_tmp msb] = ASHL(acc, tmp)

    len = length(acc);
    [sh msb] = shiftLeft([acc tmp]);
    sh_acc = sh(1 : len);
    sh_tmp = sh(len+1 : end);

endfunction



# Shift Left for a binary number
#
#    bin =          [1 0 0 1] (lsb = 1)
#                   / / / /
# sh_tmp =     1 <- [0 0 1 1]
#        msb = 1
function [sh_bin msb] = shiftLeft(bin)
    
    msb = bin(1);
    lsb = bin(end);
    sh_bin = [bin(2 : end) lsb];
    
endfunction