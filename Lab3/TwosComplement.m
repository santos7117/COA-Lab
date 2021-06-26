function [twos_cmpl] = TwosComplement (bin)

	twos_cmpl = bin;
	i = length(bin);
	while (i > 1 && bin(i) == 0)
		--i;
	endwhile
	
	if (i != 1)
		twos_cmpl(1:i-1) = OnesComplement(bin(1:i-1));
	endif
	
endfunction
