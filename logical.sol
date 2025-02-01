// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;
contract logical{
    function logic(bool a ,bool b) public pure returns (bool,bool,bool){ 
        bool and = a&&b;
        
        bool or = a||b;
       
        bool not = !a;
        return (and, or, not);
 }
}

    