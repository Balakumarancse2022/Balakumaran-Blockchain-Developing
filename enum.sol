//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;
contract enumexample{
    enum status{ordered,shipped,delivery,cancelled}
    status public orderstatus;
    function getstatus() public  view returns  (status){
        return orderstatus;
    } 
    function setStatus(uint _status) public {
        require(_status <= uint(status.cancelled), "Invalid status");
        orderstatus = status(_status);
    }
     function cancelOrder() public {
        orderstatus = status.cancelled;
    }
}

