:smiley: Please preview README in github for better visualization and experience :smiley:
# CE/CZ4153 Blockchain Technology Development Project
## Project topic 5: Pendle: Liquidity Mining with NFTs as Rewards alongside PENDLE

### Contents
- [General Overview](#general-overview)
- [Terminology Clarification](#before-starting-we-should-straighten-out-some-terminology)
- [Understanding of the Problem](#detailed-understanding-of-the-problem)
- [Engineering Plans](engineering-plans-we-had)
- [Steps to accomplish these Plans](steps-needed-to-accomplish-these-plans)
- [Bonuses](bonuses-we-added)
- [Usage of code](usage-of-code)

### General Overview
1. A liquidity provider (LP) will be rewarded with the Pendle tokens when he provides liquidity to the liquidity pool. :droplet:
2. He will be able to stake his Pendle tokens for interests and be paid in Pendle tokens (reward and yield tokens) when redeeming them. :moneybag:
3. Besides that, he will gain points when staking certain amount of Pendle tokens for a certain period, which he can then redeem NFTs by using the points. :framed_picture:

### Before starting, we should straighten out some terminology
1. Pendle Tokens consists of 
    - _stakeToken_ which is the token to be used to stake into this contract to receive rewards.
    - _yieldToken_ which is the token generated by stakeToken while it's being staked.
2. LP Tokens mentioned in the *Project Description* will be referred here as _stakeToken_. 

### Detailed Understanding of the problem
Given the massive development of the NFT space, it will be greatly beneficial if NFT is supported in the current Pendle liquidity mining contract. Therefore, our development project aims to integrate liquidity mining with NFTs (non-fungible tokens) as rewards with Pendle.  
1. Supporting ERC-721 enumerable NFTs as rewards.
2. The reward mechanism of PENDLE tokens should remain unchanged (linearly vested over epochs).
3. A method to track the reward points proportional to the amount of _stakeToken_ provided by the user to represent when he is eligible to claim an NFT.
4. A configurable exchange rate of rewards points to an NFT.
5. Reward points can only be accumulated when _stakeToken_ are staked.

### Engineering plans we had
We initially tried to integrate more with Pendle Environment by using the contract addresses of IPendleLiquidityMiningV2 and the PendleToken already deployed. <br /> :bangbang: However, we could not access their contracts when trying to mint or transfer tokens. <br />
:ballot_box_with_check: Decided to go with mocking up our own Liquidity Pool environment with our tokens and NFTs.
1. :muscle: Understanding the workflow: <br />
    - Start with the Back End, write the smart contracts for the ERC20 tokens, ERC721 tokens and Liquidity Pool on [Visual Studio Code editor](https://code.visualstudio.com/) with the [Solidity plugin].(https://marketplace.visualstudio.com/items?itemName=JuanBlanco.solidity)
    - Deploy on the [Kovan Testnet](https://kovan.etherscan.io/) using [Alchemy](https://www.alchemy.com/) as node provider since Pendle projects have been testing on the Kovan Testnet in the past.
    - Develop the Front End application for the User Interface.
    - Integrate the Front End with the Back End for the project completion!
2. :muscle: Choosing which technology to use: <br />
    - Decide on which framework to use for developing the smart contracts, either [Truffle](https://trufflesuite.com/) or [Hardhat](https://hardhat.org/) -> Decided with **Hardhat** as it is becoming more widely adopted. <br />
    - Decide on which framework to use for the front-end, either [React](https://reactjs.org/) or [HTML](https://www.w3schools.com/html/) -> Decided with **React** as it has good coverage of debuggind and design tools. <br />
    - Decide on whether to use either LocalHost or Hosting website on Server -> Decided with **LocalHost** for simplicity of the project. <br />
3. :muscle: Smart Contract Considerations: <br />
    - Implementing the _redeemnft_ function in the Liquidity Pool contract. <br />
     - Uses the points specified to determine which NFT to give as reward. 
     - NFT is minted once the user claims his reward i.e NFTs are not minted one shot.
    - Linear Vesting of PENDLE tokens (_stakeToken_ and _yieldToken_) concept is kept where the global variables _numberOfEpochs_ and _epochDuration_ can be configured prior to the smart contract deployment.
    - Implementing the _pointsOf_ function to track the reward points proportional to the amount of _stakeToken_ staked by user. Note: reward points only awarded when _stakeToken_ are staked. In our case, we decided to reward points 2x of the amount of _stakeToken_ staked i.e 2 _stakeToken_ staked = 4 points.
    - Implementing the _transferPendingNFTrewards_ function to configure the exchange rate of reward points to NFT. In our case, for example, the common NFT equates to 1000 points. Can be configured by changing the global variable _NFT CONSTANT_.
4. :muscle: User Interface Considerations: <br />
    - Since User Interface is not the focal point of the project, we decided to go with a **simple user interface** that is able to show important features such as the "amount of tokens staked", "amount of tokens earned", "amount of points", "reward rate", "number of points correspond to which NFT".
    - Look at the diagram below for a better understanding: <br />
    ![This is an image](https://gateway.pinata.cloud/ipfs/QmNeznaBpTW14AJAbGk4CYZNxKjETTkjc6XjFwqKU1u17q)
    ![This is an image](https://gateway.pinata.cloud/ipfs/QmXH7MRXrGejYBm6a7sZBKzNHi9Mbc3XdrHaghyQWQwZiQ)

### Steps needed to accomplish those plans
1. Read up on the resources needed for this project: [ERC20 Token Standard](https://ethereum.org/en/developers/docs/standards/tokens/erc-20/), [ERC721 Token Standard](https://ethereum.org/en/developers/docs/standards/tokens/erc-721/), [How do Liquidity Pools work](https://academy.binance.com/en/articles/what-are-liquidity-pools-in-defi), [How to use Alchemy](https://www.alchemy.com/), [How to write and deploy NFT contract](https://ethereum.org/en/developers/tutorials/how-to-write-and-deploy-an-nft/), [How to integrate React with Solidity smart contracts](https://docs.alchemy.com/alchemy/tutorials/hello-world-smart-contract/part-4). :white_check_mark:
2. Practice writing smart contracts and familiarizing with the flow: [CryptoZombies Platform](https://cryptozombies.io/), [Development Workshop](https://github.com/BlockchainCourseNTU/hello-dapp/). :white_check_mark:
3. Using [Pendle-Core Repo and its smart contracts](https://github.com/pendle-finance/pendle-core) as a guide, to mock up the Liquidity Pool environment. :white_check_mark:
4. Getting Kovan ETH from the [Kovan Faucet](https://app.mycrypto.com/faucet) so that we can test, test and test again! :white_check_mark:

### Bonuses we added: 
:+1: :+1: :+1: 
- Implementing quadratic rewards i.e More _stakeToken_ staked = even more rewards.
- Besides linearly vesting, lock up period of 1 epoch is implemented so users will not manipulate the pool for the rewards i.e Users are forced to redeem rewards only after 1 epoch.
- Implementing lockup of reward points so users can only redeem NFTs after all the epochs have ended.
- Simulating the Liquidity Pool concept by minting 2 ERC20 tokens to the user so he/she can 'provide liquidity' to the pool in order to get his _stakeToken_.

### Usage of code 
#### Step 0: Prerequisite & Installation

#### Step 1

#### Step 2

