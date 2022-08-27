

#### Auction Contract
This smart contract allows the owner of the contract to hold a bid. Bidders can view the item as well as its current highest bid. They can choose to add on to their bid as well. When the owner feels the bidding is over they mark the bid as done. Each bidder that did not win recieves their bid amount back while the winner of the bid does not. The highest bid is transferred into the owners account and the auction can start again.

<br />
This code can be run on any Solidity compiler (preferably Remix IDE).

- Owner starts the auction by specifying the item to be bid, the starting price of the bidding, and the highest amount that can be bid after which the contract will no longer take any new incoming bids
 - Bidders enter an amount to bid (in Ether)
 - Bidding amount and address are stored
 - If the current bidding amount + last stored bid is < highest bid then the bid is not placed
 - The owner can cancel the bid, which returns all bids placed back to their senders
 - The owner can finalize the auction, which pays the owner the highest bid and returns the rest of the bids back to their owners
 - If the highest bid is greater than the highest amount that can be bid on the current item, then the exceeding amount is returned back to the sender of the bid
 - All information regarding the bid, including the item details, the highest bid/bidder as well as the last amount that the current user bid, is made public
 - Proper error checks are implemented to ensure two bids do not start at the same time, a bid must be in progress in order for the owner to end it, and the owner must not be able to participate in the bidding and more
