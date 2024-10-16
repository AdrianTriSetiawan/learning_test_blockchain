// Definisi kontrak utama
pragma solidity ^0.8.0;

contract Parent {
    // Variabel privat
    int private data;
    // Variabel publik
    int public info;

    // Konstruktor
    constructor() {
        info = 10; // Menginisialisasi info dengan nilai 10
    }

    // Fungsi privat
    function increment(int a) private pure returns (int) {
        return a + 1;
    }

    // Fungsi publik untuk memanggil fungsi privat
    function updateData(int a) public {
        data = increment(a);
    }

    // Fungsi publik untuk mendapatkan nilai data
    function getData() public view returns (int) {
        return data;
    }

    // Fungsi internal
    function compute(int a, int b) internal pure returns (int) {
        return a + b;
    }
}

// Kontrak eksternal yang mengakses kontrak Parent
contract ExternalContract {
    // Menggunakan kontrak Parent
    Parent parent = new Parent();

    // Fungsi publik untuk mengakses fungsi dari Parent
    function readData() public view returns (int) {
        return parent.getData();
    }

    // Fungsi publik untuk memperbarui data di Parent
    function updateDataInParent(int a) public {
        parent.updateData(a);
    }
}

// Kontrak baru yang mewarisi dari kontrak Parent
contract Child is Parent {
    // Fungsi untuk menjumlahkan dua nilai menggunakan fungsi internal dari Parent
    function calculateSum(int a, int b) public pure returns (int) {
        return compute(a, b);
    }

    // Fungsi untuk mengambil nilai info dari Parent
    function getInfo() public view returns (int) {
        return info;
    }
}
