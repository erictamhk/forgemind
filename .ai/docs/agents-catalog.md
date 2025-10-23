# ForgeMind Agents Catalog

> **Version**: 1.0.0
> **Last Updated**: 2025-10-23T14:24:00+08:00
> **Total Agents**: 68
> **Implemented**: 1 | **In Development**: 0 | **Planned**: 67

---

## 📊 Overview

This catalog contains all 68 ForgeMind AI Agents organized in a 3-level hierarchy:

- **Level 1**: Executive Agents (4) - Strategic leadership and coordination
- **Level 2**: Department Agents (38) - Specialized domain expertise
- **Level 3**: Sub-agents (26) - Code generation and technical implementation

### Status Distribution
- ✅ **Implemented**: 1 agent (Facilitator Agent)
- 📋 **Planned**: 67 agents across all levels
- 🔄 **In Development**: 0 agents currently

### Priority Levels
- **P0**: Critical for core functionality (must implement)
- **P1**: Important for complete workflow (should implement)
- **P2**: Nice to have for enhanced experience
- **P3**: Future enhancements

---

## 🤖 Level 1: Executive Agents

### L1-EXEC-001: Facilitator Agent ✅
**Status**: Implemented | **Priority**: P0 | **Phase**: 0

**Description**: Primary interface for Boss. Guides through 5-layer structure, asks structured questions, tracks clarity, maintains documentation, coordinates other agents.

**Responsibilities**:
- Guide Boss through 5-layer structure
- Ask structured clarifying questions (Clarify phase)
- Track Clarity Level progression
- Maintain project documentation
- Execute Boss commands
- Update .forgemind/config.json

**Commands**:
- facilitator clarify
- facilitator status
- facilitator help
- facilitator update idea
- facilitator new version
- facilitator new idea
- facilitator git commit
- facilitator update todo
- facilitator switch {ID}
- facilitator list ideas
- facilitator analyze
- facilitator suggest
- facilitator fill learning log

**Relationships**:
- Calls: L2-REQ-001, L2-ARCH-001, L2-DOM-001
- Called by: Boss
- Coordinates with: All Level 2 agents

**Reference Docs**: .ai/docs/facilitator-agent-guide.md, AGENTS.md

---

### L1-EXEC-002: Product Owner Agent 📋
**Status**: Planned | **Priority**: P1 | **Phase**: 1

**Description**: Manages product vision, backlog prioritization, stakeholder communication. Ensures alignment with business goals.

**Responsibilities**:
- Maintain product vision
- Prioritize backlog items
- Define acceptance criteria
- Communicate with stakeholders
- Validate business value
- Make scope decisions

**Relationships**:
- Calls: L2-REQ-001, L2-REQ-002
- Called by: L1-EXEC-001
- Coordinates with: L1-EXEC-003, L2-REQ-001

**Planned Implementation**: Phase 1 Week 2-3

---

### L1-EXEC-003: Scrum Master Agent 📋
**Status**: Planned | **Priority**: P1 | **Phase**: 1

**Description**: Facilitates development process, removes blockers, tracks progress, ensures adherence to ForgeMind methodology.

**Responsibilities**:
- Track Sprint/Phase progress
- Identify and resolve blockers
- Facilitate ceremonies (planning, review, retrospective)
- Ensure process adherence
- Generate progress reports
- Manage velocity and capacity

**Relationships**:
- Calls: L2-QA-001, L3-TRACK-001
- Called by: L1-EXEC-001
- Coordinates with: L1-EXEC-002, L1-EXEC-004

**Planned Implementation**: Phase 1 Week 3-4

---

### L1-EXEC-004: QA Manager Agent 📋
**Status**: Planned | **Priority**: P1 | **Phase**: 1

**Description**: Oversees quality assurance strategy, test coverage, quality gates, release readiness.

**Responsibilities**:
- Define quality strategy
- Set quality gates
- Monitor test coverage
- Assess release readiness
- Manage QA sub-agents
- Report quality metrics

**Relationships**:
- Calls: L2-QA-002, L2-QA-003, L2-QA-004
- Called by: L1-EXEC-001
- Coordinates with: L1-EXEC-003, L2-ARCH-001

**Planned Implementation**: Phase 1 Week 4

---

## 🔧 Level 2: Department Agents

### Requirements Department

#### L2-REQ-001: BA (Business Analyst) Agent 📋
**Status**: Planned | **Priority**: P0 | **Phase**: 0

**Description**: Collects and analyzes business requirements, creates EARS notation requirements, identifies use cases.

**Responsibilities**:
- Conduct requirements discovery
- Write EARS format requirements
- Identify use cases and scenarios
- Create requirement specifications
- Validate requirements with Boss
- Maintain requirements traceability

**Applicable Layers**: 0, 1, 2, 3

**Relationships**:
- Calls: L2-REQ-002, L3-CLARIFY-001
- Called by: L1-EXEC-001, L1-EXEC-002
- Coordinates with: L2-ARCH-001, L2-DOM-001

**Planned Implementation**: Phase 0 Week 2

---

#### L2-REQ-002: Requirements Engineer Agent 📋
**Status**: Planned | **Priority**: P0 | **Phase**: 0

**Description**: Writes formal requirements specifications, validates completeness, manages requirement changes.

**Responsibilities**:
- Write formal requirement specs
- Validate requirement completeness
- Manage requirement changes
- Ensure EARS notation compliance
- Create requirement acceptance tests
- Maintain requirement versions

