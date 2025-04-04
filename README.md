# 🍽️ Restaurant Management Smart Contract (Day 55)

This is a **Solidity Smart Contract** for managing a restaurant's **table reservations**, **menu items**, and **order tracking** on the Ethereum blockchain. It simulates a decentralized restaurant backend that can be integrated with a DApp frontend using React and Ethers.js.

---

## 📌 What is this?

A smart contract that allows:

- ✅ Restaurant owner to add and update menu items  
- ✅ Restaurant owner to add tables with capacity  
- ✅ Customers to reserve available tables  
- ✅ Customers to place food orders from the menu  
- ✅ Owner to mark orders as completed  

---

## 🎯 Why build this?

Traditional restaurant systems rely on centralized apps or backend servers. This project brings transparency and decentralization into the food service industry by:

- Making **reservations** and **orders** immutable and verifiable  
- Removing the need for intermediaries  
- Providing a **public record** of orders and menu data  
- Serving as a learning project to understand **Solidity struct management**, **access control**, and **basic mappings**

This could be the **base layer** for a DApp like a decentralized OpenTable + Order Tracker.

---

## 🛠️ Features Breakdown

### 👑 Owner Functions
- `addTable(uint capacity)` → Add a new table with specified capacity  
- `addMenuItem(string name, uint price)` → Add a new dish to the menu  
- `editMenuItem(uint id, string name, uint price)` → Update menu items  
- `completeOrder(uint orderId)` → Mark an order as completed  

### 🙋 Customer Functions
- `reserveTable(uint tableId)` → Reserve a table  
- `cancelReservation(uint tableId)` → Cancel reservation  
- `placeOrder(uint tableId, uint[] menuItemIds)` → Place an order from menu items  

### 📖 View Functions
- `getOrder(uint orderId)` → Get full order details  
- `getMenuItem(uint menuItemId)` → Get menu item info  

---

## 🧱 Data Structures

### 🪑 Table
```solidity
struct Table {
  uint256 id;
  uint256 capacity;
  bool isReserved;
  address reservedBy;
}
```

### 🍝 MenuItem
```solidity
struct MenuItem {
  uint256 id;
  string name;
  uint256 price;
}
```

### 🧾 Order
```solidity
struct Order {
  uint256 orderId;
  address customer;
  uint256[] menuItemIds;
  bool isCompleted;
}
```

---

## 🔐 Access Control

- **Only the owner** (deployer of the contract) can manage tables, menu items, and complete orders  
- **Only customers** who reserved a table can place or cancel orders for that table  

---


## 💡 How to Deploy

```bash
# Using Hardhat
npx hardhat compile
npx hardhat run scripts/deploy.js --network <your-network>
```

---

## 🤝 Contributing

If you want to contribute with a frontend UI, Web3 payment integration, or event-driven architecture, feel free to fork and open a pull request!

---

## 📚 License

MIT

---

## 🙌 Built as part of #100DaysOfCode | Day 55  
Follow my journey on [Twitter](https://x.com/MrinalS74850173) or [LinkedIn](https://www.linkedin.com/in/mrinal-singh-43a9661a0/)!
