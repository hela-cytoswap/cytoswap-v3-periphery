# Cytoswap V3 Periphery

This repository contains the periphery smart contracts for the Cytoswap V3 Protocol.
For the lower level core contracts, see the [cytoswap-v3-core](https://gitlab.snapresearch.io/swapnity/cytoswap-sdk-core)
repository.

## Bug bounty

This repository is subject to the Cytoswap V3 bug bounty program,
per the terms defined [here](./bug-bounty.md).

## Local deployment

In order to deploy this code to a local testnet, you should install the npm package
`@cytoswap/v3-periphery`
and import bytecode imported from artifacts located at
`@cytoswap/v3-periphery/artifacts/contracts/*/*.json`.
For example:

```typescript
import {
  abi as SWAP_ROUTER_ABI,
  bytecode as SWAP_ROUTER_BYTECODE,
} from '@cytoswap/v3-periphery/artifacts/contracts/SwapRouter.sol/SwapRouter.json'

// deploy the bytecode
```

This will ensure that you are testing against the same bytecode that is deployed to
mainnet and public testnets, and all Cytoswap code will correctly interoperate with
your local deployment.

## Using solidity interfaces

The Cytoswap v3 periphery interfaces are available for import into solidity smart contracts
via the npm artifact `@cytoswap/v3-periphery`, e.g.:

```solidity
import '@cytoswap/v3-periphery/contracts/interfaces/ISwapRouter.sol';

contract MyContract {
  ISwapRouter router;

  function doSomethingWithSwapRouter() {
    // router.exactInput(...);
  }
}

```
