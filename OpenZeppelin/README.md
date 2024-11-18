<h1 align="center" id="title">NFT Smart Contracts</h1>

<p id="description">A collection of NFT smart contracts built using OpenZeppelin's standards and Solidity.</p>

<h2>🧐 Features</h2>

### **SimpleContractERC721**

Here're some of the best features of the ERC721 contract:

*   **Minting Options**: 
    - Users can mint NFTs through public or allowlist mint functions with dynamic pricing.
*   **Allowlist Management**: 
    - The owner can add specific addresses to an allowlist for discounted minting.
*   **Supply Control**: 
    - Maximum NFT supply is capped at 100 to ensure rarity.
*   **Pause Functionality**: 
    - The contract owner can pause or unpause the minting process to enhance security.
*   **Fund Withdrawal**: 
    - The owner can securely withdraw funds to a specified address.
*   **Base URI**: 
    - A predefined base URI supports metadata storage for all minted tokens.
*   **Standards Compliance**: 
    - Fully compatible with OpenZeppelin's ERC721, including `ERC721Enumerable` and `ERC721Pausable`.

---

### **SimpleContractERC1155**

Here're some of the best features of the ERC1155 contract:

*   **Minting Options**: 
    - Users can mint NFTs through **allowlist** or **public mint** functions with dynamic pricing.
    - Minting is subject to wallet limits and token supply constraints.
*   **Allowlist Management**: 
    - The owner can add specific addresses to an allowlist for discounted minting.
    - Flexible control over minting windows for public and private sales.
*   **Supply Control**: 
    - Maximum supply per token ID is enforced for scarcity.
    - The maximum number of unique token IDs is capped.
*   **Pause Functionality**: 
    - The owner can pause or unpause transfers and minting to prevent unauthorized activity.
*   **Fund Withdrawal**: 
    - Funds can be securely withdrawn or distributed among payees using OpenZeppelin’s `PaymentSplitter`.
*   **Batch Minting**: 
    - The owner can mint multiple token IDs in a single transaction.
*   **Custom URI Support**: 
    - A dynamic base URI allows integration with IPFS or decentralized storage.
*   **Standards Compliance**: 
    - Fully compatible with OpenZeppelin's ERC1155, including `ERC1155Pausable` and `ERC1155Supply` extensions.
*   **Wallet Purchase Limits**: 
    - Caps on the number of tokens a wallet can purchase ensure fairness.
*   **Payment Splitting**: 
    - Revenue is distributed automatically among multiple payees with pre-configured shares.

