// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract RestaurantManagement {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    struct Table {
        uint256 id;
        uint256 capacity;
        bool isReserved;
        address reservedBy;
    }

    struct MenuItem {
        uint256 id;
        string name;
        uint256 price; // in wei
    }

    struct Order {
        uint256 orderId;
        address customer;
        uint256[] menuItemIds;
        bool isCompleted;
    }

    uint256 public tableCount;
    uint256 public menuItemCount;
    uint256 public orderCount;

    mapping(uint256 => Table) public tables;
    mapping(uint256 => MenuItem) public menu;
    mapping(uint256 => Order) public orders;

    // --- Modifiers ---
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner");
        _;
    }

    modifier onlyCustomer(uint256 tableId) {
        require(tables[tableId].reservedBy == msg.sender, "Not your table");
        _;
    }

    // --- Table Functions ---
    function addTable(uint256 capacity) public onlyOwner {
        tableCount++;
        tables[tableCount] = Table(tableCount, capacity, false, address(0));
    }

    function reserveTable(uint256 tableId) public {
        Table storage table = tables[tableId];
        require(!table.isReserved, "Already reserved");
        table.isReserved = true;
        table.reservedBy = msg.sender;
    }

    function cancelReservation(uint256 tableId) public onlyCustomer(tableId) {
        Table storage table = tables[tableId];
        table.isReserved = false;
        table.reservedBy = address(0);
    }

    // --- Menu Functions ---
    function addMenuItem(string memory name, uint256 price) public onlyOwner {
        menuItemCount++;
        menu[menuItemCount] = MenuItem(menuItemCount, name, price);
    }

    function editMenuItem(
        uint256 id,
        string memory name,
        uint256 price
    ) public onlyOwner {
        require(id <= menuItemCount, "Invalid ID");
        menu[id] = MenuItem(id, name, price);
    }

    // --- Order Functions ---
    function placeOrder(
        uint256 tableId,
        uint256[] memory itemIds
    ) public onlyCustomer(tableId) {
        orderCount++;
        orders[orderCount] = Order(orderCount, msg.sender, itemIds, false);
    }

    function completeOrder(uint256 orderId) public onlyOwner {
        orders[orderId].isCompleted = true;
    }

    function getOrder(uint256 orderId) public view returns (Order memory) {
        return orders[orderId];
    }

    function getMenuItem(uint256 id) public view returns (MenuItem memory) {
        return menu[id];
    }
}