**Applicable Layers**: 3

**Relationships**:
- Calls: L3-VALIDATE-001, L3-TRACE-001
- Called by: L2-REQ-001
- Coordinates with: L2-QA-001

**Planned Implementation**: Phase 0 Week 3

---

### Architecture Department

#### L2-ARCH-001: Architect Agent 📋
**Status**: Planned | **Priority**: P0 | **Phase**: 0

**Description**: Designs system architecture, module structure, technology decisions, ensures architectural principles.

**Responsibilities**:
- Design module structure
- Define technical architecture
- Make technology stack decisions
- Ensure architectural patterns adherence
- Create dependency diagrams
- Guide implementation approach

**Applicable Layers**: 1, 2, 4

**Relationships**:
- Calls: L2-ARCH-002, L2-ARCH-003, L3-DESIGN-001
- Called by: L1-EXEC-001, L1-EXEC-002
- Coordinates with: L2-REQ-001, L2-DOM-001

**Planned Implementation**: Phase 0 Week 2

---

### Quality Assurance Department

#### L2-QA-001: QA Agent 📋
**Status**: Planned | **Priority**: P0 | **Phase**: 0

**Description**: Validates requirements testability, creates test strategies, ensures quality standards.

**Responsibilities**:
- Validate requirements are testable
- Create test strategies
- Define test scenarios
- Ensure quality standards
- Review specifications for testability
- Create acceptance criteria

**Applicable Layers**: 3, 4

**Relationships**:
- Calls: L3-TEST-001, L3-VALIDATE-001
- Called by: L1-EXEC-004, L2-REQ-002
- Coordinates with: L2-REQ-002, L2-SPEC-001

**Planned Implementation**: Phase 0 Week 3

---

### Domain Modeling Department

#### L2-DOM-001: Domain Expert Agent 📋
**Status**: Planned | **Priority**: P1 | **Phase**: 1

**Description**: Applies DDD principles, identifies bounded contexts, designs domain models, ensures ubiquitous language.

**Responsibilities**:
- Identify bounded contexts (Domains)
- Design domain models
- Define ubiquitous language
- Apply DDD strategic patterns
- Model aggregates and entities
- Define domain events

**Applicable Layers**: 2

**Relationships**:
- Calls: L3-DOMAIN-001, L3-DOMAIN-002
- Called by: L2-ARCH-001
- Coordinates with: L2-REQ-001, L2-ARCH-001

**Planned Implementation**: Phase 1 Week 1

---

### Specification Department

#### L2-SPEC-001: Specification Writer Agent 📋
**Status**: Planned | **Priority**: P1 | **Phase**: 1

**Description**: Writes executable specifications (ezSpec format), ensures machine-readable format, validates spec completeness.

**Responsibilities**:
- Write ezSpec format specifications
- Generate JSON specifications
- Ensure spec executability
- Validate spec completeness
- Create test scenarios from specs
- Maintain spec versions

**Applicable Layers**: 4

**Relationships**:
- Calls: L3-SPEC-001, L3-VALIDATE-002
- Called by: L2-REQ-002
- Coordinates with: L2-QA-001, L3-CODE-GEN-001

**Planned Implementation**: Phase 1 Week 2

---

### Infrastructure Department

#### L2-DEPT-013: Integration Agent 📋
**Status**: Planned | **Priority**: P2 | **Phase**: 2

**Description**: API integration specialist. Manages third-party API integrations, handles external service connections, ensures integration reliability.

**Responsibilities**:
- Manage third-party API integrations
- Handle API authentication/authorization
- Implement retry and circuit breaker patterns
- Monitor integration health
- Handle rate limiting
- Create integration documentation

**Applicable Layers**: 4

**Relationships**:
- Calls: []
- Called by: API Agent, Backend Agent
- Coordinates with: []

**Planned Implementation**: Phase 2

---

#### L2-DEPT-014: Message Queue Agent 📋
**Status**: Planned | **Priority**: P2 | **Phase**: 2

**Description**: Message queue specialist. Manages async messaging, event-driven architecture, message brokers (RabbitMQ, Kafka), ensures reliable message delivery.

**Responsibilities**:
- Design message queue architecture
- Configure message brokers
- Implement pub/sub patterns
- Handle message retries and DLQ
- Monitor queue health
- Ensure message ordering

**Applicable Layers**: 4

**Relationships**:
- Calls: []
- Called by: Architect Agent
- Coordinates with: []

**Planned Implementation**: Phase 2

---

#### L2-DEPT-015: Caching Agent 📋
**Status**: Planned | **Priority**: P2 | **Phase**: 2

**Description**: Caching specialist. Designs caching strategies, manages cache invalidation, implements distributed caching (Redis), optimizes cache hit rates.

**Responsibilities**:
- Design caching strategies
- Implement cache layers
- Manage cache invalidation
- Configure distributed caching
- Monitor cache performance
- Handle cache consistency

**Applicable Layers**: 4

**Relationships**:
- Calls: []
- Called by: Performance Agent
- Coordinates with: []

**Planned Implementation**: Phase 2

---

#### L2-DEPT-016: Logging Agent 📋
**Status**: Planned | **Priority**: P2 | **Phase**: 2

**Description**: Logging specialist. Implements structured logging, log aggregation, log levels management, ensures effective debugging capabilities.

