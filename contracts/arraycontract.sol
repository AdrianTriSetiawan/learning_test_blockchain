//tipe data referensi ada 3
// array struct mapping
pragma solidity ^0.8.0;

contract ArrayContract {
    function getData() public pure returns (uint[5] memory) {
        // Inisialisasi array dengan 5 elemen
        uint[5] memory data = [uint(50), 60, 70, 80, 90];
        return data;
    }
}

contract DynamisArray{
    uint[] data;
    uint[] databaru;
    
    function getDataBaru() public returns(uint[] memory){
        data = [60,70,80,30]; //inline
        return data;
    }

    function getBaru() public returns (uint[] memory) {
        databaru = new uint[](5);
        databaru[0] = 10;
        databaru[1] = 20;
        databaru[2] = 30;

        return databaru;
    }
}

contract ArrayLength{
    uint[7] data;

    function array_example() public payable returns (uint[7] memory){
        data = [uint(10), 20, 30,40,50,60];
        return data;
    }
    function array_length() public returns (uint){
        uint x = data.length;
        return x;
    }
}

contract PushArray {
    uint[] arr;

    function insert() public returns(uint[] memory){
        arr = [1,2,3];

        arr.push(4);
        arr.push(5);

        return arr;
    }
}

contract PopArray{
    uint[] arr;

    function hapusSatu () public returns(uint[] memory){
        arr = [1,2,3];
        arr.pop();
        return arr;
    }
}





