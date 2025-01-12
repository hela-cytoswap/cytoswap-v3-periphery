// SPDX-License-Identifier: GPL-2.0-or-later
import '@cytoswap/v3-core/contracts/interfaces/ICytoswapV3Pool.sol';

pragma solidity >=0.6.0;

import '../libraries/PoolTicksCounter.sol';

contract PoolTicksCounterTest {
    using PoolTicksCounter for ICytoswapV3Pool;

    function countInitializedTicksCrossed(
        ICytoswapV3Pool pool,
        int24 tickBefore,
        int24 tickAfter
    ) external view returns (uint32 initializedTicksCrossed) {
        return pool.countInitializedTicksCrossed(tickBefore, tickAfter);
    }
}
