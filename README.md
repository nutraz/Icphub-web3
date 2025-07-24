# ICPHub DAO 🌐

> A decentralized hub for project collaboration, governance, and identity on the Internet Computer

[![License: GPL-3.0](https://img.shields.io/badge/License-GPL%203.0-blue.svg)](LICENSE)
[![ICP](https://img.shields.io/badge/Built%20on-Internet%20Computer-blue.svg)](https://internetcomputer.org/)
[![TypeScript](https://img.shields.io/badge/TypeScript-5.5.3-blue.svg)](https://typescript.org/)
[![React](https://img.shields.io/badge/React-18.3.1-blue.svg)](https://react.dev/)

---

## 🚀 Project Vision

**ICPHub DAO** is a cutting-edge, Web3-native platform that revolutionizes decentralized project management and community governance. Built specifically for the Internet Computer ecosystem, it provides a comprehensive framework for:

- **Decentralized Governance**: Community-driven decision making through transparent voting mechanisms
- **Project Collaboration**: Seamless coordination tools for distributed teams
- **Identity Management**: Secure, wallet-based authentication and reputation systems
- **Real World Asset (RWA) Integration**: Transparent tracking and management of physical assets
- **Energy Data Analytics**: Advanced insights for sustainable project development

Originally developed for the **World Computer Hacker League (WCHL) Hackathon**, ICPHub DAO serves as the foundational DAO frontend for innovative projects like **HeliosHash**, enabling fully on-chain, censorship-resistant operations.

---

## ✨ Key Features

### 🏛️ **Governance & Voting**
- Decentralized proposal system with transparent voting mechanisms
- Multi-signature support for critical decisions
- Token-weighted governance with delegation capabilities
- Real-time proposal tracking and community discussions

### 👥 **Contributor Management**
- Seamless onboarding workflows for new contributors
- Role-based access control and permission management
- Reputation scoring and contributor analytics
- Automated reward distribution systems

### 🌍 **Real World Asset (RWA) Tracking**
- Transparent asset registration and verification
- Immutable ownership records on-chain
- Asset performance monitoring and reporting
- Integration with IoT devices for real-time data

### 📊 **Analytics Dashboard**
- Comprehensive project metrics and KPIs
- Energy consumption and sustainability tracking
- Financial transparency with automated reporting
- Community engagement analytics

### 🔐 **Advanced Security**
- Internet Identity integration for seamless auth
- Multi-wallet support (Web3Modal + wagmi)
- Decentralized data storage with IPFS integration
- Chain fusion capabilities for cross-chain operations

### 🎨 **Modern User Experience**
- Responsive design with dark/light theme support
- Intuitive drag-and-drop interfaces
- Real-time updates and notifications
- Mobile-first approach with PWA capabilities

---

## 🛠 Tech Stack

| Layer | Technology | Version |
|-------|------------|----------|
| 🧠 **Framework** | React + Vite + TypeScript | 18.3.1 + 5.4.19 + 5.5.3 |
| 🎨 **UI Components** | shadcn/ui + Tailwind CSS + Radix UI | Latest |
| 🌐 **Routing** | React Router DOM | 7.6.3 |
| ⚡ **State Management** | TanStack React Query + Zod | 5.56.2 + 3.23.8 |
| 📝 **Forms** | React Hook Form | 7.53.0 |
| 💳 **Web3 Integration** | Web3Modal + wagmi + viem | Latest |
| 🔒 **Identity** | Internet Identity (ICP) | Latest |
| 🔌 **Backend** | Internet Computer (Motoko) | Latest |
| 📦 **Build Tools** | Vite + DFX | 5.4.19 + Latest |
| 🎭 **Animation** | Framer Motion | 12.23.5 |
| 📊 **Charts** | Recharts | 2.12.7 |
| 🌍 **Storage** | IPFS + Internet Computer | Latest |

---

## 📸 Screenshots & Demo

### 🏠 Homepage
![ICPHub DAO Homepage](docs/screenshots/homepage.png)
*Modern, responsive interface with particle background and intuitive navigation*

### 📊 Dashboard
![Analytics Dashboard](docs/screenshots/dashboard.png)
*Comprehensive analytics and project management interface*

### 🗳️ Governance
![Voting Interface](docs/screenshots/governance.png)
*Transparent proposal system with real-time voting*

### 📱 Mobile Experience
![Mobile Interface](docs/screenshots/mobile.png)
*Fully responsive design optimized for mobile devices*

#### 🌐 Live Demo
- **Frontend Demo**: [icphub-dao.ic0.app](https://icphub-dao.ic0.app) *(Coming Soon)*
- **Testnet**: Available on IC Testnet
- **Video Walkthrough**: [YouTube Demo](https://youtube.com/watch?v=demo) *(Coming Soon)*

---

## 🚀 Quick Start

### Prerequisites

Before you begin, ensure you have the following installed:

- **Node.js** (v18.0.0 or higher)
- **npm** or **bun** package manager
- **DFX** (Internet Computer SDK) - [Installation Guide](https://internetcomputer.org/docs/current/developer-docs/setup/install/)
- **Git** version control

### 📦 Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/nutrazz/ICPHub-web3.git
   cd ICPHub-web3
   ```

2. **Install dependencies**
   ```bash
   # Install root dependencies
   npm install
   
   # Install frontend dependencies
   cd src/Icp_hub_frontend
   npm install
   cd ../..
   ```

3. **Start the Internet Computer local network**
   ```bash
   dfx start --background
   ```

4. **Deploy canisters locally**
   ```bash
   dfx deploy
   ```

5. **Start the development server**
   ```bash
   npm run frontend:start
   ```

6. **Open your browser**
   Navigate to `http://localhost:5173` to see the application running!

### 🔧 Development Scripts

```bash
# Frontend development
npm run frontend:start    # Start frontend dev server
npm run frontend:build    # Build frontend for production

# Backend development
dfx generate             # Generate type declarations
dfx deploy               # Deploy canisters
dfx test                 # Run backend tests

# Utilities
dfx start --background   # Start IC local network
dfx stop                 # Stop IC local network
dfx canister status --all # Check canister status
```

---

## 🏗️ Project Architecture

```
ICPHub-web3/
├── 📁 src/
│   ├── 📁 Icp_hub_frontend/          # React frontend application
│   │   ├── 📁 src/
│   │   │   ├── 📁 components/        # Reusable UI components
│   │   │   ├── 📁 pages/             # Application routes/pages
│   │   │   ├── 📁 hooks/             # Custom React hooks
│   │   │   ├── 📁 lib/               # Utility functions
│   │   │   └── 📁 assets/            # Static assets
│   │   └── 📄 package.json
│   └── 📁 icp_hub_backend/           # Motoko backend canister
│       └── 📄 main.mo
├── 📁 canisters/                     # Additional canisters
│   ├── 📁 auth/                     # Authentication canister
│   ├── 📁 backend/                  # Main backend logic
│   ├── 📁 chain_fusion/             # Cross-chain integration
│   ├── 📁 ipfs/                     # IPFS storage canister
│   └── 📁 storage/                  # Data storage canister
├── 📁 tests/                        # Test files
├── 📄 dfx.json                      # DFX configuration
├── 📄 package.json                  # Root package configuration
└── 📄 README.md                     # This file
```

---

## 🤝 Contributing

We welcome contributions from the community! Whether you're fixing bugs, adding features, or improving documentation, your help is appreciated.

### How to Contribute

1. **Fork the repository**
2. **Create a feature branch** (`git checkout -b feature/amazing-feature`)
3. **Make your changes** following our coding standards
4. **Add tests** for new functionality
5. **Commit your changes** (`git commit -m 'Add some amazing feature'`)
6. **Push to the branch** (`git push origin feature/amazing-feature`)
7. **Open a Pull Request**

For detailed contribution guidelines, please see our [Contributing Guide](CONTRIBUTING.md).

### 🐛 Bug Reports

Found a bug? Please open an issue with:
- Clear description of the problem
- Steps to reproduce
- Expected vs actual behavior
- Screenshots (if applicable)
- Your environment details

---

## 📋 Roadmap

### 🎯 Phase 1: Foundation (Current)
- [x] Core UI/UX implementation
- [x] Basic canister architecture
- [x] Internet Identity integration
- [x] Responsive design system
- [ ] Complete governance features
- [ ] IPFS integration

### 🎯 Phase 2: Enhanced Features (Q2 2025)
- [ ] Advanced voting mechanisms
- [ ] Multi-signature wallet support
- [ ] Real-time notifications
- [ ] Mobile app (React Native)
- [ ] API documentation
- [ ] Performance optimizations

### 🎯 Phase 3: Ecosystem Integration (Q3 2025)
- [ ] Chain fusion capabilities
- [ ] Cross-chain asset bridging
- [ ] Third-party integrations
- [ ] Advanced analytics
- [ ] AI-powered insights
- [ ] Enterprise features

### 🎯 Phase 4: Scale & Sustainability (Q4 2025)
- [ ] Mainnet deployment
- [ ] Token economics implementation
- [ ] Community governance transition
- [ ] Sustainability metrics
- [ ] Global expansion
- [ ] Education & documentation

---

## 📄 License

This project is licensed under the **GNU General Public License v3.0** - see the [LICENSE](LICENSE) file for details.

### What this means:
- ✅ **Commercial use** - You can use this software commercially
- ✅ **Modification** - You can modify the software
- ✅ **Distribution** - You can distribute the software
- ✅ **Patent use** - Express grant of patent rights from contributors
- ❗ **Disclose source** - Source code must be made available when distributing
- ❗ **License and copyright notice** - Include license and copyright notice
- ❗ **Same license** - Derivative work must be under the same license

---

## 👥 Team & Contact

### 🎯 Core Team
- **Lead Developer**: [@nutrazz](https://github.com/nutrazz)
- **Frontend Architect**: ICPHub Team
- **Backend Engineer**: ICPHub Team
- **UI/UX Designer**: ICPHub Team

### 📞 Get in Touch

- **🐦 Twitter**: [@ICPHubDAO](https://twitter.com/ICPHubDAO)
- **💬 Discord**: [ICPHub Community](https://discord.gg/icphub)
- **📧 Email**: hello@icphub.org
- **🌐 Website**: [icphub.org](https://icphub.org)
- **📝 Blog**: [Medium @ICPHub](https://medium.com/@icphub)

### 🤝 Community

- **GitHub Discussions**: Share ideas and ask questions
- **Issues Tracker**: Report bugs and request features
- **Pull Requests**: Contribute code and improvements
- **Code of Conduct**: Please read our [Code of Conduct](CODE_OF_CONDUCT.md)

---

## 🙏 Acknowledgments

- **Internet Computer Foundation** for the amazing blockchain infrastructure
- **DFINITY** for the Internet Computer Protocol
- **World Computer Hacker League** for the hackathon opportunity
- **shadcn/ui** for the beautiful component library
- **React Team** for the robust frontend framework
- **All contributors** who help make this project better

---

## 🔄 Version History

- **v1.0.0** - Initial release with core features
- **v0.9.0** - Beta release for WCHL Hackathon
- **v0.8.0** - Alpha release with basic functionality

---

**⭐ If you find this project useful, please give it a star!**

*Built with ❤️ for the Internet Computer ecosystem*

