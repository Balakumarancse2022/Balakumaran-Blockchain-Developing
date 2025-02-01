

// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Arithmetic { 
	
function arithop(uint a, uint b) public pure returns (uint, uint, 
													uint, uint, 
													uint, uint, 
													uint) { 

                                                            uint sum = a + b; 
	
 
                                                            uint sub = a - b; 
	
 
                                                            uint mul = a * b; 
                                                                
                                                            
                                                            uint div = a / b; 
                                                                
                                                            
                                                            uint mod = a % b; 
                                                                
                                                            
                                                            uint inc = ++a; 
                                                                

                                                            uint dec = --b; 
                                                                
                                                            return (sum, sub, mul, div, mod, inc, dec); 
                                                       
                                                       } 
}
