pragma solidity >0.7.0 <0.8.0;

contract Marketplace {
    address publicsaller;
    address publicbuyer;
    mapping (address => uint) public balances;

    event ListItem (address saller, uint price);
    event PurchasedItem(address saller, address buyer, uint price);

    enum StateType {
        ItemAvailable,
        ItemPurchased
    }
    
    StateType public state;

    Constructor() public {
        seller = msg.sender;
        state = StateType.ItemAvailable;
    }

    function buy(address seller, address buyer, uint price) public payable {
        require(price <= balances[buyer], "Insuficient ballance");
        state = StateType.ItemPurchased;
        balances[buyer] -= price;
        balances[seller] += price;


        emit PurchasedItem(seller, buyer, msg.value);
    }
}
