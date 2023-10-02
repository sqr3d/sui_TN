# Threed Socialfi dApp

Threed is a socialfi dApp built on the Sui blockchain that allows users to create and join communities using token-gated NFTs.  
Users can also mint, list, and transfer NFTs within these communities.  

Experience the new social at https://threed.cc  
Follow us on X at https://twitter.com/threedapp

## Table of Contents

- [Getting Started](#getting-started)
- [Smart Contracts](#smart-contracts)
- [Testing](#testing)
- [Deployment](#deployment)
- [Contributing](#contributing)
- [License](#license)

## Getting Started

To get started with Threed on your local development environment, follow these steps:  

1. Clone this repository:
git clone [https://github.com/sqr3d/sui_TN]  
cd Threed


2. Install the required dependencies:  
npm install


3. Configure your Sui development environment, including Sui CLI and your local Sui node.  

4. Build and deploy the smart contracts (see [Deployment](#deployment)).  

5. Start the dApp locally:
npm start


## Smart Contracts

### Minting NFTs

The `mint_nft.move` file contains the smart contract code for minting NFTs within a community. Only the owner of the community can mint NFTs.

### Listing NFTs in a Community

The `get_community_nfts.move` file provides functionality to retrieve the NFTs owned by a specific community. It filters NFTs based on the community ID.

### Transferring NFTs

The `transfer_nft.move` file allows users to transfer ownership of NFTs to other users. Only the current owner of an NFT can initiate the transfer.

For detailed information on how these smart contracts work, refer to the individual contract files.

## Testing

You can run tests for the smart contracts using the Sui testing framework. Ensure that you have set up your development environment correctly before running tests.

To run tests, use the following command:

sui test  


## Deployment

To deploy the smart contracts to the Sui blockchain, use the Sui CLI or other deployment tools. Ensure that you have configured the deployment parameters and have the required tokens for gas fees.

Use the following commands to deploy the contracts:

sui deploy mint_nft.move  
sui deploy get_community_nfts.move  
sui deploy transfer_nft.move  


## Contributing

Contributions to Threed are welcome! Feel free to open issues or submit pull requests for any improvements or bug fixes.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.


