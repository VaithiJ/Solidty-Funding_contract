//SPDX-License-Identifier: MIT;
pragma solidity ^ 0.8.0;
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library PriceConverter{
    function getprice() internal view returns(uint256) {
        AggregatorV3Interface pricefeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
        (, int256 answer,,,) = pricefeed.latestRoundData();
        return uint256(answer * 1e10) ;
    }

    function getversion() internal view returns(uint256){
        AggregatorV3Interface versionn = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
        return versionn.version();

    }

    function conversionrate(uint256 ethamount) internal view returns(uint256){
        uint256 ethprice = getprice();
        uint256 converted = (ethprice * ethamount)/ 1e18;
        return converted;
    }
}
