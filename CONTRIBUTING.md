# Contributing to ICPHub DAO 🤝

Thank you for your interest in contributing to **ICPHub DAO**! This document provides guidelines and information on how to contribute to our project. We welcome contributions from developers, designers, writers, and community members of all skill levels.

---

## 🌟 Ways to Contribute

### 🐛 **Bug Reports**
- Report bugs through GitHub Issues
- Provide detailed reproduction steps
- Include screenshots and error messages
- Specify your environment details

### ✨ **Feature Requests**
- Suggest new features via GitHub Issues
- Explain the use case and expected behavior
- Discuss implementation approaches
- Consider backwards compatibility

### 💻 **Code Contributions**
- Fix bugs and implement new features
- Improve performance and code quality
- Add tests and documentation
- Refactor and optimize existing code

### 📚 **Documentation**
- Improve existing documentation
- Write tutorials and guides
- Create example projects
- Translate documentation

### 🎨 **Design & UX**
- Improve user interface and experience
- Create mockups and prototypes
- Design icons and graphics
- Conduct usability testing

---

## 🚀 Getting Started

### Prerequisites

Before contributing, ensure you have:

- **Node.js** (v18.0.0 or higher)
- **npm** or **bun** package manager
- **DFX** (Internet Computer SDK)
- **Git** version control
- Basic knowledge of **React**, **TypeScript**, and **Motoko**

### 🔧 Development Setup

1. **Fork the repository**
   ```bash
   # Fork the repo on GitHub, then clone your fork
   git clone https://github.com/YOUR_USERNAME/ICPHub-web3.git
   cd ICPHub-web3
   ```

2. **Add the upstream remote**
   ```bash
   git remote add upstream https://github.com/nutrazz/ICPHub-web3.git
   ```

3. **Install dependencies**
   ```bash
   # Install root dependencies
   npm install
   
   # Install frontend dependencies
   cd src/Icp_hub_frontend
   npm install
   cd ../..
   ```

4. **Set up the development environment**
   ```bash
   # Start the Internet Computer local network
   dfx start --background
   
   # Deploy canisters locally
   dfx deploy
   ```

5. **Start the development server**
   ```bash
   npm run frontend:start
   ```

---

## 📝 Contribution Workflow

### 1. **Create a Feature Branch**
```bash
# Update your main branch
git checkout main
git pull upstream main

# Create a new feature branch
git checkout -b feature/your-feature-name
# or for bug fixes
git checkout -b fix/bug-description
```

### 2. **Make Your Changes**
- Write clean, readable code
- Follow our coding standards (see below)
- Add tests for new functionality
- Update documentation as needed
- Commit changes with clear messages

### 3. **Test Your Changes**
```bash
# Run frontend tests
cd src/Icp_hub_frontend
npm run test

# Run backend tests
dfx test

# Check linting
npm run lint

# Build to ensure everything compiles
npm run frontend:build
```

### 4. **Submit a Pull Request**
```bash
# Push your branch to your fork
git push origin feature/your-feature-name

# Create a Pull Request on GitHub
# Fill out the PR template with detailed information
```

---

## 💻 Coding Standards

### **TypeScript/React Frontend**

#### Code Style
- Use **TypeScript** for all new code
- Follow **ESLint** and **Prettier** configurations
- Use **functional components** with hooks
- Prefer **arrow functions** for inline functions
- Use **meaningful variable names**

#### Component Structure
```typescript
// Good component structure
import React from 'react';
import { Button } from '@/components/ui/button';
import { useQuery } from '@tanstack/react-query';

interface ComponentProps {
  title: string;
  onAction: () => void;
}

export const MyComponent: React.FC<ComponentProps> = ({ title, onAction }) => {
  const { data, isLoading } = useQuery({
    queryKey: ['data'],
    queryFn: fetchData,
  });

  if (isLoading) return <div>Loading...</div>;

  return (
    <div className="flex flex-col gap-4">
      <h2 className="text-2xl font-bold">{title}</h2>
      <Button onClick={onAction}>
        Take Action
      </Button>
    </div>
  );
};
```

#### Styling Guidelines
- Use **Tailwind CSS** classes
- Follow **shadcn/ui** component patterns
- Ensure **responsive design** (mobile-first)
- Support **dark/light themes**
- Use **consistent spacing** (4px grid system)

### **Motoko Backend**

#### Code Style
- Use **camelCase** for variables and functions
- Use **PascalCase** for types and modules
- Add **comprehensive documentation**
- Handle **error cases** properly
- Use **stable memory** for persistent data

#### Example Structure
```motoko
import Debug "mo:base/Debug";
import Result "mo:base/Result";
import HashMap "mo:base/HashMap";

actor ICPHubDAO {
  // Stable storage
  private stable var nextProposalId : Nat = 0;
  
  // Types
  public type Proposal = {
    id: Nat;
    title: Text;
    description: Text;
    votes: Nat;
  };
  
  // Public methods
  public func createProposal(title: Text, description: Text) : async Result.Result<Proposal, Text> {
    // Implementation with proper error handling
  };
}
```

---

## 🧪 Testing Guidelines

### **Frontend Testing**
```typescript
// Component tests with React Testing Library
import { render, screen, fireEvent } from '@testing-library/react';
import { MyComponent } from './MyComponent';

describe('MyComponent', () => {
  it('renders with title', () => {
    render(<MyComponent title="Test Title" onAction={() => {}} />);
    expect(screen.getByText('Test Title')).toBeInTheDocument();
  });

  it('calls onAction when button is clicked', () => {
    const mockAction = jest.fn();
    render(<MyComponent title="Test" onAction={mockAction} />);
    
    fireEvent.click(screen.getByText('Take Action'));
    expect(mockAction).toHaveBeenCalled();
  });
});
```

