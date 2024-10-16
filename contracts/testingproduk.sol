// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract JamuSelection {
    // Mapping 
    mapping(string => string) public jamuProducts;

    // Constructor listing produk jamu
    constructor() {
        // list jamu
        jamuProducts["pegal linu"] = "Jamu Kunyit Asam";
        jamuProducts["pegal"] = "Jamu Beras Kencur";
        jamuProducts["sakit maag"] = "Jamu Temulawak";
        jamuProducts["penyegar tubuh"] = "Jamu Gula Asem";
    }

    // Fungsi pemilihan by keluhan
    function getJamuByKeluhan(string memory keluhan) public view returns (string memory) {
        // what if ketemu atau enggak
        if (bytes(jamuProducts[keluhan]).length > 0) {
            return jamuProducts[keluhan];
        } else {
            return "Tidak ada jamu yang cocok untuk keluhan ini.";
        }
    }
}
