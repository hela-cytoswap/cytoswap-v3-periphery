import { abi as POOL_ABI } from '@cytoswap/v3-core/artifacts/contracts/CytoswapV3Pool.sol/CytoswapV3Pool.json'
import { Contract, Wallet } from 'ethers'
import { ICytoswapV3Pool } from '../../typechain'

export default function poolAtAddress(address: string, wallet: Wallet): ICytoswapV3Pool {
  return new Contract(address, POOL_ABI, wallet) as ICytoswapV3Pool
}
