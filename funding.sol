//SPDX-License-Identifier: MIT;
pragma solidity ^ 0.8.0;

import "./PriceConversion.sol";

error NotOwner();

contract fundme{
    using PriceConverter for uint256;

    uint256 public minimumusd = 1 * 1e18;

    address[] public funders;

    address public owner;

    constructor(){
        owner = msg.sender;
    }

    mapping(address => uint256) public addressToAmountFunded;

    function fund() public payable{
        require(msg.value.conversionrate() >= minimumusd, "Minimum amount is 1$");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = msg.value;
    }

    modifier onlyowner{
        if(msg.sender != owner) revert NotOwner();
        _;
    }

    function withdraw() public onlyowner {
        for(uint256 funderindex = 0; funderindex < funders.length; funderindex++){
            address funder = funders[funderindex];
            addressToAmountFunded[funder] = 0;

        }
        funders = new address[](0);
        (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call failed");
    }
}