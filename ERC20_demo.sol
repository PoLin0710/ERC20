// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract PandaCoin is ERC20 {

    uint256 public maxSupply=10000000000000000000000; //10000 ether
    address public owner;

    modifier isOwner(address _from){
        require(owner==_from,"Not Owner");
        _;
    }

    constructor(string memory _name,string memory _symbol) ERC20(_name,_symbol){
        owner=msg.sender;
    }

    function mint(uint256 amount)external isOwner(msg.sender){
        require(amount+totalSupply()<maxSupply,"The value is illegal");
        _mint(msg.sender, amount);
    } 
}