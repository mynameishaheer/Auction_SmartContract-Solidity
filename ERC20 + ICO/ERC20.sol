// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

interface IERC20 {
    //returns the total amount of this token available
    function totalSupply() external view returns (uint256);

    //returns the amount of this token that the specific count has
    function balance(address account) external view returns (uint256);

    //holder of the token can call this function to transfer token directly
    function transfer(address receiver, uint256 amount) external returns (bool);

    //allows holder of this token to approve someone else to spend his token
    function transferFrom(
        address sender,
        address receiver,
        uint256 amount
    ) external returns (bool);

    //specifies how much a spender can spend from a holder
    function allowance(address tokenOwner, address spender)
        external
        view
        returns (uint256);

    //holder of the token calls approve to allow spender to spend his money
    function approve(address spender, uint256 amount) external returns (bool);

    //ERC20 standards
    event Transfer(address indexed from, address indexed to, uint256 amount);
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 amount
    );
}

contract ERC20 is IERC20 {
    //total supply of this token
    //mint new token --> totalSupply increase
    //burn tokens --> totalSupply decrease
    uint256 public _totalSupply;

    //keep track of all the users and the amount of tokens they hold
    mapping(address => uint256) public balances;

    //used to keep track of how much token has an owner of a token
    //allowed a spender to spend on his behalf
    //owner --> approves spender --> amount approved for spenidng
    mapping(address => mapping(address => uint256)) public allowance;

    //token metadata(name, symbol)
    string public name;
    string public symbol;
    //used to tell how many decimals are used to represent 1 token
    uint8 public decimals;

    //initialize token
    constructor(){
        name = "Shaheer Ahmed";
        symbol = "SA";
        decimals = 2;
        _totalSupply = 100000;
        balances[0xA336f2A74bfab1423a49FA0519eC40C86920e6Bd] = _totalSupply;
        emit Transfer(address(0), 0xA336f2A74bfab1423a49FA0519eC40C86920e6Bd, _totalSupply);
    }

    //function to get totalSupply of token
    function totalSupply() external view returns(uint){
        return _totalSupply - balances[address(0)];
    }

    //function to return balance of sender
    function balance(address account) external view returns(uint){
        return balances[account];
    }

    //holder of the token can call this function to transfer token directly
    function transfer(address receiver, uint256 amount)
        public
        returns (bool)
    {
        //take amount away from balance of sender
        balances[msg.sender] = balances[msg.sender] - amount;
        //add amount to balance of receiver
        balances[receiver] = balances[receiver] + amount;
        //emit message according to ERC20 standards
        emit Transfer(msg.sender, receiver, amount);
        //returned true if successful
        return true;
    }

    //holder of the token calls approve to allow spender to spend his money
    function approve(address spender, uint256 amount) external returns (bool) {
        //msg.sender is allowing spender to spend this amount of token
        allowance[msg.sender][spender] = amount;
        //emit message according to ERC20 standards
        emit Approval(msg.sender, spender, amount);
        //returned true if successful
        return true;
    }

    //allows holder of this token to approve someone else to spend his token
    function transferFrom(
        address sender,
        address receiver,
        uint256 amount
    ) external returns (bool) {
        //will only allow the amount the owner has specified for that specific msg.sender
        allowance[sender][msg.sender] = allowance[sender][msg.sender] - amount;
        return transfer(receiver, amount);
    }
}
