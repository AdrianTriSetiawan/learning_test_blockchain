pragma solidity ^0.8.0;

contract addresscontract {
//     //address = no rek
//     //smart contract ada adresss nya

//     //adress payable
//     //send dan transfer

//     address public caller;

//     function getcalleradress() public returns(address){
//         caller = msg.sender;

//         return caller;
//     }

    uint receivedAmount;

    // Fungsi untuk mendapatkan alamat kontrak ini
    function getAddress() public view returns (address) {
        return address(this);
    }

    // Fungsi untuk menerima Ether
    function receiveEther() payable public {
        receivedAmount += msg.value; // Tambahkan jumlah Ether yang diterima
    }
    
    // Fungsi untuk mentransfer Ether ke alamat yang diberikan
    function transferFund(address payable _address, uint nominal) public {
        require(address(this).balance >= nominal, "Insufficient balance in contract");
        _address.transfer(nominal);
    }

    // Fungsi untuk mengirim Ether menggunakan send, yang mengembalikan boolean
    function sendFund(address payable _address, uint nominal) public returns (bool) {
        require(address(this).balance >= nominal, "Insufficient balance in contract");
        return _address.send(nominal);
    }

    // Fungsi receive untuk menangkap Ether yang dikirim langsung ke kontrak
    receive() external payable {
        receivedAmount += msg.value; // Tambahkan jumlah Ether yang diterima
    }
}
