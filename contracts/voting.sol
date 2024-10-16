pragma solidity >=0.7.0 <0.9.0;

/** 
 * @title Pemungutan Suara (Ballot)
 * @dev Menerapkan proses pemungutan suara dengan delegasi suara
 */
contract Ballot {

    struct Voter {
        uint weight; // bobot dihitung dari delegasi
        bool voted;  // jika true, orang tersebut sudah memberikan suara
        address delegate; // orang yang didelegasikan suaranya
        uint vote;   // indeks dari proposal yang dipilih
    }

    struct Proposal {
        string name;   // nama proposal sebagai string
        uint voteCount; // jumlah suara yang terkumpul
    }

    address public chairperson;

    mapping(address => Voter) public voters;

    Proposal[] public proposals;

    /** 
     * @dev Membuat pemungutan suara baru untuk memilih salah satu dari 'proposalNames'.
     * @param proposalNames nama-nama proposal
     */
    constructor(string[] memory proposalNames) {
        chairperson = msg.sender;
        voters[chairperson].weight = 1;

        for (uint i = 0; i < proposalNames.length; i++) {
            // Membuat objek Proposal sementara dan menambahkannya ke array proposals
            proposals.push(Proposal({
                name: proposalNames[i],
                voteCount: 0
            }));
        }
    }

    // Fungsi lainnya tetap sama...
}