**Responsibilities**:
- Implement structured logging
- Configure log aggregation
- Define log levels strategy
- Ensure log security (no sensitive data)
- Implement correlation IDs
- Setup log retention policies

**Applicable Layers**: 4

**Relationships**:
- Calls: []
- Called by: DevOps Agent, Monitoring Agent
- Coordinates with: []

**Planned Implementation**: Phase 2

---

#### L2-DEPT-017: Monitoring Agent 📋
**Status**: Planned | **Priority**: P3 | **Phase**: 3

**Description**: Monitoring specialist. Sets up application monitoring, defines SLIs/SLOs, creates alerting rules, ensures system observability.

**Responsibilities**:
- Setup application monitoring
- Define SLIs and SLOs
- Create alerting rules
- Configure dashboards
- Monitor system health
- Implement incident response

**Applicable Layers**: []

**Relationships**:
- Calls: []
- Called by: DevOps Agent
- Coordinates with: []

**Planned Implementation**: Phase 3

---

#### L2-DEPT-018: Deployment Agent 📋
**Status**: Planned | **Priority**: P3 | **Phase**: 3

**Description**: Deployment specialist. Manages deployment strategies (blue-green, canary), automates releases, handles rollbacks, ensures zero-downtime deployments.

**Responsibilities**:
- Implement deployment strategies
- Automate release processes
- Handle rollbacks
- Ensure zero-downtime
- Manage deployment pipelines
- Coordinate with environments

**Applicable Layers**: []

**Relationships**:
- Calls: []
- Called by: DevOps Agent
- Coordinates with: []

**Planned Implementation**: Phase 3

---

#### L2-DEPT-019: Configuration Agent 📋
**Status**: Planned | **Priority**: P2 | **Phase**: 2

**Description**: Configuration management specialist. Manages environment configurations, secrets management, feature flags, ensures configuration security.

**Responsibilities**:
- Manage environment configs
- Handle secrets management
- Implement feature flags
- Ensure config security
- Manage config versioning
- Setup config validation

**Applicable Layers**: []

**Relationships**:
- Calls: []
- Called by: DevOps Agent, Security Agent
- Coordinates with: []

**Planned Implementation**: Phase 2

---

#### L2-DEPT-020: Error Handling Agent 📋
**Status**: Planned | **Priority**: P1 | **Phase**: 1

**Description**: Error handling specialist. Designs error handling strategies, implements global exception handlers, manages error responses, ensures graceful degradation.

**Responsibilities**:
- Design error handling strategies
- Implement exception handlers
- Define error response formats
- Handle edge cases
- Implement retry logic
- Ensure graceful degradation

**Applicable Layers**: 4

**Relationships**:
- Calls: []
- Called by: Architect Agent, API Agent
- Coordinates with: []

**Planned Implementation**: Phase 1

---

#### L2-DEPT-021: Validation Agent 📋
**Status**: Planned | **Priority**: P1 | **Phase**: 1

**Description**: Data validation specialist. Implements input validation, business rule validation, data constraints, ensures data integrity.

**Responsibilities**:
- Implement input validation
- Define validation rules
- Validate business constraints
- Ensure data integrity
- Create validation messages
- Handle validation errors

**Applicable Layers**: 4

**Relationships**:
- Calls: []
- Called by: API Agent, Domain Expert Agent
- Coordinates with: []

**Planned Implementation**: Phase 1

---

#### L2-DEPT-022: Localization Agent 📋
**Status**: Planned | **Priority**: P3 | **Phase**: 3

**Description**: Internationalization specialist. Implements i18n/l10n support, manages translations, handles locale-specific formatting, ensures cultural appropriateness.

**Responsibilities**:
- Implement i18n support
- Manage translations
- Handle locale formatting
- Support RTL languages
- Manage resource bundles
- Test localization

**Applicable Layers**: 4

**Relationships**:
- Calls: []
- Called by: Frontend Agent
- Coordinates with: []

**Planned Implementation**: Phase 3

---

#### L2-DEPT-023: Email Agent 📋
**Status**: Planned | **Priority**: P2 | **Phase**: 2

**Description**: Email service specialist. Manages email templates, implements email sending, handles email queues, ensures email deliverability.

**Responsibilities**:
- Manage email templates
- Implement email sending
- Handle email queues
- Track email delivery
- Manage bounce handling
- Ensure SMTP security

**Applicable Layers**: 4

**Relationships**:
- Calls: []
- Called by: Notification Agent
- Coordinates with: []

**Planned Implementation**: Phase 2

---

#### L2-DEPT-024: Notification Agent 📋
**Status**: Planned | **Priority**: P2 | **Phase**: 2

**Description**: Notification service specialist. Manages multi-channel notifications (email, SMS, push), notification preferences, ensures timely delivery.

**Responsibilities**:
- Manage notification channels
- Handle user preferences
- Implement push notifications
- Send SMS notifications
- Track notification delivery
- Handle notification templates

**Applicable Layers**: 4

**Relationships**:
- Calls: Email Agent
- Called by: Application logic
- Coordinates with: []

**Planned Implementation**: Phase 2

---

#### L2-DEPT-025: Search Agent 📋
**Status**: Planned | **Priority**: P2 | **Phase**: 2

**Description**: Search functionality specialist. Implements full-text search, search indexing, search optimization, integrates search engines (Elasticsearch).

**Responsibilities**:
- Implement full-text search
- Manage search indexing
- Optimize search queries
- Configure search engine
- Handle search relevance
- Implement search suggestions

