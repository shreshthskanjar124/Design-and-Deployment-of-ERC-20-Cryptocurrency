// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract FullERC20Demo is ERC20, Ownable {

    // Your addresses
    address public constant OWNER_ADDRESS   = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    address public constant RECEIVER_ADDRESS = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;

    constructor() 
        ERC20("SSSToken", "SSS") 
        Ownable(msg.sender) 
    {
        _mint(OWNER_ADDRESS, 12837654 * 10 ** decimals());
    }

    function decimals() public pure override returns (uint8) {
        return 18;
    }

    function mintTokens(address account, uint256 value) external onlyOwner {
        _mint(account, value);
    }

    function burnMyTokens(uint256 value) external {
        _burn(msg.sender, value);
    }

    function burnFromAddress(address account, uint256 value) external onlyOwner {
        _burn(account, value);
    }

    function internalTransfer(address from, address to, uint256 value) external onlyOwner {
        _transfer(from, to, value);
    }

    function testSpendAllowance(address ownerAddr, address spender, uint256 value) external onlyOwner {
        _spendAllowance(ownerAddr, spender, value);
    }

    function testUpdate(address from, address to, uint256 value) external onlyOwner {
        _update(from, to, value);
    }


    function sendTokens(address to, uint256 amount) external returns (bool) {
        _transfer(msg.sender, to, amount);
        return true;
    }

    function sendToMySecondAccount(uint256 amount) external returns (bool) {
        _transfer(msg.sender, RECEIVER_ADDRESS, amount);
        return true;
    }
}

