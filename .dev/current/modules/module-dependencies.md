# Module Dependencies & Interfaces

**Version**: 0.1.0
**Last Updated**: 2025-10-27
**Layer**: 1 (MODULE)

## Overview

This document defines the dependencies and interfaces between the two core ForgeMind modules, ensuring proper integration and data flow.

## Module Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                 ForgeMind Framework                        │
├─────────────────────────────────────────────────────────────┤
│  ┌─────────────────┐  ┌─────────────────┐                   │
│  │ MODULE-001      │  │ MODULE-002      │                   │
│  │ Agent           │◄►│ Framework       │                   │
│  │ Orchestration   │  │ Infrastructure  │                   │
│  │ Engine          │  │ (Knowledge +    │                   │
│  │ (Skills +       │  │ Quality +       │                   │
│  │ Integration)    │  │ Context)        │                   │
│  │                 │  │                 │                   │
│  └─────────────────┘  └─────────────────┘                   │
└─────────────────────────────────────────────────────────────┘
```

## Dependencies

### MODULE-001: Agent Orchestration Engine
**Dependencies**: None (foundational layer)
**Depended By**:
- MODULE-002: Uses orchestration for context management and quality validation workflows

### MODULE-002: Framework Infrastructure
**Dependencies**:
- MODULE-001: Agent Orchestration Engine (for skill coordination and validation workflows)
**Depended By**:
- All AI tools using ForgeMind framework (provides infrastructure services)

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
1. **Agent Skill** generates artifact via MODULE-001 orchestration
2. **MODULE-002** stores artifact with metadata and manages context
3. **MODULE-002** validates artifact quality and constitution compliance
4. **MODULE-001** coordinates approval workflow
5. **MODULE-002** updates artifact status and context

### Validation Flow
1. **MODULE-002** runs validation checks on artifacts
2. **MODULE-002** reports results to MODULE-001
3. **MODULE-001** coordinates corrective actions if needed
4. **MODULE-002** updates validation status and context

### Impact Analysis Flow
1. **Change request** submitted via MODULE-001
2. **MODULE-002** performs impact analysis and context validation
3. **MODULE-002** provides affected artifacts list
4. **MODULE-001** coordinates review workflow
5. **MODULE-002** validates change implications against constitution

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