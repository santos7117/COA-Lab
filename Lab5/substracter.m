function [diff c is_neg] = substracter (minuend, subtrahend)

	% is_neg = 0;
	[diff c] = adder(minuend, subtrahend, 1);
	
	%if there is no carry then the result is negative
	%so the answer is negative of twos complement of the result
	% if (!c)
		% is_neg = 1;
		% diff = TwosComplement(diff);
		% disp("Negative");
	% endif
	
endfunction