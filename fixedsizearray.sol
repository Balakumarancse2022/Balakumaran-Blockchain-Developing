//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;
contract fixedsizeArray{
    uint[9] fixedsizearray;
    function populatearray() public{
        for(uint i=0;i<5;i++){
            fixedsizearray[1]=i+1;
        }
    }
    function getarray()public view returns(uint[9]memory)
    {
        return fixedsizearray;
    }


}