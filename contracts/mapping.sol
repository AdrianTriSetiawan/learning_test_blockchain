// Mendefinisikan contract untuk mapping sederhana
pragma solidity ^0.8.0;

contract MappingContract {
    // Deklarasi mapping dari address ke integer
    mapping(address => uint) public myMap;

    // Fungsi untuk menambah data ke dalam mapping
    function set(address _addr, uint _value) public {
        myMap[_addr] = _value;
    }

    // Fungsi untuk mendapatkan data dari mapping
    function get(address _addr) public view returns (uint) {
        return myMap[_addr];
    }
}

// Contract untuk Nested Mapping
pragma solidity ^0.8.0;

contract NestedMappingContract {
    // Deklarasi nested mapping
    mapping(address => mapping(uint => bool)) public nestedMap;

    // Fungsi untuk menambah data ke dalam nested mapping
    function set(address _addr, uint _index, bool _value) public {
        nestedMap[_addr][_index] = _value;
    }

    // Fungsi untuk mendapatkan data dari nested mapping
    function get(address _addr, uint _index) public view returns (bool) {
        return nestedMap[_addr][_index];
    }
}
