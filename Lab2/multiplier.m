function [p] = multiplier (mpc, mpl)

	len_mpc = length(mpc);
	len_mpl = length(mpl);
	cols = len_mpc + len_mpl; % set max no. of bits of result
	partl_prod = zeros(len_mpl, cols);

	% copy multiplicand for every 1 in multiplier
	for i = 1 : len_mpl
		if (mpl(len_mpl + 1 - i) == 1)
			c_start = (cols + 2 - len_mpc - i);
			c_end = cols + 1 - i;
			partl_prod(i, c_start:c_end) = mpc(1, :);
		endif
	endfor

	% sums numbers in partial product array

	s = zeros(1, cols);
	for i = 1 : size(partl_prod, 1)
		s = adder(partl_prod(i, :), s);
	endfor
	p = s;

	formatResult(mpc, mpl, partl_prod, p);

endfunction




function formatResult(mpc, mpl, part_prod, p)

	% len = size(part_prod, 2)
	% mpc = setPadding(mpc, len);
	% op = setPadding("*", len);
	% mpc = setPadding(mpl, len);

	disp("_________________________________________________");
	disp(mpc);
	disp("   *");
	disp(mpl);
	disp("_________________________________________________");
	disp(part_prod);
	disp("_________________________________________________");
	disp(p);
	disp("_________________________________________________");

endfunction




function [res] = setPadding(num, len)

	len_num = length(num);
	num = int2str(num);
	pad = len - len_num;
	
	res = blanks(2*pad);
	res = [res num];

endfunction