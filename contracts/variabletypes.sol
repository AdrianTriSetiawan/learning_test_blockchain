pragma solidity ^0.8.0;

contract VariableTypes {
    // State variable
    uint sum;

    // Local variable
    function tambah(uint num1, uint num2) public {
        // Local variable
        uint temp = num1 + num2;

        sum = temp;
    }

    function getHasil() public view returns (uint) {
        return sum;
    }
}

contract Types {
    bool public valid = true;

    int32 public angkaku = -32;
    uint public angkamu = 1;
    
    uint32 public ui_data = 5_012_021;  

    uint8 public result;

    function tambahResult() public {
        // Pembulatan diperlukan karena Solidity tidak mendukung angka desimal secara langsung
        result = uint8(3 + 1); // 3.5 + 1.5 dibulatkan menjadi 3 + 1
    }

    // Enum definition
    enum Jobs { mahasiswa, analis, programer }

    function getEnum() public pure returns (Jobs) {
        return Jobs.analis;
    }
}