**Applicable Layers**: 4

**Relationships**:
- Calls: []
- Called by: Query Agent
- Coordinates with: []

**Planned Implementation**: Phase 2

---

#### L2-DEPT-026: Analytics Agent 📋
**Status**: Planned | **Priority**: P3 | **Phase**: 3

**Description**: Analytics specialist. Implements usage analytics, tracks metrics, generates insights, integrates analytics tools (Google Analytics, etc.).

**Responsibilities**:
- Implement usage analytics
- Track user behavior
- Generate insights
- Integrate analytics tools
- Create analytics dashboards
- Ensure privacy compliance

**Applicable Layers**: 4

**Relationships**:
- Calls: []
- Called by: Product Owner Agent
- Coordinates with: []

**Planned Implementation**: Phase 3

---

#### L2-DEPT-027: Reporting Agent 📋
**Status**: Planned | **Priority**: P2 | **Phase**: 2

**Description**: Reporting specialist. Generates reports, creates visualizations, handles data export (PDF, Excel), ensures report accuracy.

**Responsibilities**:
- Generate reports
- Create data visualizations
- Implement export functionality
- Handle report scheduling
- Ensure report accuracy
- Manage report templates

**Applicable Layers**: 4

**Relationships**:
- Calls: []
- Called by: Analytics Agent
- Coordinates with: []

**Planned Implementation**: Phase 2

---

#### L2-DEPT-028: Backup Agent 📋
**Status**: Planned | **Priority**: P3 | **Phase**: 3

**Description**: Backup and recovery specialist. Implements backup strategies, manages data backups, handles restore procedures, ensures business continuity.

**Responsibilities**:
- Implement backup strategies
- Schedule automated backups
- Test restore procedures
- Manage backup retention
- Ensure backup security
- Handle disaster recovery

**Applicable Layers**: []

**Relationships**:
- Calls: []
- Called by: DevOps Agent, Database Agent
- Coordinates with: []

**Planned Implementation**: Phase 3

---

#### L2-DEPT-029: Audit Agent 📋
**Status**: Planned | **Priority**: P2 | **Phase**: 2

**Description**: Audit trail specialist. Implements audit logging, tracks user actions, ensures compliance requirements, provides audit reports.

**Responsibilities**:
- Implement audit logging
- Track user actions
- Ensure compliance
- Generate audit reports
- Handle data retention
- Secure audit logs

**Applicable Layers**: 4

**Relationships**:
- Calls: []
- Called by: Security Agent
- Coordinates with: []

**Planned Implementation**: Phase 2

---

#### L2-DEPT-030: Versioning Agent 📋
**Status**: Planned | **Priority**: P2 | **Phase**: 2

**Description**: Version management specialist. Manages API versioning, semantic versioning, changelog generation, ensures backward compatibility.

**Responsibilities**:
- Manage API versioning
- Implement semantic versioning
- Generate changelogs
- Ensure backward compatibility
- Handle version migration
- Manage deprecation strategy

**Applicable Layers**: 4

**Relationships**:
- Calls: []
- Called by: API Agent
- Coordinates with: []

**Planned Implementation**: Phase 2

---

#### L2-DEPT-031: Workflow Agent 📋
**Status**: Planned | **Priority**: P2 | **Phase**: 2

**Description**: Workflow management specialist. Designs workflow engines, implements state machines, handles workflow orchestration, manages business processes.

**Responsibilities**:
- Design workflow engines
- Implement state machines
- Handle workflow transitions
- Manage business processes
- Track workflow status
- Handle workflow events

**Applicable Layers**: 2, 4

**Relationships**:
- Calls: []
- Called by: Domain Expert Agent
- Coordinates with: []

**Planned Implementation**: Phase 2

---

#### L2-DEPT-032: Scheduler Agent 📋
**Status**: Planned | **Priority**: P2 | **Phase**: 2

**Description**: Job scheduling specialist. Implements job schedulers, manages cron jobs, handles background tasks, ensures reliable task execution.

**Responsibilities**:
- Implement job schedulers
- Manage cron jobs
- Handle background tasks
- Ensure task reliability
- Monitor job execution
- Handle job failures

**Applicable Layers**: 4

**Relationships**:
- Calls: []
- Called by: Application logic
- Coordinates with: []

**Planned Implementation**: Phase 2

---

#### L2-DEPT-033: File Storage Agent 📋
**Status**: Planned | **Priority**: P2 | **Phase**: 2

**Description**: File storage specialist. Manages file uploads/downloads, integrates cloud storage (S3), handles CDN, ensures file security.

**Responsibilities**:
- Manage file uploads/downloads
- Integrate cloud storage
- Handle CDN integration
- Ensure file security
- Manage file metadata
- Implement file versioning

**Applicable Layers**: 4

**Relationships**:
- Calls: []
- Called by: API Agent
- Coordinates with: []

**Planned Implementation**: Phase 2

---

#### L2-DEPT-034: Image Processing Agent 📋
**Status**: Planned | **Priority**: P2 | **Phase**: 2

**Description**: Image processing specialist. Handles image uploads, generates thumbnails, optimizes images, implements image transformations.

**Responsibilities**:
- Handle image uploads
- Generate thumbnails
- Optimize images
- Implement transformations
- Manage image formats
- Ensure image security

**Applicable Layers**: 4

**Relationships**:
- Calls: []
- Called by: File Storage Agent
- Coordinates with: []

