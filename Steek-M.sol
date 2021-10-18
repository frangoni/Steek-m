// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract Figu1 {
    mapping(address => uint256) public amount;
    uint256 _quantity;

    constructor() {}

    error InsufficientBalance(uint256 requested, uint256 available);

    function mint() public {
        _quantity++;
        amount[msg.sender]++;
    }

    function transfer(address _to, uint256 _amount) public {
        if (_amount > amount[msg.sender])
            revert InsufficientBalance({
                requested: _amount,
                available: amount[msg.sender]
            });
        amount[msg.sender] -= _amount;
        amount[_to] += _amount;
    }

    function getAmount() external view returns (uint256) {
        return _quantity;
    }

    function getBalance(address owner) public view returns (uint256) {
        return amount[owner];
    }

    function getOwnBalance() public view returns (uint256) {
        return amount[msg.sender];
    }
}
