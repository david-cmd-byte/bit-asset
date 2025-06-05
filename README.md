# BitAsset - Compliant Security Token Platform

## Overview

BitAsset is a comprehensive smart contract platform for issuing, managing, and trading compliant security tokens that represent real-world assets on Stacks Layer 2. The platform leverages Bitcoin's security through Stacks while enabling scalable tokenization of physical and digital assets with built-in compliance mechanisms.

## Key Features

### 🏗️ **Asset Tokenization**

- Tokenize real-world assets into fractional ownership tokens
- Each asset is divided into 100,000 tokens for granular ownership
- Secure metadata storage with IPFS integration
- Asset value tracking with configurable limits

### 🔐 **Compliance & KYC**

- Built-in KYC verification system with multiple levels
- Time-based compliance expiry management
- Regulatory-compliant token transfers
- Anti-money laundering (AML) compliance

### 💰 **Dividend Distribution**

- Automated dividend calculation and distribution
- Proportional dividend allocation based on token ownership
- Claimable dividend system with historical tracking
- Real-time dividend accumulation

### 🗳️ **On-Chain Governance**

- Token-weighted voting system
- Proposal creation for asset management decisions
- Configurable voting periods and quorum requirements
- Transparent governance execution

### 📊 **Oracle Price Feeds**

- External price data integration
- Real-time asset valuation updates
- Oracle-based price discovery
- Timestamp-based price validity

## Architecture

### Smart Contract Structure

```
BitAsset Platform
├── Core Components
│   ├── Asset Registry
│   ├── Token Management
│   ├── KYC Compliance
│   └── Governance System
├── Data Storage
│   ├── Asset Metadata
│   ├── Token Balances
│   ├── Compliance Records
│   └── Voting History
└── External Integrations
    ├── Oracle Price Feeds
    ├── IPFS Metadata
    └── Bitcoin Security Layer
```

### Data Models

#### Assets

- **Asset ID**: Unique identifier
- **Owner**: Asset controller
- **Metadata URI**: IPFS link to asset details
- **Asset Value**: Current valuation in microSTX
- **Lock Status**: Transfer restriction flag
- **Creation Height**: Block height when created
- **Dividend Tracking**: Total accumulated dividends

#### Token Balances

- **Owner**: Token holder address
- **Asset ID**: Associated asset
- **Balance**: Number of tokens owned

#### KYC Status

- **Address**: User's principal address
- **Approval Status**: KYC verification state
- **Level**: Compliance tier (1-5)
- **Expiry**: KYC validity period

#### Governance Proposals

- **Proposal ID**: Unique identifier
- **Title**: Proposal description
- **Asset ID**: Target asset
- **Voting Period**: Start and end blocks
- **Vote Counts**: For/against tallies
- **Execution Status**: Implementation flag

## Technical Specifications

### Configuration Limits

- **Maximum Asset Value**: 1 trillion microSTX
- **Minimum Asset Value**: 1,000 microSTX
- **Tokens Per Asset**: 100,000 fixed supply
- **Maximum Voting Duration**: 144 blocks (~1 day)
- **Minimum Voting Duration**: 12 blocks (~1 hour)
- **Maximum KYC Level**: 5
- **KYC Expiry Limit**: 52,560 blocks (~1 year)

### Error Codes

- `100`: Owner-only function
- `101`: Resource not found
- `102`: Already listed
- `103`: Invalid amount
- `104`: Not authorized
- `105`: KYC required
- `106`: Vote already exists
- `107`: Voting period ended
- `108`: Price data expired
- `110-117`: Various validation errors

## Core Functions

### Asset Management

#### `register-asset`

```clarity
(register-asset metadata-uri asset-value)
```

Registers a new tokenized asset with metadata and initial valuation.

**Parameters:**

- `metadata-uri`: IPFS URI containing asset details
- `asset-value`: Initial asset value in microSTX

**Returns:** Asset ID upon successful registration

### Dividend Operations

#### `claim-dividends`

```clarity
(claim-dividends asset-id)
```

Allows token holders to claim their proportional share of accumulated dividends.

**Parameters:**

- `asset-id`: Target asset identifier

**Returns:** Success confirmation

### Governance Functions

#### `create-proposal`

```clarity
(create-proposal asset-id title duration minimum-votes)
```

Creates a new governance proposal for asset management decisions.

**Parameters:**

- `asset-id`: Target asset
- `title`: Proposal description
- `duration`: Voting period in blocks
- `minimum-votes`: Quorum requirement

#### `vote`

```clarity
(vote proposal-id vote-for amount)
```

Casts a weighted vote on a governance proposal.

**Parameters:**

- `proposal-id`: Target proposal
- `vote-for`: Boolean (true for yes, false for no)
- `amount`: Number of tokens to vote with

### Read-Only Functions

#### Asset Information

- `get-asset-info`: Retrieve asset details
- `get-balance`: Check token balance
- `get-price-feed`: Access oracle price data

#### Governance Data

- `get-proposal`: Fetch proposal details
- `get-vote`: Check user's vote status

#### Dividend Tracking

- `get-last-claim`: View last dividend claim

## Security Features

### Input Validation

- Comprehensive parameter validation for all functions
- Range checks for numerical inputs
- String length validation for metadata
- Address verification for principals

### Access Control

- Owner-only administrative functions
- KYC-gated token operations
- Token-weighted governance participation
- Time-locked proposal execution

### Data Integrity

- Immutable asset registration
- Transparent voting records
- Auditable dividend distributions
- Tamper-proof compliance tracking

## Deployment Requirements

### Stacks Blockchain

- Stacks Layer 2 network access
- STX tokens for transaction fees
- Clarinet development environment

### External Dependencies

- IPFS network for metadata storage
- Oracle services for price feeds
- KYC provider integration

## Use Cases

### Real Estate Tokenization

- Fractional property ownership
- Rental income distribution
- Property management voting

### Investment Funds

- Fund share tokenization
- Profit distribution automation
- Investment decision governance

### Art & Collectibles

- High-value asset fractionalization
- Royalty distribution
- Authenticity verification

### Infrastructure Assets

- Utility token creation
- Revenue sharing mechanisms
- Operational governance

## Compliance Considerations

### Regulatory Framework

- Securities law compliance
- KYC/AML requirements
- Cross-border regulations
- Tax reporting obligations

### Risk Management

- Asset custody security
- Price oracle reliability
- Smart contract auditing
- Governance attack prevention

## Development Status

This smart contract represents a foundational implementation of a security token platform. Additional features and optimizations may be required for production deployment, including:

- Enhanced oracle integration
- Advanced compliance features
- Multi-signature governance
- Emergency pause mechanisms
- Upgrade proxy patterns

## License

This project is provided as-is for educational and development purposes. Please ensure compliance with applicable securities regulations before deployment.
