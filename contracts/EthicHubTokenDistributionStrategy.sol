pragma solidity ^0.4.18;

import 'zeppelin-solidity/contracts/ownership/Ownable.sol';
import './crowdsale/FixedPoolWithBonusTokenDistributionStrategy.sol';
import './crowdsale/WhitelistedDistributionStrategy.sol';
import './EthixToken.sol';

/**
 * @title EthicHubTokenDistributionStrategy
 * @dev Strategy that distributes a fixed number of tokens among the contributors,
 * with a percentage deppending in when the contribution is made, defined by periods.
 * It's done in two steps. First, it registers all of the contributions while the sale is active.
 * After the crowdsale has ended the contract compensate buyers proportionally to their contributions.
 * Contributors registered to the whitelist will have better rates
 */
contract EthicHubTokenDistributionStrategy is Ownable, WhitelistedDistributionStrategy {
  //TODO hardcoding of parameters

  function EthicHubTokenDistributionStrategy(EthixToken _token, uint256 _rate, uint256 _rateForWhitelisted)
           WhitelistedDistributionStrategy(_token, _rate, _rateForWhitelisted)
           public
  {

  }


  // Init intervals
  function initIntervals() onlyOwner validateIntervals  {
    bonusIntervals.push(BonusInterval(crowdsale.startTime() + 1 days,10));
    bonusIntervals.push(BonusInterval(crowdsale.startTime() + 2 days,8));
    bonusIntervals.push(BonusInterval(crowdsale.startTime() + 3 days,6));
    bonusIntervals.push(BonusInterval(crowdsale.startTime() + 4 days,4));
    bonusIntervals.push(BonusInterval(crowdsale.startTime() + 5 days,2));
    bonusIntervals.push(BonusInterval(crowdsale.startTime() + 6 days,0));
  }

}
