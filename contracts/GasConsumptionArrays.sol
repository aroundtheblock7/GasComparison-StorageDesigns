// SPDX-License-Identifier: MIT
pragma solidity 0.8.6;

contract GasConsumptionArrays {
    struct Entity {
        uint256 data;
        address _address;
    }

    Entity[] public entitiesList;

    //Option 1 ADD
    // function addEntity(uint data) public returns (uint rowNumber) {
    //     Entity memory newEntity;
    //     newEntity.data = data;
    //     newEntity._address = msg.sender;
    //     entitiesList.push(newEntity);
    //     return entitiesList.length - 1;
    // }

    //Option 2 ADD
    // function addEntity(uint data, address _address) public returns (uint rowNumber) {
    //     Entity memory newEntity;
    //     newEntity._address = _address;
    //     newEntity.data = data;
    //     entitiesList.push(newEntity);
    //     return entitiesList.length - 1;
    // }

    //Option 3 ADD- shortcut
    // function addEntity(uint _data, address user_address) public returns (uint rowNumber) {
    //     entitiesList.push(Entity(_data, user_address));
    //     return entitiesList.length - 1;
    // }

    //Option 4 ADD- Using for Loop
    // function addEntity(uint data) public returns (uint rowNumber) {
    //     for (uint i=0; i<entitiesList.length; i++) {
    //         if (entitiesList[i]._address == msg.sender) {
    //             require(false, "This entity already exists");
    //         }
    //     }
    //     Entity memory newEntity;
    //     newEntity.data = data;
    //     newEntity._address = msg.sender;
    //     entitiesList.push(newEntity);
    //     return entitiesList.length - 1;
    // }

    function addEntity(uint256 _data) public returns (uint256 rowNumber) {
        for (uint256 i = 0; i < entitiesList.length; i++) {
            if (entitiesList[i]._address == msg.sender) {
                require(false, "This entity already exists");
            }
        }
        entitiesList.push(Entity(_data, msg.sender));
        return entitiesList.length - 1;
    }

    // Option 1 UPDATE (using require)
    // function updateEntity(uint data, uint rowNumber) public returns (bool success) {
    //     require(entitiesList[rowNumber]._address == msg.sender, "You are not authorized to access this");
    //     entitiesList[rowNumber].data = data;
    //     return true;
    // }

    // Option 2 UPDATE (using require)
    // function updateEntity(uint data, uint index) public returns (bool success) {
    //     require(entitiesList[index]._address == msg.sender, "You are not allowed to access this");
    //     entitiesList[index].data = data;
    //     return true;
    // }

    // Option 3 UPATE (using for Loop)
    function udpateEntity(uint256 data) public returns (bool success) {
        for (uint256 i = 0; i < entitiesList.length - 1; i++) {
            if (entitiesList[i]._address == msg.sender) {
                entitiesList[i].data = data;
                return true;
            }
        }
        return false;
    }

    function getListCount() public view returns (uint256 totalCount) {
        return entitiesList.length;
    }

    function getAllEntites() public view returns (Entity[] memory) {
        return entitiesList;
    }

    function getEntity(uint256 rowNumber)
        public
        view
        returns (address, uint256)
    {
        return (entitiesList[rowNumber]._address, entitiesList[rowNumber].data);
    }

    function returnEntityWithIndex(uint256 index)
        public
        view
        returns (address, uint256)
    {
        return (entitiesList[index]._address, entitiesList[index].data);
    }
}
