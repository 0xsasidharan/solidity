// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.22;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155Pausable.sol";
import "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155Supply.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import  "@openzeppelin/contracts/finance/PaymentSplitter.sol";

contract SimpleContractERC1155 is ERC1155, Ownable, ERC1155Pausable, ERC1155Supply, PaymentSplitter {

    uint256 public publicPrice = 1 ether;
    uint256 public allowListPrice = 0.01 ether;
    uint256 public maxSupply = 10;
    uint256 public maxId = 3;
    uint256 public maxPerwallet =3;

    bool public publicMintopen = true;
    bool public allowListMintopen = false;

    mapping (address => bool) public allowList;
    mapping (address => uint256) public purchasesPerWallet;

    constructor (
        address[] memory _payees,
        uint256[] memory _shares

    )  
        ERC1155("ipfs://Qmaa6TuP2s9pSKczHF4rwWhTKUdygrrDs8RmYYqCjP3Hye/")
        Ownable(msg.sender)
        PaymentSplitter( _payees, _shares)
   {} 

    function setURI(string memory newuri) public onlyOwner {
        _setURI(newuri);
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    

    function addAllowList(address[] calldata _addresses) public onlyOwner{
        for (uint256 i=0; i< _addresses.length; i++) 
        {
           allowList[_addresses[i]] = true;
        }
        
        
    }

    function editWindows(bool _openPublicMint , bool _openPrivateMint) external   onlyOwner{
        publicMintopen = _openPublicMint; 
        allowListMintopen = _openPrivateMint;
    }

    function mint(uint256 id , uint256 amount) internal {
        require(purchasesPerWallet[msg.sender] + amount <= maxPerwallet , "reached max purchases per wallet");
         require(id <= maxId , "wrong nft");
         require(totalSupply(id)+ amount <= maxSupply ,"max supply exceeded");
          _mint(msg.sender, id, amount, "" );
          purchasesPerWallet[msg.sender] += amount;

    }



    function publicMint( uint256 id, uint256 amount)
        public payable
    {
        require(publicMintopen , "public mint not open");
       
        require(msg.value == amount * publicPrice , "not enough money sent");
        
        mint(id, amount);
    }


    function allowListMint( uint256 id, uint256 amount)
        public payable
    {
        require(allowListMintopen , "private mint not opened");
        require(allowList[msg.sender] , "not allowed");
        
        require(msg.value == amount * allowListPrice , "not enough money sent");
        mint(id ,amount);
       
       
    }

    function uri(uint256 _id) public view virtual override returns(string memory){
        require(exists(_id) , "id doesnt exists");

        return string(abi.encodePacked(super.uri(_id) , Strings.toString(_id) , ".json"));

    }

    function mintBatch(address to, uint256[] memory ids, uint256[] memory amounts, bytes memory data)
        public
        onlyOwner
    {
        _mintBatch(to, ids, amounts, data);
    }


    function _update(address from, address to, uint256[] memory ids, uint256[] memory values)
        internal
        override(ERC1155, ERC1155Pausable, ERC1155Supply)
    {
        super._update(from, to, ids, values);
    }

    function withdraw(address _addr)  external  onlyOwner{
        uint256 balance = address(this).balance;

        payable(_addr).transfer(balance);
    }
}

