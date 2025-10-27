# Module Dependencies & Interfaces

**Version**: 0.1.0
**Last Updated**: 2025-10-27
**Layer**: 1 (MODULE)

## Overview

This document defines the dependencies and interfaces between the three core ForgeMind modules, ensuring proper integration and data flow.

## Module Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                    ForgeMind System                        │
├─────────────────────────────────────────────────────────────┤
│  ┌─────────────────┐  ┌─────────────────┐  ┌─────────────┐  │
│  │ MODULE-001      │  │ MODULE-002      │  │ MODULE-003  │  │
│  │ Agent           │◄►│ Knowledge &     │◄►│ Quality     │  │
│  │ Orchestration   │  │ Artifact        │  │ Assurance   │  │
│  │ Engine          │  │ Management      │  │ &           │  │
│  │                 │  │                 │  │ Validation  │  │
│  │ (Foundational)  │  │                 │  │             │  │
│  └─────────────────┘  └─────────────────┘  └─────────────┘  │
└─────────────────────────────────────────────────────────────┘
```

## Dependencies

### MODULE-001: Agent Orchestration Engine
**Dependencies**: None (foundational layer)
**Depended By**:
- MODULE-002: Uses orchestration for artifact processing workflows
- MODULE-003: Uses orchestration for validation workflows

### MODULE-002: Knowledge & Artifact Management
**Dependencies**:
- MODULE-001: Agent Orchestration Engine (for workflow coordination)
**Depended By**:
- MODULE-001: Provides artifact storage and retrieval
- MODULE-003: Provides artifacts for validation

### MODULE-003: Quality Assurance & Validation
**Dependencies**:
- MODULE-001: Agent Orchestration Engine (for validation workflows)
- MODULE-002: Knowledge & Artifact Management (for artifact access)
**Depended By**:
- MODULE-001: Provides validation results
- MODULE-002: Provides quality metrics

## Interface Definitions

### Agent Orchestration Interfaces

#### IAgentCoordinator
```typescript
interface IAgentCoordinator {
  registerAgent(agent: AgentDefinition): Promise<AgentId>;
  executeWorkflow(workflow: WorkflowDefinition): Promise<WorkflowResult>;
  getAgentStatus(agentId: AgentId): Promise<AgentStatus>;
  validateConstitution(action: AgentAction): Promise<ValidationResult>;
}
```

#### IWorkflowEngine
```typescript
interface IWorkflowEngine {
  createWorkflow(definition: WorkflowDefinition): Promise<WorkflowId>;
  executeWorkflow(id: WorkflowId): Promise<WorkflowResult>;
  pauseWorkflow(id: WorkflowId): Promise<void>;
  resumeWorkflow(id: WorkflowId): Promise<void>;
}
```

### Knowledge Management Interfaces

#### IArtifactRepository
```typescript
interface IArtifactRepository {
  store(artifact: Artifact): Promise<ArtifactId>;
  retrieve(id: ArtifactId): Promise<Artifact>;
  update(id: ArtifactId, artifact: Partial<Artifact>): Promise<void>;
  delete(id: ArtifactId): Promise<void>;
  search(query: ArtifactQuery): Promise<Artifact[]>;
}
```

#### ITraceabilityEngine
```typescript
interface ITraceabilityEngine {
  createLink(from: ArtifactId, to: ArtifactId, type: LinkType): Promise<LinkId>;
  getLinks(artifactId: ArtifactId): Promise<Link[]>;
  analyzeImpact(change: ChangeRequest): Promise<ImpactAnalysis>;
  validateConsistency(): Promise<ConsistencyReport>;
}
```

### Quality Assurance Interfaces

#### IValidationEngine
```typescript
interface IValidationEngine {
  validateArtifact(artifact: Artifact): Promise<ValidationResult>;
  checkHallucinations(content: string): Promise<HallucinationReport>;
  assessQuality(artifact: Artifact): Promise<QualityScore>;
  generateReport(artifacts: Artifact[]): Promise<QualityReport>;
}
```

#### IQualityGate
```typescript
interface IQualityGate {
  defineGate(gate: QualityGateDefinition): Promise<GateId>;
  evaluateArtifact(artifactId: ArtifactId, gateId: GateId): Promise<GateResult>;
  getGateStatus(artifactId: ArtifactId): Promise<GateStatus[]>;
  approveArtifact(artifactId: ArtifactId, gateId: GateId): Promise<void>;
}
```

## Data Flow

### Artifact Creation Flow
1. **Agent** generates artifact via MODULE-001 orchestration
2. **MODULE-002** stores artifact with metadata
3. **MODULE-003** validates artifact quality
4. **MODULE-001** coordinates approval workflow
5. **MODULE-002** updates artifact status

### Validation Flow
1. **MODULE-003** requests artifacts from MODULE-002
2. **MODULE-003** runs validation checks
3. **MODULE-003** reports results to MODULE-001
4. **MODULE-001** coordinates corrective actions if needed
5. **MODULE-002** updates validation status

### Impact Analysis Flow
1. **Change request** submitted via MODULE-001
2. **MODULE-002** performs impact analysis
3. **MODULE-002** provides affected artifacts list
4. **MODULE-001** coordinates review workflow
5. **MODULE-003** validates change implications

## Integration Points

### External Systems
- **Git Repository**: Version control integration
- **File System**: Artifact persistence
- **Boss Interface**: Human approval workflows

### Internal Communication
- **Event Bus**: Asynchronous communication between modules
- **Shared Database**: Common data access layer
- **API Gateway**: Module-to-module communication

## Next Steps

1. Implement interface contracts
2. Create integration tests
3. Define data schemas
4. Document error handling
5. Create monitoring interfaces