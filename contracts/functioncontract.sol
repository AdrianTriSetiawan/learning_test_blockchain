pragma solidity ^0.8.0;

contract HelloWorld {

    uint hasil;

    function cetakHello() public pure returns (string memory) {
        return "Hello World";
    }

    function tambah(uint a, uint b) public {
        // Local variable
        uint temp = a + b;

        hasil = temp;
    }

    function getHasil() public view returns (uint) {
        return hasil;
    }
}


contract payablecontract{
    uint receivedammount;

    function receivedether() payable public {
        receivedammount = msg.value;
    }
    function gettotalammount() public view returns (uint){
        return receivedammount;
    }
}
