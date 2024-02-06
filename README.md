# Foundry Fund Me Project

## Table of Contents

- [Getting Started](#getting-started)
  - [Requirements](#requirements)
  - [Quickstart](#quickstart)
- [Usage](#usage)
  - [Deploy](#deploy)
  - [Testing](#testing)
    - [Test Coverage](#test-coverage)
  - [Scripts](#scripts)
    - [Withdraw](#withdraw)
    - [Estimate Gas](#estimate-gas)
- [Formatting](#formatting)
- [Thank You!](#thank-you)

## Getting Started

### Requirements

- [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
  - Verify installation by running `git --version`.
- [foundry](https://getfoundry.sh/)
  - Verify installation by running `forge --version`.

### Quickstart

Clone the repository and build the project:
```
git clone
cd foundry-fund-me-f23
forge build
```

## Usage

### Deploy

Deploy the contract using the following command:

```
forge script script/DeployFundMe.s.sol
```

### Testing

Run tests with the following commands:

```
forge test
```

Or run specific tests by matching a regex pattern:

```
forge test --match-test testFunctionName
```
Or run tests against a fork URL:

```
forge test --fork-url $SEPOLIA_RPC_URL
```

#### Test Coverage

Check test coverage with:

```
forge coverage
```
### Deployment to a Testnet or Mainnet

1. Setup environment variables

You'll want to set your `SEPOLIA_RPC_URL` and `PRIVATE_KEY` as environment variables. You can add them to a `.env` file, similar to what you see in `.env.example`.

- `PRIVATE_KEY`: The private key of your account (like from [Metamask](https://metamask.io/)). **NOTE:** FOR DEVELOPMENT, PLEASE USE A KEY THAT DOESN'T HAVE ANY REAL FUNDS ASSOCIATED WITH IT.
  - You can [learn how to export it here](https://metamask.zendesk.com/hc/en-us/articles/360015289632-How-to-Export-an-Account-Private-Key).
- `SEPOLIA_RPC_URL`: This is the URL of the Sepolia testnet node you're working with. You can get setup with one for free from [Alchemy](https://alchemy.com/?r=e170b3cbc251b580).

Optionally, add your `ETHERSCAN_API_KEY` if you want to verify your contract on [Etherscan](https://etherscan.io/).

1. Get testnet ETH

Head over to [faucets.chain.link](https://faucets.chain.link/) and get some testnet ETH. You should see the ETH show up in your Metamask.

3. Deploy

```
forge script script/DeployFundMe.s.sol --rpc-url $SEPOLIA_RPC_URL --private-key $PRIVATE_KEY --broadcast --verify --etherscan-api-key $ETHERSCAN_API_KEY
```

## Scripts

After deploying to a testnet or local net, you can run the scripts.

Using cast deployed locally example:

```
cast send <FUNDME_CONTRACT_ADDRESS> "fund()" --value 0.1ether --private-key <PRIVATE_KEY>
```

or deploy it to test nest/mainnet

```
forge script script/Interactions.s.sol --rpc-url $SEPOLIA_RPC_URL --private-key $PRIVATE_KEY --broadcast
```

### Withdraw

```
cast send <FUNDME_CONTRACT_ADDRESS> "withdraw()" --private-key <PRIVATE_KEY>
```
## Estimate Gas

You can estimate how much gas things cost by running:

```
forge snapshot
```

And you'll see an output file called `.gas-snapshot`.

## Formatting

To run code formatting:

```
forge fmt
```

## Thank You

If you have any recommendation feel free to raise an issue.
