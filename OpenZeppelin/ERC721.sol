// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.22;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract SimpleContractERC721 is ERC721, ERC721Enumerable, ERC721Pausable, Ownable {
    uint256 private _nextTokenId;

    uint256 public MAX_SUPPLY = 100;
   

    mapping(address => bool) public allowList;

    constructor()
        ERC721("TESTNFT", "TNFT")
        Ownable(msg.sender)
    {}

    function _baseURI() internal pure override returns (string memory) {
        return "ipfs://QmY5rPqGTN1rZxMQg2ApiSZc7JiBNs1ryDzXPZpQhC1ibm/";
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function addAllowList(address[] calldata _address) external onlyOwner {
        for (uint256 i =0; i < _address.length ; i++) 
        {
            allowList[_address[i]] = true;
        }




    }

    modifier onlyAllowedUser(){

        require(allowList[msg.sender]== true);
        _;


    }

    function allowListMint() public payable onlyAllowedUser {
       require(msg.value == 0.0001 ether , "not enough funds");
        require(totalSupply() < MAX_SUPPLY);
        uint256 tokenId = _nextTokenId++;
        _safeMint(msg.sender , tokenId);
    }



    function publicMint() public payable  {
        require(msg.value == 0.001 ether , "not enough funds");
        require(totalSupply() < MAX_SUPPLY);
        uint256 tokenId = _nextTokenId++;
        _safeMint(msg.sender , tokenId);
    }

    function withdraw(address _address) external onlyOwner {
        uint256 balance = address(this).balance;
        payable(_address).transfer(balance);
    }


    function _update(address to, uint256 tokenId, address auth)
        internal
        override(ERC721, ERC721Enumerable, ERC721Pausable)
        returns (address)
    {
        return super._update(to, tokenId, auth);
    }

    function _increaseBalance(address account, uint128 value)
        internal
        override(ERC721, ERC721Enumerable)
    {
        super._increaseBalance(account, value);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}
