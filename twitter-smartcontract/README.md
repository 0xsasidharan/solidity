<h1 align="center" id="title">Decentralized Twitter Platform</h1>

<p id="description">This project is a decentralized blockchain-based Twitter-inspired platform built with Solidity and utilizing the Ethereum blockchain.</p>

  
  
<h2>🧐 Features</h2>

Here're some of the project's best features:

*   User Profiles: Each user can create a profile that includes a display name and bio.
*   Tweet Management: Users can post tweets with a limit of 280 characters per tweet. Tweets are timestamped and associated with the user’s Ethereum address.
*   Like/Unlike Feature: Users can like or unlike tweets from other users with each tweet maintaining an updated count of likes.
*   Access Control: An onlyRegistered modifier ensures that only registered users with valid profiles can interact with tweets.
*   Owner Control: The platform owner can adjust the maximum tweet length using the Ownable contract from OpenZeppelin for secure access control.