### **Backend Testing**
```motoko
// backend.test.mo
import Debug "mo:base/Debug";
import { test; suite } = "mo:test/async";

await suite("Proposal Tests", func() : async () {
  await test("should create proposal", func() : async () {
    let dao = await ICPHubDAO.ICPHubDAO();
    let result = await dao.createProposal("Test Proposal", "Description");
    // Assert result is Ok
  });
});
```

---

## 📖 Documentation Standards

### **Code Documentation**
- Add **JSDoc comments** for TypeScript functions
- Document **complex logic** and **business rules**
- Include **usage examples** in documentation
- Keep documentation **up-to-date** with code changes

### **README Updates**
- Update relevant sections when adding features
- Include **screenshots** for UI changes
- Update **installation instructions** if needed
- Add new **dependencies** to tech stack table

---

## 🔍 Code Review Process

### **What We Look For**
- **Functionality**: Does the code work as expected?
- **Code Quality**: Is it readable, maintainable, and efficient?
- **Testing**: Are there adequate tests?
- **Documentation**: Is it properly documented?
- **Consistency**: Does it follow project conventions?

### **Review Timeline**
- **Initial Response**: Within 24-48 hours
- **Detailed Review**: Within 3-5 business days
- **Follow-up**: Ongoing until merge or closure

### **Review Checklist**
- [ ] Code follows style guidelines
- [ ] Tests pass and cover new functionality
- [ ] Documentation is updated
- [ ] No breaking changes (or properly communicated)
- [ ] Performance impact is acceptable
- [ ] Security considerations are addressed

---

## 🐛 Issue Guidelines

### **Bug Reports**
Use the bug report template and include:
- **Clear title** and **description**
- **Steps to reproduce**
- **Expected vs actual behavior**
- **Screenshots** or **error messages**
- **Environment details** (OS, browser, versions)

### **Feature Requests**
Use the feature request template and include:
- **Problem statement** and **use case**
- **Proposed solution**
- **Alternative approaches** considered
- **Additional context** or **mockups**

---

## 🏷️ Commit Message Guidelines

We follow the **Conventional Commits** specification:

```bash
# Format
<type>[optional scope]: <description>

# Examples
feat: add voting mechanism for proposals
fix: resolve authentication timeout issue
docs: update installation instructions
style: improve mobile responsiveness
refactor: optimize canister storage usage
test: add unit tests for governance module
```

### **Types**
- **feat**: New feature
- **fix**: Bug fix
- **docs**: Documentation changes
- **style**: UI/styling changes
- **refactor**: Code refactoring
- **test**: Adding or updating tests
- **chore**: Build process or auxiliary tool changes

---

## 🤝 Community Guidelines

### **Be Respectful**
- Use **inclusive language**
- Be **constructive** in feedback
- **Help others** learn and grow
- **Celebrate contributions** of all sizes

### **Communication Channels**
- **GitHub Issues**: Bug reports and feature requests
- **GitHub Discussions**: General questions and ideas
- **Discord**: Real-time community chat
- **Pull Requests**: Code review discussions

### **Getting Help**
- Check **existing issues** and **documentation** first
- Use **clear, descriptive titles** for issues
- Provide **context** and **details**
- Be **patient** while waiting for responses

---

## 🎯 Priority Areas

We especially welcome contributions in these areas:

### **High Priority**
- **Governance features** implementation
- **IPFS integration** for decentralized storage
- **Mobile responsiveness** improvements
- **Test coverage** expansion
- **Performance optimizations**

### **Medium Priority**
- **Chain fusion** capabilities
- **Advanced analytics** features
- **Multi-language support**
- **Accessibility improvements**
- **API documentation**

### **Low Priority**
- **UI polish** and **animations**
- **Additional themes**
- **Developer tooling**
- **Example projects**
- **Blog posts** and **tutorials**

---

## 🏆 Recognition

We appreciate all contributions! Contributors will be:

- **Listed** in our **contributors section**
- **Mentioned** in **release notes**
- **Featured** on our **community channels**
- **Invited** to **special events** and **discussions**

### **Contributor Levels**
- **🌱 First-time contributors**: Welcome package and mentorship
- **🚀 Regular contributors**: Project access and decision input
- **⭐ Core contributors**: Maintainer privileges and recognition

---

## 📞 Contact Information

Need help or have questions? Reach out:

- **GitHub Issues**: For bugs and feature requests
- **GitHub Discussions**: For general questions
- **Discord**: [ICPHub Community](https://discord.gg/icphub)
- **Email**: contributors@icphub.org
- **Twitter**: [@ICPHubDAO](https://twitter.com/ICPHubDAO)

---

## 📋 Pull Request Template

When creating a PR, please use this template:

```markdown
## Description
Brief description of changes

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Breaking change
- [ ] Documentation update

## Testing
- [ ] Tests pass locally
- [ ] Added new tests
- [ ] Manual testing completed

## Checklist
- [ ] Code follows style guidelines
- [ ] Self-review completed
- [ ] Documentation updated
- [ ] Breaking changes documented
```

---

**Thank you for contributing to ICPHub DAO! Together, we're building the future of decentralized collaboration.** 🚀

*Happy coding!* 💻✨
