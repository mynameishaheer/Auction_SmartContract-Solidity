## IBC Term Project 18635
### Shaheer Ahmed - 18635

#### Auction Contract
 - Owner starts the auction by specifying the item to be bid, the starting price of the bidding, and the highest amount that can be bid after which the contract will no longer take any new incoming bids
 - Bidders enter an amount to bid (in Ether)
 - Bidding amount and address are stored
 - If the current bidding amount + last stored bid is < highest bid then the bid is not placed
 - The owner can cancel the bid, which returns all bids placed back to their senders
 - The owner can finalize the auction, which pays the owner the highest bid and returns the rest of the bids back to their owners
 - If the highest bid is greater than the highest amount that can be bid on the current item, then the exceeding amount is returned back to the sender of the bid
 - All information regarding the bid, including the item details, the highest bid/bidder as well as the last amount that the current user bid, is available
 - Proper error checks are implemented to ensure two bids do not start at the same time, a bid must be in progress in order for the owner to end it, and the owner must not be able to participate in the bidding
#### Question 2
