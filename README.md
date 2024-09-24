## BasicNft => MainNft

**In this version of the foundry-nft-f23-v2 I changed the file names, names of various functions, variables, constructors, etc. i.e. BasicNft => MainNft**

- **In the NFT Section 5 i added the Metadata to the shiba-inu.png file using pinata.cloud**
- **Deployed to the Sepolia Testnet to Contract 0x6f6d3Ca0744aFd6447A8E8A0634Ff3599F7D939f**
- **All the foundry-nft-f23 NFT's can be viewed at https://testnets.opensea.io/0x00E8f7553a7971315Bb6Fab9A6Fa4B3F9242DdB1**


## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```
