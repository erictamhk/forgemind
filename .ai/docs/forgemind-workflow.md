# ForgeMind Complete Workflow

**Version**: 1.0  
**Last Updated**: 2025-10-24  
**Location**: `.ai/docs/forgemind-workflow.md`  
**Status**: Active

---

## 📚 Table of Contents

1. [Core Philosophy](#core-philosophy)
2. [5-Layer Structure](#5-layer-structure)
3. [Complete Workflow](#complete-workflow)
4. [Phase 0: Validation](#phase-0-validation)
5. [Phase 1: Core Development](#phase-1-core-development)
6. [Non-Linear Backtracking](#non-linear-backtracking)
7. [Boss Commands](#boss-commands)
8. [Critical Protocols](#critical-protocols)
9. [File Management](#file-management)
10. [Summary](#summary)

---

## 🎯 Core Philosophy

**Boss Mode First**: Non-technical Boss provides vague ideas → AI handles everything → Boss reviews & approves

### Key Principles

- ✅ **Non-linear development** - Can backtrack to any layer anytime
- ✅ **Clarity-driven** - Progress from 10% → 95%+ clarity per layer
- ✅ **Plan-Ask-Execute** - No AI assumptions, mandatory approval
- ✅ **68 AI Agents** - Automated everything except Boss decisions
- ✅ **Single main branch** - No complex git workflows
- ✅ **Anti-Hallucination** - 21+ checks built-in

### Boss Responsibilities (1-2 hours/day)

1. Provide vague initial idea
2. Answer clarifying questions
3. Review proposals and plans
4. Approve/reject/modify AI suggestions
5. Final review of deliverables

### AI Responsibilities (95% of work)

1. Ask structured questions
2. Generate everything (code, docs, tests)
3. Track clarity progression
4. Maintain documentation
5. Ensure quality gates
6. Update traceability

---

## 📊 5-Layer Structure

```
┌─────────────────────────────────────────────────────────────┐
│                                                             │
│  Layer 0: IDEA (10-90% clarity)                             │
│     ↕ Non-linear backtracking supported at any time        │
│  Layer 1: MODULE (Package structure, dependencies)          │
│     ↕                                                       │
│  Layer 2: DOMAIN (DDD Bounded Contexts)                     │
│     ↕                                                       │
│  Layer 3: REQUIREMENT (EARS notation, testable)             │
│     ↕                                                       │
│  Layer 4: SPECIFICATION (Executable specs, JSON)            │
│     ↕                                                       │
│  IMPLEMENTATION (Code generation by Sub-agents)             │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

**Each layer**:

- Maintains clarity percentage
- Supports backtracking to previous layers
- Generates version snapshots
- Updates traceability matrix

**Progression Rule**: Move to next layer when current layer reaches 90%+ clarity.

---

## 🔄 Complete Workflow

### Overview

```
Boss Vague Idea (10% clarity)
    ↓
Facilitator Agent asks questions
    ↓
Clarity increases: 10% → 30% → 50% → 70% → 90%+
    ↓
Move to next layer
    ↓
Repeat for all 5 layers
    ↓
Code generation (with approval)
    ↓
Quality checks (automated)
    ↓
Deployment (with approval)
```

---

## 🔬 Phase 0: Validation

**Current Phase**  
**Goal**: Validate ForgeMind concepts and workflow

### Activities

```
Boss → Facilitator Agent
         ↓
     [Clarify Phase]
     - Ask structured questions
     - Track clarity progression
     - Update documentation
         ↓
      Idea 85% → 92% clarity
         ↓
     Test agent behaviors
         ↓
     Validate Plan-Ask-Execute
         ↓
     Document learnings
```

### Boss Activities

1. ✅ Give vague idea for ForgeMind itself
2. ✅ Answer clarifying questions
3. ✅ Review Facilitator Agent performance
4. ✅ Approve workflow improvements
5. ⏳ Test file sync mechanisms
6. ⏳ Validate all 68 agents catalog
7. ⏳ Approve Phase 1 start

### AI Activities

- ✅ Ask structured questions (Options + Why this matters)
- ✅ Track clarity progression (85% → 92%)
- ✅ Update documentation automatically
- ✅ Create agent prompts
- ✅ Generate catalog of 68 agents
- ⏳ Test backtracking mechanisms
- ⏳ Validate anti-hallucination checks

### Success Criteria

- [x] Facilitator Agent works correctly
- [x] Clarity tracking functional
- [x] Plan-Ask-Execute protocol validated
- [ ] File sync mechanisms tested
- [ ] All 68 agents defined
- [ ] Boss confident in workflow

---

## 🚀 Phase 1: Core Development

**Goal**: Implement ForgeMind core features for actual projects

---

### Step 1: CLARIFY (Idea → Requirements)

**Participants**: Boss, Facilitator Agent (L1-EXEC-001)

```
Boss: "I want a CRM system"
   ↓
Facilitator Agent:
   📋 My Plan:

   I'll ask 5 clarifying questions about:
   1. Target users
   2. Core pain points
   3. Must-have features
   4. Success metrics
   5. Technology scope

   ⚠️ Proceed with clarify? (Yes/No)
   ↓
Boss: "Yes"
   ↓
Facilitator:
   Q1: Who will use this CRM?
   Options:
   A. Small business owners
   B. Sales teams in enterprises
   C. Marketing teams
   D. Mix of above
   E. Other

   Why this matters:
   - Affects UI complexity
   - Determines feature priority
   - Influences architecture

   Your choice?
   ↓
Boss: "A - Small business owners"
   ↓
Facilitator:
   ✅ Clarified: Target Users = Small business owners
   Updated Clarity: 10% → 25%

   Q2: What problems does this CRM solve?
   ...
   ↓
[Continue for all 5 questions]
   ↓
Final Clarity: 10% → 90%
   ↓
Facilitator:
   📊 Clarification Complete!

   Summary:
   - Target users: Small business owners
   - Pain points: [list]
   - Features: [list]
   - Success metrics: [list]
   - Technology: [scope]

   Clarity: 90%

   Ready to move to Module layer?
   ⚠️ Proceed? (Yes/No)
```

**Outputs**:

- `.dev/current/ideas/IDEA-002/current.md`
- `.dev/current/ideas/IDEA-002/versions/v0.1.md`
- `.forgemind/config.json` updated

---

### Step 2: ANALYZE (Requirements → Modules)

**Participants**: Facilitator Agent → BA Agent (L2-DEPT-001) → Architect Agent (L2-DEPT-002)

```
Facilitator Agent:
   Based on 90% clear Idea, I'll call BA Agent
   ↓
BA Agent:
   📋 My Plan:

   Analyze requirements and identify modules:

   Proposed modules:
   1. MODULE-001: Customer Management
      - Customer CRUD
      - Contact management
      - Customer search

   2. MODULE-002: Sales Pipeline
      - Lead tracking
      - Opportunity management
      - Sales forecasting

   3. MODULE-003: Analytics Dashboard
      - Sales reports
      - Customer insights
      - Performance metrics

   Module dependencies:
   - MODULE-002 depends on MODULE-001
   - MODULE-003 reads from MODULE-001, MODULE-002

   Files to create:
   - .dev/current/modules/MODULE-001/current.md
   - .dev/current/modules/MODULE-002/current.md
   - .dev/current/modules/MODULE-003/current.md

   ⚠️ Proceed with this structure? (Yes/No/Modify)
   ↓
Boss: "Modify - Split Customer Management into two modules"
   ↓
BA Agent:
   📋 Updated Plan:

   1. MODULE-001: Customer Core
      - Customer entity
      - Basic CRUD

   2. MODULE-002: Contact Management
      - Contacts
      - Communication history

   3. MODULE-003: Sales Pipeline
      [same as before]

   4. MODULE-004: Analytics Dashboard
      [same as before]

   Dependencies updated:
   - MODULE-003 depends on MODULE-001, MODULE-002
   - MODULE-004 reads from all

   ⚠️ Better now? (Yes/No)
   ↓
Boss: "Yes"
   ↓
BA Agent:
   ✅ Executing...
   [Creates all module files]
   ✅ Done! Clarity: MODULE layer = 40%

   Calling Architect Agent for technical design...
   ↓
Architect Agent:
   📋 My Plan:

   Design module boundaries and interfaces:

   1. MODULE-001: Customer Core
      Package: com.crm.customer.core
      Public interfaces:
      - CustomerService
      - CustomerRepository
      Dependencies: None

   2. MODULE-002: Contact Management
      Package: com.crm.customer.contact
      Public interfaces:
      - ContactService
      - ContactRepository
      Dependencies: MODULE-001 (CustomerService)

   [... for all modules]

   Shared components:
   - Common DTOs
   - Shared utilities
   - Base exceptions

   ⚠️ Architecture looks good? (Yes/No)
   ↓
Boss: "Yes"
   ↓
Architect Agent:
   ✅ Executing...
   [Updates module files with architecture]
   ✅ Done! Clarity: MODULE layer = 85%

   Ready to move to Domain layer?
```

**Outputs**:

- `.dev/current/modules/MODULE-001/ to MODULE-004/`
- Architecture diagrams
- Dependency graph
- Traceability updated

---

### Step 3: MODEL (Modules → Domains)

**Participants**: Architect Agent → Domain Expert Agent (L2-DEPT-004)

```
Architect Agent:
   Calling Domain Expert for DDD modeling...
   ↓
Domain Expert Agent:
   📋 My Plan:

   Model Customer Core domain using DDD:

   Bounded Context: Customer Management

   Aggregates:
   1. Customer (Root)
      - CustomerId (identity)
      - CustomerName
      - Email
      - Status

      Invariants:
      - Email must be unique
      - Name cannot be empty
      - Status must be valid enum

   2. Contact
      - ContactId (identity)
      - CustomerId (foreign aggregate)
      - ContactType
      - ContactValue

      Invariants:
      - Must belong to valid Customer
      - ContactType and ContactValue must match

   Domain Events:
   - CustomerCreated
   - CustomerUpdated
   - CustomerDeactivated
   - ContactAdded
   - ContactRemoved

   Value Objects:
   - CustomerName
   - Email
   - ContactType

   Domain Services:
   - CustomerValidator
   - DuplicateCustomerChecker

   ⚠️ Domain model correct? (Yes/No/Modify)
   ↓
Boss: "Modify - Contact should be separate aggregate, not child"
   ↓
Domain Expert Agent:
   📋 Updated Plan:

   Separate Contact aggregate:

   Aggregates:
   1. Customer (Root)
      [same as before]

   2. Contact (Root) ← Now independent
      - ContactId (identity)
      - CustomerId (reference, not FK)
      - ContactType
      - ContactValue

      Invariants:
      - Referenced CustomerId must exist
      - Contact manages its own lifecycle

   Aggregate relationships:
   - Customer references Contacts by ID
   - Contact references Customer by ID
   - Both are eventually consistent

   New domain events:
   - ContactCreatedForCustomer
   - ContactCustomerChanged

   ⚠️ Better now? (Yes/No)
   ↓
Boss: "Yes"
   ↓
Domain Expert Agent:
   ✅ Executing...
   [Creates domain files]

   Files created:
   - .dev/current/domains/DOMAIN-001/current.md
   - .dev/current/domains/DOMAIN-001/aggregates.md
   - .dev/current/domains/DOMAIN-001/events.md
   - .dev/current/domains/DOMAIN-001/diagram.mmd

   ✅ Done! Clarity: DOMAIN layer = 90%

   Ready for Requirements layer?
```

**Outputs**:

- `.dev/current/domains/DOMAIN-001/ to DOMAIN-N/`
- Aggregate definitions
- Domain event catalog
- DDD diagrams
- Traceability updated

---

### Step 4: SPECIFY (Domains → Requirements)

**Participants**: Domain Expert → Requirements Engineer (L2-DEPT-003)

```
Domain Expert Agent:
   Calling Requirements Engineer for detailed requirements...
   ↓
Requirements Engineer:
   📋 My Plan:

   Write requirements in EARS notation:

   REQ-001: Customer Creation
   WHEN Boss triggers "Create Customer"
   WHERE customer data is valid
   System SHALL create Customer entity
   AND SHALL emit CustomerCreated event

   REQ-002: Email Uniqueness Check
   WHEN system creates or updates Customer
   WHERE email already exists
   System SHALL reject operation
   AND SHALL return error message

   REQ-003: Customer Deactivation
   WHEN Boss triggers "Deactivate Customer"
   WHERE customer has active contracts
   System SHALL prevent deactivation
   AND SHALL list blocking contracts

   [... 20 more requirements]

   Acceptance Criteria for REQ-001:
   - Valid customer data includes: Name, Email
   - Customer ID is auto-generated
   - Event contains all customer data
   - Event is published to message bus

   Traceability:
   - REQ-001 → DOMAIN-001 (Customer aggregate)
   - REQ-001 → MODULE-001 (Customer Core)
   - REQ-001 → IDEA-002 (Original CRM idea)

   Files to create:
   - .dev/current/requirements/REQ-001.md to REQ-023.md

   ⚠️ Requirements complete? (Yes/No/Modify)
   ↓
Boss: "Modify - Add requirement for email validation format"
   ↓
Requirements Engineer:
   📋 Updated Plan:

   + REQ-024: Email Format Validation
   WHEN system creates or updates Customer
   WHERE email format is invalid (not RFC 5322 compliant)
   System SHALL reject operation
   AND SHALL return specific format error

   Acceptance Criteria:
   - Must validate against RFC 5322
   - Common errors detected: missing @, invalid domain, etc.
   - Error message includes format example

   ⚠️ Now complete? (Yes/No)
   ↓
Boss: "Yes"
   ↓
Requirements Engineer:
   ✅ Executing...
   [Creates all requirement files]

   ✅ Created 24 requirements
   ✅ Linked to domains, modules, idea
   ✅ Clarity: REQUIREMENT layer = 95%

   Ready for Specification layer?
```

**Outputs**:

- `.dev/current/requirements/REQ-001.md to REQ-024.md`
- Acceptance criteria
- Traceability matrix updated

---

### Step 5: DESIGN (Requirements → Specifications)

**Participants**: Requirements Engineer → Spec Writer Agent (L3-SUB-025)

```
Requirements Engineer:
   Calling Spec Writer for executable specifications...
   ↓
Spec Writer Agent:
   📋 My Plan:

   Convert requirements to executable specs (ezSpec format):

   SPEC-001: Customer Creation (from REQ-001)
   {
     "feature": "Customer Creation",
     "aggregate": "Customer",
     "command": "CreateCustomer",
     "scenarios": [
       {
         "description": "Successful customer creation",
         "given": [
           "Valid customer name: 'John Doe'",
           "Valid email: 'john@example.com'",
           "Email not in use"
         ],
         "when": "CreateCustomer command is executed",
         "then": [
           "Customer entity is created",
           "Customer has generated ID",
           "CustomerCreated event is emitted",
           "Event contains all customer data"
         ]
       },
       {
         "description": "Duplicate email rejection",
         "given": [
           "Existing customer with email: 'john@example.com'",
           "New customer data with same email"
         ],
         "when": "CreateCustomer command is executed",
         "then": [
           "Command is rejected",
           "Error: 'Email already in use'",
           "No event is emitted"
         ]
       }
     ],
     "hooks": {
       "before_command": ["ValidateEmail", "CheckDuplicateEmail"],
       "after_event": ["UpdateCustomerIndex", "NotifyCreation"]
     }
   }

   Total specs to create: 50+ (one per requirement + variations)

   Format: JSON (ezSpec BDD)
   Location: .dev/current/specs/

   ⚠️ Spec format ok? (Yes/No)
   ↓
Boss: "Yes"
   ↓
Spec Writer Agent:
   ✅ Executing...
   [Generates all specs]

   Progress:
   [████████████████████] 100%

   ✅ Created 53 executable specs
   ✅ Validated against requirements
   ✅ All traceability links updated
   ✅ Clarity: SPECIFICATION layer = 95%

   All 5 layers complete!
   Ready for code generation?
```

**Outputs**:

- `.dev/current/specs/SPEC-001.json to SPEC-053.json`
- Executable BDD scenarios
- Agent hooks defined
- Traceability complete

---

### Step 6: IMPLEMENT (Specs → Code)

**Participants**: Spec Writer → Command Code Generation Agent (L3-SUB-003) → Test Generation Agent (L3-SUB-005)

```
Spec Writer Agent:
   All specs ready. Calling Command Code Generation Agent...
   ↓
Command Code Generation Agent:
   📋 My Plan:

   Generate code for CreateCustomer command from SPEC-001:

   Files to generate:
   1. CreateCustomerCommand.java
      - Command class with validation
      - ~50 lines

   2. CustomerAggregate.java
      - Aggregate root
      - createCustomer() method
      - Invariant enforcement
      - ~150 lines

   3. CustomerCreatedEvent.java
      - Domain event
      - ~30 lines

   4. CreateCustomerCommandHandler.java
      - Command handler
      - Repository interaction
      - Event emission
      - ~100 lines

   Total: ~330 lines
   Technology: Java, Spring Boot, DDD patterns

   Will follow:
   - DDD aggregate patterns
   - CQRS command side
   - Event sourcing (optional)

   ⚠️ Generate this code? (Yes/No)
   ↓
Boss: "Yes"
   ↓
Command Agent:
   ✅ Executing...

   [Generates code]
   Progress:
   [█████░░░░░] Creating CreateCustomerCommand.java...
   [██████████] ✅ Done
   [█████░░░░░] Creating CustomerAggregate.java...
   [██████████] ✅ Done
   [█████░░░░░] Creating CustomerCreatedEvent.java...
   [██████████] ✅ Done
   [█████░░░░░] Creating CreateCustomerCommandHandler.java...
   [██████████] ✅ Done

   ✅ All code generated!
   ✅ Compiles successfully

   Calling Test Generation Agent...
   ↓
Test Generation Agent:
   📋 My Plan:

   Generate tests from SPEC-001:

   Test files:
   1. CreateCustomerCommandTest.java
      - Test command validation
      - ~100 lines, 10 test cases

   2. CustomerAggregateTest.java
      - Test aggregate behavior
      - Test invariants
      - ~200 lines, 20 test cases

   3. CreateCustomerCommandHandlerTest.java
      - Test command handling
      - Test event emission
      - ~150 lines, 15 test cases

   Total: ~450 lines, 45 test cases
   Target: 85%+ mutation coverage

   ⚠️ Generate tests? (Yes/No)
   ↓
Boss: "Yes"
   ↓
Test Generation Agent:
   ✅ Executing...
   [Generates tests]

   ✅ Generated 45 test cases
   ✅ Running tests...
   ✅ All tests pass (45/45)

   Running mutation testing (PIT)...
   [██████████] 100%

   Mutation Coverage Report:
   - Line coverage: 98%
   - Mutation coverage: 87%
   - Mutation score: 87/100

   ✅ Exceeds target (85%)

   Code generation complete!
```

**Outputs**:

- Source code files
- Test files
- Mutation testing reports
- All tests passing

---

### Step 7: REVIEW (Code → Quality)

**Participants**: Test Agent → Code Review Agent (L3-SUB-006) → QA Agent (L2-DEPT-007)

```
Test Generation Agent:
   Calling Code Review Agent for quality check...
   ↓
Code Review Agent:
   📋 My Plan:

   Review generated code against checklist:

   Checks:
   1. DDD Patterns (15 checks)
      - Aggregate boundaries correct
      - Invariants enforced
      - Domain events properly designed
      - [... 12 more]

   2. SOLID Principles (10 checks)
      - Single Responsibility
      - Open/Closed
      - Liskov Substitution
      - Interface Segregation
      - Dependency Inversion

   3. Code Quality (10 checks)
      - No code smells
      - Proper naming
      - No magic numbers
      - [... 7 more]

   4. Security (8 checks)
      - Input validation
      - No SQL injection risk
      - [... 6 more]

   5. Performance (5 checks)
      - No N+1 queries
      - Proper indexing
      - [... 3 more]

   Total: 48 automated checks

   ⚠️ Run code review? (Yes/No)
   ↓
Boss: "Yes"
   ↓
Code Review Agent:
   ✅ Executing review...
   [Analyzing code]

   Review Results:
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
   ✅ Passed: 45/48 checks (94%)
   ⚠️  Warnings: 3
   ❌ Critical: 0

   Warnings:
   1. CustomerAggregate.java:45
      - Consider extracting email validation to Value Object
      - Severity: Minor
      - Auto-fixable: Yes

   2. CreateCustomerCommandHandler.java:30
      - Repository call could use Optional
      - Severity: Minor
      - Auto-fixable: Yes

   3. CustomerCreatedEvent.java:15
      - Event timestamp missing
      - Severity: Minor
      - Auto-fixable: Yes

   ⚠️ Auto-fix these issues? (Yes/No/Skip)
   ↓
Boss: "Yes"
   ↓
Code Review Agent:
   ✅ Applied auto-fixes
   ✅ Re-running checks...
   ✅ All 48 checks passed!

   Calling QA Agent for final validation...
   ↓
QA Agent:
   📋 My Plan:

   Validate against quality gates:

   1. Test Coverage Gate
      - Target: 80% line coverage
      - Actual: 98% ✅

   2. Mutation Score Gate
      - Target: 85%
      - Actual: 87% ✅

   3. Code Review Gate
      - Target: 90% checks passed
      - Actual: 100% ✅

   4. Requirements Coverage Gate
      - All requirements have specs: 24/24 ✅
      - All specs have code: 53/53 ✅

   5. Traceability Gate
      - All code linked to requirements: ✅
      - All requirements linked to idea: ✅

   ⚠️ All gates passed. Approve for deployment? (Yes/No)
   ↓
Boss: "Yes"
   ↓
QA Agent:
   ✅ Quality validation complete!
   ✅ Ready for deployment
```

**Outputs**:

- Code review report
- Auto-fixed code
- Quality gate results
- Deployment approval

---

### Step 8: DEPLOY (Code → Production)

**Participants**: QA Agent → Facilitator Agent

```
QA Agent:
   All quality gates passed. Returning to Facilitator...
   ↓
Facilitator Agent:
   📋 My Plan:

   Deploy to production:

   1. Commit code to git (main branch)
      Commit message:
      "feat(customer): Add customer creation feature

      - Implemented CreateCustomer command
      - Added Customer aggregate with invariants
      - Emits CustomerCreated domain event
      - Added email uniqueness validation

      Test coverage: 98%
      Mutation score: 87%

      Implements: REQ-001, REQ-002, REQ-024
      Closes: SPEC-001

      Related to: IDEA-002, MODULE-001, DOMAIN-001"

   2. Tag release: v0.1.0-customer-creation

   3. Update project status

   4. Generate session summary

   Files to commit:
   - src/ (4 new files)
   - test/ (3 new files)
   - .dev/current/ (updated traceability)

   ⚠️ Proceed with deployment? (Yes/No)
   ↓
Boss: "Yes"
   ↓
Facilitator Agent:
   ✅ Executing deployment...

   [git add .]
   [git commit -m "..."]
   ✅ Committed to main

   [git tag v0.1.0-customer-creation]
   ✅ Tagged release

   [Update .forgemind/config.json]
   ✅ Project status updated

   [Generate session summary]
   ✅ Summary saved to .dev/ask/

   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
   🎉 Session Complete!
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

   Session Summary:
   - Duration: 2 hours
   - Idea clarity: 10% → 90%
   - Layers completed: 5/5
   - Requirements: 24
   - Specifications: 53
   - Code files: 7
   - Test cases: 45
   - Quality gates: All passed
   - Deployment: Success

   Next steps:
   - Continue with next feature
   - Or backtrack to modify requirements
   - Or add new modules

   ⚠️ What would you like to do next?
```

**Outputs**:

- Git commit
- Git tag
- Updated config
- Session summary
- Production-ready code

---

## 🔄 Non-Linear Backtracking

ForgeMind supports backtracking to any layer at any time.

### Example: Change During Implementation

```
[Currently at: Step 6 - Implementation in progress]

Boss: "Wait, I want to change REQ-005"
   ↓
Facilitator Agent:
   🔄 Backtracking requested

   📋 Impact Analysis (3 seconds):

   Analyzing impact of changing REQ-005...

   Affected items:
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
   Layer 3 (Requirements):
   ✅ REQ-005 (will be modified)

   Layer 4 (Specifications):
   ⚠️  SPEC-012 (depends on REQ-005)
   ⚠️  SPEC-013 (depends on REQ-005)

   Implementation:
   ⚠️  CustomerAggregate.java:updateEmail()
   ⚠️  EmailValidator.java
   ⚠️  CustomerUpdatedEvent.java

   Tests:
   ⚠️  10 test cases will need updates

   Estimated effort:
   - Requirement update: 15 min
   - Spec regeneration: 10 min
   - Code regeneration: 20 min
   - Test updates: 15 min
   Total: ~1 hour

   ⚠️ Proceed with backtracking? (Yes/No)
   ↓
Boss: "Yes, change REQ-005 to allow multiple emails per customer"
   ↓
Facilitator Agent:
   📋 My Plan:

   Backtrack and propagate changes:

   1. Backtrack to Layer 3 (Requirements)
   2. Modify REQ-005
   3. Regenerate affected specs (SPEC-012, SPEC-013)
   4. Regenerate affected code (3 files)
   5. Regenerate affected tests (10 tests)
   6. Re-run quality checks
   7. Update traceability

   ⚠️ Proceed with this plan? (Yes/No)
   ↓
Boss: "Yes"
   ↓
Facilitator Agent:
   ✅ Executing backtrack...

   [Step 1] Backtracking to Requirements layer...
   ✅ Done

   [Step 2] Modifying REQ-005...
   Updated: Customer can have 1-5 email addresses
   ✅ Done

   [Step 3] Regenerating specs...
   ✅ SPEC-012 regenerated
   ✅ SPEC-013 regenerated

   [Step 4] Regenerating code...
   ✅ CustomerAggregate.java updated
   ✅ EmailValidator.java updated
   ✅ CustomerUpdatedEvent.java updated

   [Step 5] Updating tests...
   ✅ 10 test cases updated
   ✅ All tests pass

   [Step 6] Running quality checks...
   ✅ All gates passed

   [Step 7] Updating traceability...
   ✅ All links updated

   ✅ Backtracking complete!
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
   Total time: 47 minutes

   You can now continue from where you left off,
   or make more changes.
```

### Backtracking at Any Point

```
# During Clarify (Layer 0)
Boss: "Actually, target users should be enterprises"
→ Re-clarify, impacts modules, domains, requirements

# During Module Design (Layer 1)
Boss: "Split this module into two"
→ Redesign modules, impacts domains, requirements, specs

# During Domain Modeling (Layer 2)
Boss: "Contact should be separate aggregate"
→ Remodel domain, impacts requirements, specs, code

# During Requirements (Layer 3)
Boss: "Add new requirement for X"
→ Add requirement, generate new specs, new code

# During Specification (Layer 4)
Boss: "Change scenario acceptance criteria"
→ Regenerate spec, regenerate code, regenerate tests

# During Implementation (Layer 5)
Boss: "Use different design pattern"
→ Regenerate code with new pattern, update tests
```

**Key Feature**: 3-second impact analysis shows consequences before making changes.

---

## 📋 Boss Commands

Commands available at any time during workflow:

### Status Commands

```bash
facilitator status
# Shows current layer, clarity levels, progress

facilitator list ideas
# Shows all ideas in project

facilitator list modules
# Shows all modules

facilitator list requirements
# Shows all requirements

facilitator list specs
# Shows all specifications
```

### Navigation Commands

```bash
facilitator switch IDEA-002
# Switch to different idea

facilitator backtrack to "Layer 2"
# Go back to specific layer

facilitator go to MODULE-003
# Jump to specific module
```

### Analysis Commands

```bash
facilitator analyze impact "change REQ-005"
# Show impact of changing requirement

facilitator check dependencies MODULE-002
# Show module dependencies

facilitator show traceability REQ-001
# Show full traceability chain
```

### Execution Commands

```bash
facilitator clarify
# Start clarifying current layer

facilitator generate code
# Generate code from specs (with approval)

facilitator run tests
# Run all tests

facilitator check quality
# Run quality gates
```

### File Management Commands

```bash
facilitator check sync
# Check if files match current state

facilitator sync files
# Sync all files

facilitator list changes
# Show session changes

facilitator snapshot
# Create state snapshot
```

### Session Commands

```bash
facilitator end session
# Complete sync, commit, summary

facilitator enable auto-sync
# Auto-sync after each change

facilitator help
# Show all commands
```

---

## 🔒 Critical Protocols

### 1. Plan-Ask-Execute (MANDATORY)

**Every AI action must follow**:

```
Step 1: PLAN
- Create detailed plan
- Show what will be done
- Show what will NOT be done
- Estimate changes

Step 2: ASK
- Request explicit approval
- "⚠️ Proceed? (Yes/No/Modify)"
- WAIT for response
- Never assume silence = approval

Step 3: EXECUTE
- Only after receiving "Yes"
- Show progress
- Show results
- Ask for next action
```

**Forbidden Without Approval**:

- ❌ File operations (create/modify/delete)
- ❌ Git operations (add/commit/push)
- ❌ Code generation
- ❌ Documentation updates
- ❌ Configuration changes
- ❌ ANY assumptions about what Boss wants

### 2. Anti-Hallucination (21+ Checks)

**AI must NEVER**:

- ❌ Fabricate features not requested
- ❌ Assume user preferences
- ❌ Guess missing information
- ❌ Add "helpful" extras
- ❌ Make up facts or data
- ❌ Proceed without clarity

**AI must ALWAYS**:

- ✅ Ask when uncertain
- ✅ Reference specific documentation
- ✅ Quote exact text when citing
- ✅ Distinguish facts from suggestions
- ✅ Admit when doesn't know
- ✅ Wait for Boss's answer

### 3. Clarity Tracking

**Progression Rule**:

- Start layer at 10% clarity
- Progress through clarification
- Move to next layer at 90%+ clarity
- Update clarity after each clarification

**Display Format**:

```
Layer 0 (Idea):         [████████░░] 85%
Layer 1 (Module):       [████░░░░░░] 40%
Layer 2 (Domain):       [██░░░░░░░░] 20%
Layer 3 (Requirement):  [█░░░░░░░░░] 10%
Layer 4 (Specification):[░░░░░░░░░░]  0%
```

### 4. Traceability

**All items must be linked**:

```
IDEA-002
  ↓
MODULE-001, MODULE-002, MODULE-003
  ↓
DOMAIN-001, DOMAIN-002
  ↓
REQ-001 to REQ-024
  ↓
SPEC-001 to SPEC-053
  ↓
Code files, Test files
```

**Maintained in**: `.dev/traceability/master-matrix.json`

---

## 📁 File Management

### Current State (Single Source of Truth)

```
.dev/current/
├── ideas/
│   └── IDEA-002/
│       ├── current.md              ← Active idea
│       └── versions/
│           ├── v0.1.md             ← Initial
│           ├── v0.2.md             ← After clarify
│           └── v0.3.md             ← Latest snapshot
│
├── modules/
│   ├── MODULE-001/
│   │   ├── current.md              ← Active module
│   │   └── versions/
│   │       └── v0.1.md
│   └── MODULE-002/
│       └── current.md
│
├── domains/
│   ├── DOMAIN-001/
│   │   ├── current.md              ← Active domain
│   │   ├── aggregates.md
│   │   ├── events.md
│   │   └── versions/
│   └── DOMAIN-002/
│
├── requirements/
│   ├── REQ-001.md                  ← Active requirements
│   ├── REQ-002.md
│   └── ...REQ-024.md
│
└── specs/
    ├── SPEC-001.json               ← Active specs
    ├── SPEC-002.json
    └── ...SPEC-053.json
```

### Configuration

```
.forgemind/
├── config.json                     ← Current context
│   {
│     "current_idea": "IDEA-002",
│     "current_phase": 1,
│     "current_layer": 2,
│     "clarity_levels": {
│       "idea": 90,
│       "module": 85,
│       "domain": 70,
│       "requirement": 0,
│       "specification": 0
│     }
│   }
│
└── backups/
    ├── snapshot-2025-10-24-1400.json
    └── snapshot-2025-10-24-1600.json
```

### Traceability

```
.dev/traceability/
└── master-matrix.json
    {
      "IDEA-002": {
        "name": "CRM System",
        "clarity": 90,
        "modules": ["MODULE-001", "MODULE-002", "MODULE-003"],
        "domains": ["DOMAIN-001", "DOMAIN-002"],
        "requirements": ["REQ-001", ..., "REQ-024"],
        "specifications": ["SPEC-001", ..., "SPEC-053"]
      },
      "MODULE-001": {
        "name": "Customer Core",
        "depends_on": [],
        "domains": ["DOMAIN-001"],
        "requirements": ["REQ-001", "REQ-002", ...]
      },
      ...
    }
```

### Version Management

**When to create versions**:

- After significant clarifications (clarity +5% or more)
- Before major changes (backtracking)
- At layer transitions
- On Boss request

**Naming convention**:

- Patch: v0.1.1 (minor clarifications)
- Minor: v0.2.0 (significant clarifications)
- Major: v1.0.0 (fundamental direction change)

---

## 🎓 Summary

### What Makes ForgeMind Different

1. **Boss Mode First**

   - Non-technical Boss can build enterprise software
   - AI handles 95% of technical work
   - Boss only answers questions and reviews

2. **5-Layer Structure**

   - Clear progression: Idea → Module → Domain → Req → Spec → Code
   - Each layer has clarity percentage
   - Can't skip layers (ensures quality)

3. **Non-Linear Development**

   - Backtrack to any layer anytime
   - 3-second impact analysis
   - Changes propagate automatically

4. **Plan-Ask-Execute Protocol**

   - AI never acts without approval
   - No assumptions or hallucinations
   - Boss always in control

5. **68 AI Agents**

   - Specialized agents for each task
   - Coordinate automatically
   - Boss interacts only with Facilitator

6. **Single Main Branch**

   - No complex git workflows
   - AI handles all commits
   - Clean history

7. **Built-in Quality**
   - 21+ anti-hallucination checks
   - Mutation testing (85%+ score)
   - Automated code review
   - Quality gates

### Evolution from Original Workflow

**Original (v0.1)**:

```
Discover → Define → Develop → Delivery
(4 steps, linear, vague)
```

**Current (v1.0)**:

```
5 Layers × Clarity Tracking × Non-Linear × Plan-Ask-Execute
(Structured, measurable, flexible, controlled)
```

### Typical Project Timeline

**Phase 0 (1-2 weeks)**:

- Validate ForgeMind concepts
- Test agent behaviors
- Current status: In progress

**Phase 1 (2-3 months per project)**:

- Clarify idea: 1-2 days
- Design modules: 2-3 days
- Model domains: 3-5 days
- Write requirements: 1 week
- Generate specs: 3-5 days
- Implement & test: 1-2 months (iterative)

**Phase 2+**: Production deployment, maintenance

### Boss Time Investment

- **Week 1-2**: 4-6 hours (intensive clarification)
- **Week 3+**: 1-2 hours/day (reviews and approvals)
- **Total**: ~20-30 hours for complete project

**AI Time**: 24/7 (as needed)

---

## 📖 Related Documentation

- **AGENTS.md** - Agent system initialization
- **facilitator-agent.md** - Facilitator Agent prompt
- **facilitator-agent-guide.md** - Boss command reference
- **plan-ask-execute-protocol.md** - Mandatory approval protocol
- **facilitator-file-sync-prompts.md** - File sync commands
- **agents-catalog.json** - All 68 agents catalog
- **FORGEMIND-README.md** - Complete system documentation

---

**This workflow is now the official ForgeMind development process.**

All agents must follow this workflow. All Boss interactions follow this flow.

**Version**: 1.0 (2025-10-24)  
**Status**: Active and validated in Phase 0
