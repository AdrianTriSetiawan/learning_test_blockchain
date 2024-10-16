// SPDX-License-Identifier: MIT
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

    /** 
     * @dev Memberikan 'voter' hak untuk memberikan suara dalam pemungutan ini. Hanya bisa dipanggil oleh 'chairperson'.
     * @param voter alamat pemilih
     */
    function giveRightToVote(address voter) public {
        require(
            msg.sender == chairperson,
            "Hanya ketua yang dapat memberikan hak untuk memilih."
        );
        require(
            !voters[voter].voted,
            "Pemilih ini sudah memberikan suara."
        );
        require(voters[voter].weight == 0);
        voters[voter].weight = 1;
    }

    /**
     * @dev Mendelegasikan suara Anda kepada pemilih 'to'.
     * @param to alamat tujuan delegasi suara
     */
    function delegate(address to) public {
        Voter storage sender = voters[msg.sender];
        require(!sender.voted, "Anda sudah memberikan suara.");
        require(to != msg.sender, "Delegasi suara ke diri sendiri tidak diizinkan.");

        while (voters[to].delegate != address(0)) {
            to = voters[to].delegate;

            // Ditemukan loop dalam delegasi, tidak diizinkan.
            require(to != msg.sender, "Ditemukan loop dalam delegasi.");
        }
        sender.voted = true;
        sender.delegate = to;
        Voter storage delegate_ = voters[to];
        if (delegate_.voted) {
            // Jika delegasi sudah memilih,
            // langsung tambahkan ke jumlah suara
            proposals[delegate_.vote].voteCount += sender.weight;
        } else {
            // Jika delegasi belum memilih,
            // tambahkan bobotnya.
            delegate_.weight += sender.weight;
        }
    }

    /**
     * @dev Berikan suara Anda (termasuk suara yang didelegasikan kepada Anda) untuk proposal 'proposals[proposal].name'.
     * @param proposal indeks proposal dalam array proposals
     */
    function vote(uint proposal) public {
        Voter storage sender = voters[msg.sender];
        require(sender.weight != 0, "Tidak memiliki hak untuk memilih.");
        require(!sender.voted, "Sudah memberikan suara.");
        sender.voted = true;
        sender.vote = proposal;

        // Jika 'proposal' berada di luar jangkauan array,
        // ini akan menyebabkan error otomatis dan membatalkan semua perubahan.
        proposals[proposal].voteCount += sender.weight;
    }

    /** 
     * @dev Menghitung proposal yang memenangkan pemungutan suara dengan mempertimbangkan semua suara yang telah diberikan.
     * @return winningProposal_ indeks dari proposal yang menang dalam array proposals
     */
    function winningProposal() public view
            returns (uint winningProposal_)
    {
        uint winningVoteCount = 0;
        for (uint p = 0; p < proposals.length; p++) {
            if (proposals[p].voteCount > winningVoteCount) {
                winningVoteCount = proposals[p].voteCount;
                winningProposal_ = p;
            }
        }
    }

    /** 
     * @dev Memanggil fungsi winningProposal() untuk mendapatkan indeks dari pemenang yang terdapat dalam array proposals dan kemudian
     * @return winnerName_ nama pemenang
     */
    function winnerName() public view
            returns (string memory winnerName_)
    {
        winnerName_ = proposals[winningProposal()].name;
    }
}
