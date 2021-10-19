// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Figurita {
    mapping(address => uint256) public amount;
    uint256 _quantity;
    bytes32 name;

    constructor(bytes32 _name) {
        name = _name;
    }

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

    function getName() public view returns (string memory) {
        return bytes32ToString(name);
    }

    function bytes32ToString(bytes32 _bytes32)
        public
        pure
        returns (string memory)
    {
        uint8 i = 0;
        while (i < 32 && _bytes32[i] != 0) {
            i++;
        }
        bytes memory bytesArray = new bytes(i);
        for (i = 0; i < 32 && _bytes32[i] != 0; i++) {
            bytesArray[i] = _bytes32[i];
        }
        return string(bytesArray);
    }
}

contract Figu1 is Figurita {
    constructor() Figurita("steekit1") {}
}

contract Figu2 is Figurita {
    constructor() Figurita("steekit2") {}
}
