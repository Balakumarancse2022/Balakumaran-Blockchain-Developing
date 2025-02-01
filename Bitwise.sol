
// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract bitwise{
        uint16 public a=20;
        uint16 public b=30;
        uint16 public and = a & b;
        uint16 public  or = a | b ;
        uint16 public xor = a ^ b;
        uint16 public leftshift = a<<b;
        uint16 public rightshift = a>>b;
        uint16 public not =  ~a;
    
}