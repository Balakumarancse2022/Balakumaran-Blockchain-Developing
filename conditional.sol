
// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;
contract SolidityTest{

     function sub(uint a, uint b) public pure returns(uint){
      uint result = (a > b? a-b : b-a);
      return result;
     }
}