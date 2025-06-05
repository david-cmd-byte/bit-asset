;; Title: BitAsset - Compliant Security Token Platform for Tokenized Real-World Assets
;;
;; Summary: A comprehensive smart contract for issuing, managing, and trading 
;; compliant security tokens representing real-world assets on Stacks Layer 2,
;; with full Bitcoin security inheritance.
;;
;; Description: BitAsset enables the tokenization of real-world assets with
;; built-in compliance, governance, and dividend distribution mechanisms. The platform
;; leverages Stacks Layer 2 for scalability while inheriting Bitcoin's security.
;; Features include KYC verification, fractional ownership, automated dividend
;; distribution, on-chain governance, and oracle price feeds.

;; Constants

;; Administrative
(define-constant contract-owner tx-sender)

;; Error codes
(define-constant err-owner-only (err u100))
(define-constant err-not-found (err u101))
(define-constant err-already-listed (err u102))
(define-constant err-invalid-amount (err u103))
(define-constant err-not-authorized (err u104))
(define-constant err-kyc-required (err u105))
(define-constant err-vote-exists (err u106))
(define-constant err-vote-ended (err u107))
(define-constant err-price-expired (err u108))
(define-constant err-invalid-uri (err u110))
(define-constant err-invalid-value (err u111))
(define-constant err-invalid-duration (err u112))
(define-constant err-invalid-kyc-level (err u113))
(define-constant err-invalid-expiry (err u114))
(define-constant err-invalid-votes (err u115))
(define-constant err-invalid-address (err u116))
(define-constant err-invalid-title (err u117))

;; Configuration limits
(define-constant MAX-ASSET-VALUE u1000000000000) ;; 1 trillion
(define-constant MIN-ASSET-VALUE u1000) ;; 1 thousand
(define-constant MAX-DURATION u144) ;; ~1 day in blocks
(define-constant MIN-DURATION u12) ;; ~1 hour in blocks
(define-constant MAX-KYC-LEVEL u5)
(define-constant MAX-EXPIRY u52560) ;; ~1 year in blocks

;; SFTs per asset
(define-constant tokens-per-asset u100000)

;; Data Maps

;; Asset registry - Stores information about each tokenized asset
(define-map assets
  { asset-id: uint }
  {
    owner: principal,
    metadata-uri: (string-ascii 256),
    asset-value: uint,
    is-locked: bool,
    creation-height: uint,
    last-price-update: uint,
    total-dividends: uint,
  }
)

;; Token ownership records - Tracks token balances for each user per asset
(define-map token-balances
  {
    owner: principal,
    asset-id: uint,
  }
  { balance: uint }
)

;; KYC compliance registry - Maintains KYC verification status for each user
(define-map kyc-status
  { address: principal }
  {
    is-approved: bool,
    level: uint,
    expiry: uint,
  }
)

;; Governance proposals - Stores proposal details and voting results
(define-map proposals
  { proposal-id: uint }
  {
    title: (string-ascii 256),
    asset-id: uint,
    start-height: uint,
    end-height: uint,
    executed: bool,
    votes-for: uint,
    votes-against: uint,
    minimum-votes: uint,
  }
)

;; Voting registry - Tracks votes cast by users for each proposal
(define-map votes
  {
    proposal-id: uint,
    voter: principal,
  }
  { vote-amount: uint }
)