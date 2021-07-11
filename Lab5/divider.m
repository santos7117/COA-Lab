# Restoring Division Algorithm
# Takes 2 equal length unsigned binary number
#
# dvd =  5 => [0 1 0 1]
#             ----------
# dvs =  4 => [0 1 0 0]
#
#       qtn = [0 0 0 1]
#       rmd = [0 0 0 1]
#
function [qtn, rmd] = divider(dvd, dvs)

    len_dvd = length(dvd);
    len_dvs = length(dvs);
    acc = zeros(1, len_dvd);            % set up accumulator
    sh_dvd = dvd;                       % for shifting dividend
    add_next = 0;

    if (dvs == zeros(1, len_dvs))   
      return;
    endif

    for i = 1 : len_dvd    

      [acc sh_dvd] = ASHL(acc, sh_dvd);

      if (add_next)
        acc = adder(acc, dvs);
      else
        acc = substracter(acc, dvs);
      endif
      
      msb = acc(1);
      if (msb)
        add_next = 1;
        sh_dvd(end) = 0;
      else
        add_next = 0;
      endif
      
      disp([acc sh_dvd]);

    endfor

    # restore on the last step
    if (add_next)
      acc = adder(acc, dvs);
    endif

    qtn = sh_dvd;
    rmd = acc;

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
#    bin =          [1 0 0 1]
#                   / / / /
# sh_tmp =     1 <- [0 0 1 1] <- appends 1 by default
#        msb = 1
function [sh_bin msb] = shiftLeft(bin)
    
    msb = bin(1);
    sh_bin = [bin(2 : end) 1];
    
endfunction