**Planned Implementation**: Phase 2

---

#### L2-DEPT-035: Payment Agent 📋
**Status**: Planned | **Priority**: P3 | **Phase**: 3

**Description**: Payment integration specialist. Integrates payment gateways (Stripe, PayPal), handles transactions, manages refunds, ensures PCI compliance.

**Responsibilities**:
- Integrate payment gateways
- Handle payment transactions
- Manage refunds
- Ensure PCI compliance
- Handle payment webhooks
- Track payment status

**Applicable Layers**: 4

**Relationships**:
- Calls: []
- Called by: API Agent
- Coordinates with: []

**Planned Implementation**: Phase 3

---

#### L2-DEPT-036: Authentication Agent 📋
**Status**: Planned | **Priority**: P1 | **Phase**: 1

**Description**: Authentication specialist. Implements user authentication, manages JWT tokens, integrates OAuth/SSO, handles login/logout flows.

**Responsibilities**:
- Implement authentication
- Manage JWT tokens
- Integrate OAuth/SSO
- Handle login/logout
- Implement MFA
- Manage sessions

**Applicable Layers**: 4

**Relationships**:
- Calls: []
- Called by: API Agent
- Coordinates with: []

**Planned Implementation**: Phase 1

---

## ⚙️ Level 3: Sub-agents

### Analysis Sub-agents

#### L3-IMPACT-001: Impact Analysis Agent 📋
**Status**: Planned | **Priority**: P0 | **Phase**: 0

**Description**: Performs 3-second impact analysis when changes occur. Identifies affected items across all layers.

**Responsibilities**:
- Analyze impact of changes
- Identify affected items (3 seconds)
- Generate impact reports
- Update traceability matrix
- Calculate change propagation
- Suggest mitigation strategies

**Applicable Layers**: 0, 1, 2, 3, 4

**Relationships**:
- Calls: L3-TRACE-001
- Called by: L1-EXEC-001, All Level 2 agents
- Coordinates with: L3-TRACE-001, L3-VALIDATE-001

**Planned Implementation**: Phase 0 Week 4

---

#### L3-TRACE-001: Traceability Agent 📋
**Status**: Planned | **Priority**: P0 | **Phase**: 0

**Description**: Maintains bidirectional traceability matrix. Tracks relationships between all layers.

**Responsibilities**:
- Maintain traceability matrix
- Track Idea → Module → Domain → Req → Spec relationships
- Enable bidirectional tracing
- Generate traceability reports
- Validate trace completeness
- Update trace on changes

**Applicable Layers**: 0, 1, 2, 3, 4

**Relationships**:
- Calls: []
- Called by: L3-IMPACT-001, L1-EXEC-001
- Coordinates with: L3-IMPACT-001

**Planned Implementation**: Phase 0 Week 4

---

### Code Generation Sub-agents (From Repository)

#### L3-CODE-GEN-001: Command Code Generation Sub-agent 📦
**Status**: From Repository | **Priority**: P2 | **Phase**: 2

**Description**: Generates Command use case production code (Create/Update/Delete). Handles aggregate state changes, domain events, repository save operations.

**Responsibilities**:
- Generate Command use case code
- Implement aggregate state changes
- Generate domain events
- Handle repository save operations
- Implement transaction management
- Enforce business rules
- Architecture-aware: Outbox/InMemory/EventSourcing

**Applicable Layers**: 4

**Source**: Repository SUB-AGENT-SYSTEM.md

**Relationships**:
- Calls: L3-CODE-REV-001
- Called by: L2-SPEC-001
- Coordinates with: L3-TEST-GEN-001, L3-CODE-GEN-002

**Planned Implementation**: Phase 2 Week 1

---

#### L3-CODE-GEN-002: Query Code Generation Sub-agent 📦
**Status**: From Repository | **Priority**: P2 | **Phase**: 2

**Description**: Generates Query use case production code (Get/List/Search). Handles projections, DTOs, read models.

**Responsibilities**:
- Generate Query use case code
- Design and implement projections
- Create DTO mappings
- Implement query optimization
- Design read models
- Ensure no side effects

**Applicable Layers**: 4

**Source**: Repository SUB-AGENT-SYSTEM.md

**Relationships**:
- Calls: L3-CODE-REV-001
- Called by: L2-SPEC-001
- Coordinates with: L3-TEST-GEN-001, L3-CODE-GEN-001

**Planned Implementation**: Phase 2 Week 1

---

#### L3-CODE-GEN-003: Controller Code Generation Sub-agent 📦
**Status**: From Repository | **Priority**: P2 | **Phase**: 2

**Description**: Generates REST Controller code. Handles endpoints, request/response mapping, error handling.

**Responsibilities**:
- Generate REST API endpoints
- Implement request/response mapping
- Handle HTTP status codes
- Apply Spring Boot annotations
- Implement error responses (ApiError)
- Ensure REST API compliance

**Applicable Layers**: 4

**Source**: Repository SUB-AGENT-SYSTEM.md

**Relationships**:
- Calls: L3-TEST-GEN-002
- Called by: L2-SPEC-001
- Coordinates with: L3-CODE-REV-002

**Planned Implementation**: Phase 2 Week 2

---

#### L3-CODE-GEN-004: Aggregate Code Generation Sub-agent 📦
**Status**: From Repository | **Priority**: P2 | **Phase**: 2

