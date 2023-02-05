// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
import "hardhat/console.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract OwnerAction is Ownable {

    struct Actions {
        bool withdrawal;
        bool deposit;
        uint depositWei;
    }

    mapping (address => Actions) AddressAccess;

    function setWithdrawalAccess(address _address, bool _toggle) public onlyOwner {
        AddressAccess[_address].withdrawal = _toggle;
    }

    function setDepositAccess(address _address, bool _toggle) public onlyOwner {
        AddressAccess[_address].deposit = _toggle;
    }

    function getWithdrawalAccess(address _address) public view onlyOwner returns(bool) {
        return AddressAccess[_address].withdrawal;
    }

    function getDepositAccess(address _address) public view onlyOwner returns(bool) {
        return AddressAccess[_address].deposit;
    }
}