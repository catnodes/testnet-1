# Testnet & Mainnet Node Guides

Collection of step-by-step guides for running blockchain validator and full nodes. Each guide covers hardware requirements, installation, configuration, and maintenance.

## Testnet

| Network | Type |
|---------|------|
| [Gensyn AI](testnet/gensyn-ai.md) | Compute |
| [Initia](testnet/initia/) | Cosmos (validator, oracle, snapshot) |
| [Sui](testnet/sui/) | Move (auto/manual install) |
| [Aptos](testnet/aptos/) | Move (NHC, import) |
| [Aleo](testnet/aleo/) | ZK prover |
| [Neutron](testnet/neutron.md) | Cosmos |
| [Obol](testnet/obol.md) | DVT (distributed validator) |
| [Elixir](testnet/elixir/) | DeFi infra |
| [Chainflip](testnet/chainflip.md) | Cross-chain |
| [Bundlr](testnet/bundlr.md) | Storage |
| [Ironfish](testnet/ironfish.md) | Privacy |
| [Madara](testnet/madara.md) | Starknet sequencer |
| [Airchain](testnet/airchain-create-an-evm-zk-rollup-for-avail-da/) | ZK Rollup (Avail DA) |
| [AlignedLayer](testnet/alignedlayer/) | ZK verification |
| [Nibiru](testnet/nibiru/) | Cosmos (oracle) |
| [Nulink](testnet/nulink.md) | Privacy infra |
| [Avail](testnet/avail.md) | Data availability |
| [Infinity](testnet/infinity.md) | — |

## Mainnet

| Network | Type |
|---------|------|
| [Axone](mainnet/axone/) | Cosmos (API, sync, cheatsheet) |

## Supporting

Utilities and common references for node operation.

| Guide | Description |
|-------|-------------|
| [Install GO](supporting/utils.md) | Go version management |
| [Schedule Rollback](supporting/schedule-rollback.md) | Automated rollback setup |
| [Multisender](supporting/multisender.md) | Batch token sends |
| [Common Commands](supporting/usefull_commands.md) | Validator CLI cheatsheet |

## Usage

Each guide is self-contained. Pick a network, follow the steps on a fresh Ubuntu 20.04+ VPS. Guides assume root access and a basic Linux environment.

## Structure

```
testnet/       per-network testnet guides
mainnet/       production validator setups
supporting/    shared tooling & references
```
