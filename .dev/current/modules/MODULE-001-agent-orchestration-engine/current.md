# MODULE-001: Agent Orchestration Engine

> **Version**: v1.0.0
> **Status**: Defined
> **Parent Idea**: IDEA-001

## Purpose

Coordinate and manage the 68+ AI agents and sub-agents that execute all technical work in ForgeMind. Each AI agent is a specialized AI assistant with a specific role, detailed prompt, and capabilities. This orchestration enables the "AI agents do all the work" vision by managing agent lifecycles, task delegation, and inter-agent communication.

**Two-Tier Agent System**:
- **ForgeMind System Agents**: Core agents (Facilitator, BA, Architect, QA, etc.) that manage the development process
- **Project-Specific Agents**: Domain experts dynamically generated per project (HR agents for HRMS, manufacturing agents for MRP, etc.)

## Key Responsibilities

1. **Agent Coordination**: Manage communication between Facilitator and specialized agents
2. **Workflow Management**: Orchestrate complex multi-agent workflows for development tasks
3. **Task Delegation**: Automatically assign tasks to appropriate agents based on expertise
4. **State Management**: Track agent execution status and coordinate handoffs
5. **Error Handling**: Manage agent failures and provide fallback strategies

## Core Components

### Agent Registry

- Maintain catalog of all 68+ agents and their capabilities
- Agent metadata management (prompts, expertise areas, dependencies)
- Dynamic agent discovery and registration

### Workflow Engine

- Define and execute multi-step agent workflows using both system and project agents
- Handle parallel and sequential agent execution across the 3 agent levels
- Dynamic workflow adaptation when project agents are spawned
- Workflow state persistence and recovery for interrupted sessions
- Task delegation based on agent expertise and prompt-defined roles
- Disciplined process integration: Plan → Ask → Execute validation
- Constitution compliance checks before workflow execution
- Agent discipline enforcement in parallel/sequential execution

### Communication Bus

- Standardized messaging protocol between agents for seamless collaboration
- Context sharing and data transfer across agent sessions
- Event-driven architecture for agent interactions and handoffs
- Integration with Boss (human) communication channels

### Orchestration Logic

- Decision algorithms for task-agent matching based on agent prompts and expertise
- Load balancing across available agents (considering prompt complexity)
- Priority and dependency management for multi-agent workflows
- Agent selection based on role definitions and current context
- Constitution compliance validation for all agent assignments
- Disciplined process enforcement in task delegation
- Agent discipline monitoring in orchestration decisions

## Domains

- **DOMAIN-001**: Agent Coordination (core orchestration logic)
- **DOMAIN-002**: Workflow Management (process definition and execution)
- **DOMAIN-003**: Communication Protocols (agent messaging standards)

## Dependencies

- **None** (This is the foundational orchestration layer)

## Depended By

- **MODULE-002**: Knowledge & Artifact Management (uses orchestration for artifact processing)
- **MODULE-003**: Quality Assurance & Validation (uses orchestration for validation workflows)
- **All future modules** requiring agent coordination

## Technical Architecture

### Folder Structure (Aligned with ForgeMind Structure)

```
.ai/agents/
├── prompts/
│   ├── level-1-executive/
│   │   └── facilitator-agent.md
│   ├── level-2-department/
│   │   ├── ba-agent.md
│   │   ├── architect-agent.md
│   │   └── [other agents]
│   └── level-3-subagents/
│       └── [sub-agent prompts]
├── orchestration/
│   ├── registry/
│   ├── coordinator/
│   └── executor/
├── workflow/
│   ├── definition/
│   ├── execution/
│   └── monitoring/
└── communication/
    ├── bus/
    ├── protocols/
    └── events/
```

### Key Interfaces

- `AgentCoordinator`: Main orchestration interface
- `WorkflowExecutor`: Workflow execution engine
- `AgentRegistry`: Agent catalog management
- `CommunicationBus`: Inter-agent messaging

## Success Criteria

- [ ] Can coordinate 10+ agents in parallel workflows
- [ ] Handles agent failures gracefully with fallbacks
- [ ] Maintains execution state across interruptions
- [ ] Provides real-time orchestration visibility
- [ ] Scales to 68+ agents without performance degradation

## Current Status

- Layer 1 (Module): ✅ Defined
- Ready for: Domain definition and implementation planning

## Constitution Integration

- Validates all orchestration decisions against constitution principles
- Enforces disciplined process in multi-agent workflows
- Ensures agent discipline across orchestration operations
- Integrates with anti-hallucination framework for decision validation

## Agent Creation Process

### System Agent Creation (ForgeMind Core)
To create a new ForgeMind system agent:
1. Define agent role and expertise area
2. Write detailed prompt with commands, principles, and capabilities (including constitution compliance)
3. Save prompt in appropriate level folder (`.ai/agents/prompts/level-X/`)
4. Register agent in orchestration system with constitution validation
5. Test agent integration and disciplined behavior

### Project Agent Generation (Domain Experts)
To generate project-specific domain experts:
1. Analyze project domain and requirements
2. Identify needed expertise areas (HR, manufacturing, finance, etc.)
3. Generate specialized prompts based on domain knowledge (constitution-compliant)
4. Spawn agents with project-specific context and discipline enforcement
5. Integrate into project workflows with constitution validation

## Next Steps

1. Define DOMAIN-001: Agent Coordination
2. Define DOMAIN-002: Workflow Management
3. Define DOMAIN-003: Communication Protocols
4. Create initial agent registry structure
5. Design workflow execution engine
6. Implement agent prompt validation and loading

## References

- Parent Idea: `IDEA-001`
- Agent Catalog: `.ai/docs/agents-catalog.md`
- Orchestration Patterns: Research materials
