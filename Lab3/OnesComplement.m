function [ones_cmpl] = OnesComplement (bin)

	len = length(bin);
	ones_cmpl = zeros(1, len);
	for i = len : -1 : 1
		ones_cmpl(i) = NOT(bin(i));
	endfor
	
endfunction