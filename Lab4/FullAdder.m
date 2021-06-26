%Takes 3 bits
%Returns array of sum and carry

function [sum carry] = FullAdder(a, b, c)
	sum = XOR(XOR(a,b), c);
	carry = OR( AND(a,b), AND(XOR(a,b), c) );
endfunction
