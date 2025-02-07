//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;
contract arraymembers{
    uint[] data=[10,20,30,40,50];
    function array_length()public view returns(uint)
    {
        uint x=data.length;
        return x;
    }
    function array_push()public  returns(uint[] memory)
    {

        data.push(60); 
		data.push(70); 
		data.push(80);
        return data;
	
    }
    function array_pop() public returns(uint[] memory)
	{ 
		data.pop(); 
		return data; 
	}
}

