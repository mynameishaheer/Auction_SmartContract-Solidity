### IBC Term Project 18635
### Shaheer Ahmed - 18635

#### Auction Contract
 - Owner starts the auction by specifying the item to be bid, the starting price of the bidding, and the highest amount that can be bid after which the contract will no longer take any new incoming bids
 - Bidders enter an amount to bid (in Ether)
 - Bidding amount and address are stored
 - If the current bidding amount + last stored bid is < highest bid then the bid is not placed
 - The owner can cancel the bid, which returns all bids placed back to their senders
 - The owner can finalize the auction, which pays the owner the highest bid and returns the rest of the bids back to their owners
 - If the highest bid is greater than the highest amount that can be bid on the current item, then the exceeding amount is returned back to the sender of the bid
 - All information regarding the bid, including the item details, the highest bid/bidder as well as the last amount that the current user bid, is made public
 - Proper error checks are implemented to ensure two bids do not start at the same time, a bid must be in progress in order for the owner to end it, and the owner must not be able to participate in the bidding and more
#### ERC20 Token and Inital Coin Offering
 - The coin is generated as per standard
 - The ICO is not working as required
 - An investor can send an amount of ether, which is transferred to the admin of the contract
 - In return the investor should receive a specific amount of the token
 - However this is not working and I do not understand why
 - Initially I implemented a function in the coin called mint
 - This function allowed a user to send an amount of ether to the contract which in return gave the user an equivalent amount of ether back from the totalSupply.
 - The ether could then be withdrawn by the owner whenever he pleased
 - This code has been commented out in the file and its implementation can be seen clearly there
