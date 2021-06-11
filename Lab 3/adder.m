function [s c] = adder (bin1, bin2, sub=0)

	if (nargin < 2)
		error("Too few arguments");
	endif
	
	if (!isvector(bin1) && !isvector(bin2))
		error("Requires vector arguments");
	endif
	
	i = length(bin1);	%ptr to first vector
	j = length(bin2);	%ptr to second vector
	
	if (i > j) gt = i;
	else gt = j;
	endif
	
	s = zeros(1, gt);	%initialize sum with greater length
	c = sub;
	while (i >= 1 && j >= 1)
		[s(gt) c] = FullAdder(bin1(i--), XOR(bin2(j--), sub), c);
		--gt;
	endwhile
	
	while (i >= 1)
		[s(i) c] = FullAdder(bin1(i--), XOR(0, sub), c);
	endwhile
	
	while (j >= 1)
		[s(j) c] = FullAdder(0, XOR(bin2(j--), sub), c);
	endwhile
	
endfunction