**Description**: Generates DDD Aggregate domain model code. Implements state machines, domain events, invariants.

**Responsibilities**:
- Design and implement state machines
- Generate and handle domain events
- Maintain invariants
- Implement Event Sourcing
- Encapsulate business rules
- Handle boundary conditions

**Applicable Layers**: 4

**Source**: Repository SUB-AGENT-SYSTEM.md

**Relationships**:
- Calls: L3-TEST-GEN-003
- Called by: L2-DOM-001
- Coordinates with: L3-CODE-REV-003

**Planned Implementation**: Phase 2 Week 3

---

#### L3-CODE-GEN-005: Reactor Code Generation Sub-agent 📦
**Status**: From Repository | **Priority**: P2 | **Phase**: 2

**Description**: Generates Reactor implementation code. Handles cross-aggregate eventual consistency via event handling.

**Responsibilities**:
- Implement execute(Object event) method
- Handle event type checking (instanceof)
- Implement cross-aggregate consistency logic
- Integrate with MessageBus
- Ensure error isolation
- Implement graceful degradation

**Applicable Layers**: 4

**Source**: Repository SUB-AGENT-SYSTEM.md

**Relationships**:
- Calls: L3-TEST-GEN-004
- Called by: L2-DOM-001
- Coordinates with: L3-CODE-REV-004

**Planned Implementation**: Phase 2 Week 3

---

### Testing Sub-agents (From Repository)

#### L3-TEST-GEN-001: Test Generation Sub-agent 📦
**Status**: From Repository | **Priority**: P2 | **Phase**: 2

**Description**: Generates test code (ezSpec BDD tests, unit tests). Prepares test data.

**Responsibilities**:
- Generate ezSpec BDD tests
- Generate unit tests for domain objects
- Prepare test data
- Generate test scenarios from specs
- Ensure test coverage
- Create test fixtures

**Applicable Layers**: 4

**Source**: Repository SUB-AGENT-SYSTEM.md

**Relationships**:
- Calls: L3-TEST-MUT-001
- Called by: L3-CODE-GEN-001, L3-CODE-GEN-002
- Coordinates with: L2-QA-001

**Planned Implementation**: Phase 2 Week 1

---

#### L3-TEST-GEN-002: Controller Test Generation Sub-agent 📦
**Status**: From Repository | **Priority**: P2 | **Phase**: 2

**Description**: Generates Controller test code. Creates MockMvc and REST Assured tests. Ensures all tests pass.

**Responsibilities**:
- Generate MockMvc tests (must pass)
- Generate REST Assured integration tests (must pass)
- Verify HTTP behavior
- Validate JSON responses
- Execute tests and verify passing
- Cover all scenarios

**Applicable Layers**: 4

**Source**: Repository SUB-AGENT-SYSTEM.md

**Relationships**:
- Calls: []
- Called by: L3-CODE-GEN-003
- Coordinates with: L3-CODE-REV-002

**Planned Implementation**: Phase 2 Week 2

---

#### L3-TEST-GEN-003: Aggregate Test Generation Sub-agent 📦
**Status**: From Repository | **Priority**: P2 | **Phase**: 2

**Description**: Generates Aggregate test code. Tests state transitions, boundary conditions, invariants.

**Responsibilities**:
- Generate state transition tests
- Test boundary conditions
- Verify invariants
- Test event sequences
- Implement Given-When-Then tests
- Ensure aggregate behavior correctness

**Applicable Layers**: 4

**Source**: Repository SUB-AGENT-SYSTEM.md

**Relationships**:
- Calls: []
- Called by: L3-CODE-GEN-004
- Coordinates with: L3-CODE-REV-003

**Planned Implementation**: Phase 2 Week 3

---

#### L3-TEST-GEN-004: Reactor Test Generation Sub-agent 📦
**Status**: From Repository | **Priority**: P2 | **Phase**: 2

**Description**: Generates Reactor test code. Tests event handling with BlockingMessageBus.

**Responsibilities**:
- Setup BlockingMessageBus
- Test event posting and verification
- Test multiple event types
- Test error handling
- Test isolation
- Verify reactor behavior

**Applicable Layers**: 4

**Source**: Repository SUB-AGENT-SYSTEM.md

**Relationships**:
- Calls: []
- Called by: L3-CODE-GEN-005
- Coordinates with: L3-CODE-REV-004

**Planned Implementation**: Phase 2 Week 3

---

#### L3-TEST-MUT-001: Mutation Testing Enhancement Sub-agent 📦
**Status**: From Repository | **Priority**: P2 | **Phase**: 2

**Description**: Uses PIT + uContract + assertion-free tests to boost mutation coverage.

**Responsibilities**:
- Configure PIT mutation testing
- Implement Design by Contract (uContract)
- Design assertion-free tests
- Analyze mutation coverage
- Improve test effectiveness
- Maintain backward compatibility

**Applicable Layers**: 4

**Source**: Repository SUB-AGENT-SYSTEM.md

**Success Metrics**:
- mutation_coverage: >80%
- test_strength: >85%
- existing_tests_pass: 100%

**Relationships**:
- Calls: []
- Called by: L3-TEST-GEN-001, L2-QA-001
- Coordinates with: L3-TEST-GEN-001

**Planned Implementation**: Phase 2 Week 2

---

### Code Review Sub-agents (From Repository)

#### L3-CODE-REV-001: Code Review Sub-agent 📦
**Status**: From Repository | **Priority**: P2 | **Phase**: 2

