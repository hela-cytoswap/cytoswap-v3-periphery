// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity =0.7.6;

import '@cytoswap/v3-core/contracts/interfaces/ICytoswapV3Factory.sol';
import '@cytoswap/v3-core/contracts/interfaces/ICytoswapV3Pool.sol';

import './PeripheryImmutableState.sol';
import '../interfaces/IPoolInitializer.sol';

/// @title Creates and initializes V3 Pools
abstract contract PoolInitializer is IPoolInitializer, PeripheryImmutableState {
    /// @inheritdoc IPoolInitializer
    function createAndInitializePoolIfNecessary(
        address token0,
        address token1,
        uint24 fee,
        uint160 sqrtPriceX96
    ) external payable override returns (address pool) {
        return _createAndInitializePoolIfNecessary(token0, token1, fee, sqrtPriceX96, '');
    }

    function createAndInitializePoolIfNecessaryPermit(
        address token0,
        address token1,
        uint24 fee,
        uint160 sqrtPriceX96,
        bytes calldata data
    ) external payable returns (address pool) {
        return _createAndInitializePoolIfNecessary(token0, token1, fee, sqrtPriceX96, data);
    }

    function _createAndInitializePoolIfNecessary(
        address token0,
        address token1,
        uint24 fee,
        uint160 sqrtPriceX96,
        bytes memory data
    ) internal virtual returns (address pool) {

        require(token0 < token1);
        pool = ICytoswapV3Factory(factory).getPool(token0, token1, fee);

        if (pool == address(0)) {
            pool = ICytoswapV3Factory(factory).createPool(token0, token1, fee);
            _beforeInitPool(data);
            ICytoswapV3Pool(pool).initialize(sqrtPriceX96);
        } else {
            (uint160 sqrtPriceX96Existing, , , , , , ) = ICytoswapV3Pool(pool).slot0();
            if (sqrtPriceX96Existing == 0) {
                _beforeInitPool(data);
                ICytoswapV3Pool(pool).initialize(sqrtPriceX96);
            }
        }
    }

    function _beforeInitPool(bytes memory data) internal virtual {

    }
}
