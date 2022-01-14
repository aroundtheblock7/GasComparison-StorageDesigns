// SPDX-License-Identifier: MIT
pragma solidity 0.8.6;

contract GasConsumptionMappings {
    struct Entity {
        uint256 data;
        address _address;
    }

    mapping(address => Entity) public entityMapping;

    // ADD Option 1 Mapping- use msg.sender
    // function addEntity(uint data, address _address) public {
    //     entityMapping[msg.sender]._address = _address;
    //     entityMapping[msg.sender].data = data;
    // }

    // //ADD Option 2- shortcut assignment
    // function addEntity(uint _data, address user_address) public {
    //     entityMapping[msg.sender] = Entity(_data, user_address);
    // }

    // ADD Option 3 use _address instead of msg.sender
    // function addEntity(uint data, address _address) public {
    //      entityMapping[_address]._address = _address;
    //      entityMapping[_address].data = data;
    // }

    // Add Option 4 - Use require to make sure msg.sender != to address so we don't overwrite data! Return bool though not necessary.
    function addEntity(uint256 data) public returns (bool success) {
        require(
            entityMapping[msg.sender]._address != msg.sender,
            "This address already as data"
        );
        entityMapping[msg.sender].data = data;
        return true;
    }

    // UPDATE OPTION 1- use a require to make sure only msg.sender can update.
    function updateEntity(uint256 data, address _address) public {
        require(
            entityMapping[_address]._address == msg.sender,
            "You are not authorized to access this"
        );
        entityMapping[msg.sender].data = data;
    }

    // GET OPTION 1 - get only for msg.sender
    // function getEntityMapping () public view returns (uint, address) {
    //     return (entityMapping[msg.sender].data, entityMapping[msg.sender]._address);
    // }

    // GET OPTION 2 - get for any address
    function getEntityMapping(address _address)
        public
        view
        returns (uint256, address)
    {
        return (entityMapping[_address].data, entityMapping[_address]._address);
    }
}