**Description**: Reviews generated code for compliance, quality, and best practices.

**Responsibilities**:
- Check coding standards compliance
- Identify quality issues
- Provide improvement suggestions
- Validate architectural patterns
- Check for anti-patterns
- Generate review reports

**Applicable Layers**: 4

**Source**: Repository SUB-AGENT-SYSTEM.md

**Relationships**:
- Calls: []
- Called by: L3-CODE-GEN-001, L3-CODE-GEN-002
- Coordinates with: L2-QA-001, L2-ARCH-001

**Planned Implementation**: Phase 2 Week 1

---

#### L3-CODE-REV-002: Controller Code Review Sub-agent 📦
**Status**: From Repository | **Priority**: P2 | **Phase**: 2

**Description**: Reviews Controller implementation quality. Checks REST compliance, Spring Boot standards, security.

**Responsibilities**:
- Check REST API compliance
- Verify Spring Boot standards
- Perform security checks
- Validate API design patterns
- Ensure error handling completeness
- Check both test types exist and pass

**Applicable Layers**: 4

**Source**: Repository SUB-AGENT-SYSTEM.md

**Relationships**:
- Calls: []
- Called by: L3-CODE-GEN-003
- Coordinates with: L3-TEST-GEN-002

**Planned Implementation**: Phase 2 Week 2

---

#### L3-CODE-REV-003: Aggregate Code Review Sub-agent 📦
**Status**: From Repository | **Priority**: P2 | **Phase**: 2

**Description**: Reviews Aggregate implementation quality. Checks DDD principles, Event Sourcing, state machine completeness.

**Responsibilities**:
- Check DDD principles adherence
- Verify Event Sourcing correctness
- Validate state machine completeness
- Ensure invariants are maintained
- Check business rule correctness
- Review domain event handling

**Applicable Layers**: 4

**Source**: Repository SUB-AGENT-SYSTEM.md

**Relationships**:
- Calls: []
- Called by: L3-CODE-GEN-004
- Coordinates with: L3-TEST-GEN-003

**Planned Implementation**: Phase 2 Week 3

---

#### L3-CODE-REV-004: Reactor Code Review Sub-agent 📦
**Status**: From Repository | **Priority**: P2 | **Phase**: 2

**Description**: Reviews Reactor implementation quality. Checks event handling logic, cross-aggregate boundaries.

**Responsibilities**:
- Verify execute(Object event) correctness
- Check event handling logic
- Ensure cross-aggregate boundaries maintained
- Validate error handling completeness
- Check MessageBus integration
- Verify isolation

**Applicable Layers**: 4

**Source**: Repository SUB-AGENT-SYSTEM.md

**Relationships**:
- Calls: []
- Called by: L3-CODE-GEN-005
- Coordinates with: L3-TEST-GEN-004

**Planned Implementation**: Phase 2 Week 3

---

### Infrastructure Sub-agents (From Repository)

#### L3-INFRA-001: Profile Configuration Sub-agent 📦
**Status**: From Repository | **Priority**: P2 | **Phase**: 2

**Description**: Configures Spring Profiles to support InMemory and Outbox modes. Handles profile isolation.

**Responsibilities**:
- Configure Spring Profile isolation
- Exclude DataSource auto-configuration
- Setup conditional Bean loading
- Configure properties files
- Organize Configuration classes
- Prevent profile conflicts

**Applicable Layers**: 4

**Source**: Repository SUB-AGENT-SYSTEM.md

**Relationships**:
- Calls: []
- Called by: L2-ARCH-001
- Coordinates with: L3-INFRA-002

**Planned Implementation**: Phase 2 Week 4

---

#### L3-INFRA-002: Outbox Pattern Implementation Sub-agent 📦
**Status**: From Repository | **Priority**: P2 | **Phase**: 2

**Description**: Implements Outbox Pattern for reliable event publishing. Generates OutboxData, OutboxMapper, OrmClient.

**Responsibilities**:
- Implement OutboxData interface (with @Transient)
- Design OutboxMapper inner class
- Define OrmClient interface
- Configure OutboxRepository
- Use Jakarta persistence annotations
- Handle versioning and optimistic locking

**Applicable Layers**: 4

**Source**: Repository SUB-AGENT-SYSTEM.md

**Relationships**:
- Calls: []
- Called by: L3-CODE-GEN-004
- Coordinates with: L3-INFRA-001

**Planned Implementation**: Phase 2 Week 4

---

### Frontend Sub-agents (From Repository)

#### L3-FRONT-001: Frontend Component Generation Sub-agent 📦
**Status**: From Repository | **Priority**: P3 | **Phase**: 3

**Description**: Generates React + TypeScript components with Tailwind CSS styling.

**Responsibilities**:
- Generate React functional components
- Define TypeScript props interfaces
- Apply Tailwind CSS styling
- Implement component composition
- Ensure accessibility (a11y)
- Optimize performance

**Applicable Layers**: 4

**Source**: Repository SUB-AGENT-SYSTEM.md

**Relationships**:
- Calls: L3-FRONT-002
- Called by: L2-SPEC-001
- Coordinates with: []

**Planned Implementation**: Phase 3

---

#### L3-FRONT-002: Frontend API Integration Sub-agent 📦
**Status**: From Repository | **Priority**: P3 | **Phase**: 3

**Description**: Generates frontend API integration code using RTK Query.

