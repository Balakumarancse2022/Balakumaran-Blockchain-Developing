//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;
contract dynamicarray{
    uint[] dynamicsizeArray;
    function addelement(uint _value)public
    {
        dynamicsizeArray.push(_value);
    }
    function getarray()public view returns(uint[] memory){
        return dynamicsizeArray;
    }
}