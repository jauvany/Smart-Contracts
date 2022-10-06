1 // Our first contract is a faucet!
2 contract Faucet {
3
4 // Give out ether to anyone who asks
5 function withdraw(uint withdraw_amount) public {
6
7 // Limit withdrawal amount
8 require(withdraw_amount <= 100000000000000000);
9
10 // Send the amount to the address that requested it
11 msg.sender.transfer(withdraw_amount);
12 }
13
14 // Accept any incoming amount
15 function () public payable {}
16
17 }
