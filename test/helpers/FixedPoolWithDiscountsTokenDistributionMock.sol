import '../../contracts/crowdsale/FixedPoolWithDiscountsTokenDistributionStrategy.sol';

contract FixedPoolWithDiscountsTokenDistributionMock is FixedPoolWithDiscountsTokenDistributionStrategy {


  function FixedPoolWithDiscountsTokenDistributionMock(ERC20 _token, uint256 _rate)
           FixedPoolWithDiscountsTokenDistributionStrategy(_token,_rate)
  {
  }

  function addInterval(uint256 _end, uint256 _discount) {
    discountIntervals.push(DiscountInterval(_end,_discount));
  }

}