**Responsibilities**:
- Generate RTK Query API slices
- Define Request/Response types
- Implement error handling
- Configure data caching strategies
- Implement optimistic updates
- Integrate WebSocket if needed

**Applicable Layers**: 4

**Source**: Repository SUB-AGENT-SYSTEM.md

**Relationships**:
- Calls: []
- Called by: L3-FRONT-001
- Coordinates with: L3-CODE-GEN-003

**Planned Implementation**: Phase 3

---

## 📊 Implementation Roadmap

### Phase 0 (Current): Foundation
- **Completed**: Facilitator Agent ✅
- **Week 2**: BA Agent, Architect Agent
- **Week 3**: Requirements Engineer, QA Agent
- **Week 4**: Impact Analysis, Traceability

### Phase 1: Core Agents
- **Week 1**: Domain Expert Agent
- **Week 2**: Specification Writer Agent
- **Week 3**: Scrum Master Agent
- **Week 4**: QA Manager Agent, Error Handling, Validation, Authentication

### Phase 2: Advanced Features
- **Week 1-2**: Code Generation Suite (Command, Query, Controller, Aggregate, Reactor)
- **Week 3-4**: Testing Suite, Infrastructure (Profiles, Outbox), Specialized Agents

### Phase 3: Production Ready
- **Week 1-2**: Frontend, Monitoring, Deployment
- **Week 3-4**: Analytics, Payment, Localization, Advanced Features

---

## 🔗 Relationships Matrix

### Agent Dependencies
```
L1-EXEC-001 (Facilitator)
├── L2-REQ-001 (BA)
├── L2-ARCH-001 (Architect)
└── L2-DOM-001 (Domain Expert)

L2-REQ-001 (BA)
├── L2-REQ-002 (Requirements Engineer)
└── L3-CLARIFY-001 (Clarify)

L2-ARCH-001 (Architect)
├── L2-ARCH-002 (Infrastructure Architect)
├── L2-ARCH-003 (Security Architect)
└── L3-DESIGN-001 (Design)

L2-DOM-001 (Domain Expert)
├── L3-DOMAIN-001 (DDD Modeler)
└── L3-DOMAIN-002 (Event Modeler)
```

### Layer Coverage
- **Layer 0 (Idea)**: L1-EXEC-001, L2-REQ-001, L3-IMPACT-001, L3-TRACE-001
- **Layer 1 (Module)**: L2-ARCH-001, L3-IMPACT-001, L3-TRACE-001
- **Layer 2 (Domain)**: L2-DOM-001, L2-WORKFLOW-001, L3-IMPACT-001, L3-TRACE-001
- **Layer 3 (Requirements)**: L2-REQ-002, L2-QA-001, L3-IMPACT-001, L3-TRACE-001
- **Layer 4 (Specification)**: All Code Generation, Testing, and Infrastructure agents

---

## 📈 Progress Tracking

### By Priority
- **P0 (Critical)**: 5/7 implemented (71%)
- **P1 (Important)**: 0/12 implemented (0%)
- **P2 (Nice to have)**: 0/26 implemented (0%)
- **P3 (Future)**: 0/25 implemented (0%)

### By Phase
- **Phase 0**: 1/8 implemented (13%)
- **Phase 1**: 0/12 implemented (0%)
- **Phase 2**: 0/26 implemented (0%)
- **Phase 3**: 0/22 implemented (0%)

### By Category
- **Executive**: 1/4 implemented (25%)
- **Requirements**: 0/2 implemented (0%)
- **Architecture**: 0/1 implemented (0%)
- **Quality Assurance**: 0/1 implemented (0%)
- **Domain Modeling**: 0/1 implemented (0%)
- **Specification**: 0/1 implemented (0%)
- **Infrastructure**: 0/24 implemented (0%)
- **Analysis**: 0/2 implemented (0%)
- **Code Generation**: 0/5 implemented (0%)
- **Testing**: 0/5 implemented (0%)
- **Code Review**: 0/4 implemented (0%)
- **Frontend**: 0/2 implemented (0%)

---

## 🎯 Next Steps

### Immediate (Phase 0)
1. **Complete Phase 0 agents** (BA, Architect, Requirements Engineer, QA)
2. **Implement Impact Analysis and Traceability** (core ForgeMind features)
3. **Test agent coordination** (Facilitator calling other agents)

### Short Term (Phase 1)
1. **Domain Expert and Specification Writer** (complete 5-layer workflow)
2. **QA Manager and Scrum Master** (process management)
3. **Security and Error Handling** (production readiness)

### Medium Term (Phase 2)
1. **Code Generation Suite** (automated implementation)
2. **Testing and Review agents** (quality assurance)
3. **Infrastructure agents** (deployment, monitoring)

### Long Term (Phase 3)
1. **Frontend development** (complete UI)
2. **Advanced integrations** (payments, analytics)
3. **Enterprise features** (audit, compliance)

---

## 📚 Reference Documentation

- **Agent Prompt Template**: `.ai/agents/prompts/template.md`
- **Implementation Guidelines**: `.ai/docs/agent-implementation-guide.md`
- **Testing Standards**: `.ai/standards/agent-testing.md`
- **Integration Patterns**: `.ai/docs/agent-integration-patterns.md`

---

**Catalog Version**: 1.0.0  
**Last Updated**: 2025-10-23  
**Generated from**: agents-catalog.json  
**Next Review**: Phase 0 completion