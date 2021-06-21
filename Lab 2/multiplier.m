function [p c] = multiplier (mpc, mpl)

	len_mpc = length(mpc);
	len_mpl = length(mpl);
	
	cols = 2 * len_mpc + 1;
	part_prod = zeros(len_mpl, cols);
	
	for i = 1 : len_mpl
		if (mpl(len_mpl + 1 - i) == 1)
			c_start = (cols + 2 - len_mpc - i);
			c_end = cols + 1 - i;
			part_prod(i, c_start:c_end) = mpc(1, :);
		endif
	endfor
	
	p = zeros(1, size(part_prod, 2));
	for i = 1 : size(part_prod, 1)
		[p c] = adder(part_prod(i, :), p);
	endfor
	
	mpc
	mpl
	part_prod
	
endfunction