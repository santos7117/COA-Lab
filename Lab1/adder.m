function res = adder (n1, n2)
    c = 0;
	s = zeros(1, length(n1));
    for i = length(n1) : -1 : 1
		[s(i), c] = FullAdder(n1(i), n2(i), c);
    endfor
	res = [c s];
endfunction
