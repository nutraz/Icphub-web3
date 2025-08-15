# OpenKeyHub Tokenomics & System Design

## 1. Introduction

This document outlines the proposed tokenomics, bounty system, and staking model for OpenKeyHub (OKH). The goal is to create a self-sustaining, decentralized ecosystem that rewards contributors, aligns incentives, and fosters community governance. The native utility and governance token for the platform is the **OpenKey Token (OKT)**.

---

## 2. The OpenKey Token (OKT)

### 2.1. Token Details

- **Token Name:** OpenKey Token
- **Token Symbol:** OKT
- **Total Supply:** 1,000,000,000 OKT (1 Billion)
- **Standard:** To be determined (e.g., ICRC-1 on the Internet Computer).

### 2.2. Token Distribution

The total supply of 1 billion OKT will be minted at genesis and allocated as follows:

| Category                  | Percentage | Amount (OKT)  | Vesting / Lock-up Details                                                                                             |
| ------------------------- | :--------: | :-----------: | --------------------------------------------------------------------------------------------------------------------- |
| **Community Treasury (DAO)** |   **50%**    | 500,000,000 | Governed by OKT holders. Used for grants, ecosystem initiatives, and long-term development.                          |
| **Core Contributors & Team** |   **20%**    | 200,000,000 | 4-year vesting with a 1-year cliff. To reward the initial team and core developers for their long-term commitment. |
| **Ecosystem & Liquidity Fund** |   **25%**    | 250,000,000 | Used for providing liquidity on DEXs, funding partnerships, marketing, and strategic growth initiatives.            |
| **Airdrop to Early Adopters** |    **5%**    | 50,000,000  | Airdropped to early contributors, users of other open-source web3 projects, and hackathon participants to bootstrap the community. |

### 2.3. Token Utility

OKT is deeply integrated into the OpenKeyHub platform with the following utilities:

1.  **Governance:**
    - OKT holders can vote on governance proposals to direct the future of the platform.
    - Proposals can include changing platform parameters, funding projects from the treasury, and electing council members.

2.  **Bounties:**
    - OKT is the primary currency for creating and funding bounties on repository issues, encouraging contributions to open-source projects.

3.  **Staking:**
    - Users can stake OKT to earn rewards from platform revenue and to gain increased governance power.

4.  **Platform Access & Fees:**
    - While public repositories will be free, certain premium features (e.g., creating private repositories, using advanced CI/CD, large file storage via IPFS) may require payment or holding a minimum amount of OKT. A portion of these fees will be burned or sent to the community treasury.

---

## 3. Bounty System

The bounty system is designed to directly reward developers for their contributions.

### 3.1. Workflow

1.  **Bounty Creation:** A user (or project owner) can attach a bounty in OKT to any open issue in a repository. The OKT is transferred from their wallet into an escrow account managed by the `bounty_canister`.
2.  **Contribution:** A developer can start working on an issue with a bounty. They submit their solution via a standard pull request (PR).
3.  **Claiming the Bounty:**
    - When the repository owner merges the PR, the bounty is automatically released from the escrow to the developer's principal.
    - The PR merging process will include a field to confirm the bounty release.

### 3.2. Future Considerations

- **Multi-Contributor Bounties:** For complex issues, a mechanism could be developed to split the bounty among multiple contributors, as specified by the repository owner during the PR merge.
- **Dispute Resolution:** For a more advanced system, a decentralized arbitration service could be introduced to resolve disputes over bounty claims, governed by staked OKT holders.

---

## 4. Staking Model

The staking model is designed to reward long-term commitment to the OpenKeyHub ecosystem.

### 4.1. Purpose of Staking

- **Yield Generation:** Stakers receive rewards from a portion of the platform's revenue and/or from the Ecosystem Fund.
- **Enhanced Governance:** Staking OKT grants users voting power (vOKT), which is used to vote on governance proposals.

### 4.2. Staking Mechanism

- **Lock-up Periods:** Users can stake their OKT for various lock-up periods (e.g., 1 month, 6 months, 1 year, 4 years).
- **Voting Power Multiplier:** Longer lock-up periods grant a higher multiplier on voting power. For example:
  - 1 month lock-up: 1 OKT = 1 vOKT
  - 1 year lock-up: 1 OKT = 2 vOKT
  - 4 year lock-up: 1 OKT = 5 vOKT
- **Rewards:** Rewards are distributed proportionally to the amount of vOKT each user has.

### 4.3. Reward Distribution

- A portion of the platform's fees (e.g., from private repos) will be periodically distributed to stakers.
- Initially, rewards can also be subsidized by the Ecosystem Fund to incentivize early stakers.
