# CI/CD Workflow

## 1. Branching Strategy:
- **Primary Branches**: `develop`, `release`.
- **Development Process**:
  - Branch off from develop.
  - Implement code changes in your feature/fix branch.
  - Commit changes with linting and commit conventions enforced by Git hooks.

## 2. Code Integration and Review:
- Push your branch and create a pull request directly to develop.
- Automated validations are performed on the PR.
- Code review and approval are required from designated reviewers (e.g., @thisisphan and @calebgasser).

## 3. Release Process:
- Create a new release branch from develop when needed (e.g., alpha-0.1.1).
- Patches are released automatically each week.
- MAJOR and MINOR versions are deployed manually.

## 4. Tools and Utilities:
- **Git Hooks**: Pre-commit.
- **Testing Github Actions**: act.
- **Linting**: ESLint (JS), Markdown Lint (Docs).
- **Code Formatting**: Elixir pre-commit hooks.
- **Commit Linting**: commitlint.
- **Code Coverage**: excoveralls.

## 5. Versioning Conventions:
- Follow Semantic Versioning (SemVer):
  - **MAJOR**: Incompatible API changes.
  - **MINOR**: Backwards-compatible feature additions.
  - **PATCH**: Bug fixes and minor changes.

## 6. Merging Conventions:
- **Branch Naming**: Related to the fix/feature.
- **Review Requirements**: Include specific team members for pull requests.
- **Pre and Post Pull Request Actions**:
  - **Pre**: Run mix format, mix credo, mix test, mix compile.
  - **Post**: No additional actions required.

## 7. GitHub Actions Workflow:
  - **Lint**: Run linting processes.
  - **Test**: Execute test suites.
  - **Format**: Run mix format.
  - **Compile**: Validate no compilation errors.
  - **Patch**: Automate patch releases.
  - **Release**: Manual creation of MAJOR/MINOR releases.
