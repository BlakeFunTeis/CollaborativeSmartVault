// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
import "hardhat/console.sol";
import "owner.sol";

contract Main is OwnerAction{
    function withdrawal(uint _amount) public payable {
        require(AddressAccess[msg.sender].deposit == true, "Your account is not registered or withdrawal temporarily disabled.");
        require(AddressAccess[msg.sender].depositWei > 0 && AddressAccess[msg.sender].depositWei >= _amount, "");
        AddressAccess[msg.sender].depositWei -= _amount;
        payable(msg.sender).transfer(_amount);
    }

    function deposit() public payable {
        require(AddressAccess[msg.sender].withdrawal == true, "Your account is not registered or deposit temporarily disabled.");
        AddressAccess[msg.sender].depositWei += msg.value;
    }

    function getBalance() public view returns(uint) {
        return AddressAccess[msg.sender].depositWei;
    }

    function register() public {
        AddressAccess[msg.sender].deposit = true;
        AddressAccess[msg.sender].withdrawal = true;
        AddressAccess[msg.sender].depositWei = 0;
    }
}