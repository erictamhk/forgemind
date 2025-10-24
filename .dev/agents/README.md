# Project-Specific Agents

This directory contains agents that are dynamically generated for specific project needs.

## Structure

```
.dev/agents/
├── README.md                          ← This file
├── domain-experts/                    ← Domain-specific agents
│   ├── hr-agent.md                    ← HR domain expert (example)
│   ├── finance-agent.md               ← Finance domain expert
│   └── [other domain agents]
└── specialized-assistants/            ← Project-specific assistants
    ├── data-migration-assistant.md    ← Data migration helper
    ├── legacy-integration-assistant.md ← Legacy system integration
    └── [other specialized assistants]
```

## Agent Types

### Domain Experts
- Generated based on project domain (e.g., HR, Finance, Manufacturing)
- Deep knowledge of specific business domains
- Help with domain modeling and business logic

### Specialized Assistants
- Generated for specific project needs
- Handle unique challenges or requirements
- Examples: data migration, legacy integration, performance optimization

## Generation Process

1. **Analysis**: Facilitator Agent analyzes project needs
2. **Template Selection**: Choose appropriate agent template from `.ai/templates/`
3. **Customization**: Adapt template for specific project context
4. **Integration**: Connect with ForgeMind system agents
5. **Testing**: Validate agent functionality

## Integration with System Agents

Project agents work alongside ForgeMind system agents:
- System agents handle generic processes (Facilitator, BA, Architect)
- Project agents provide domain expertise
- Seamless coordination through Facilitator Agent

## File Naming Convention

- `domain-experts/{domain}-agent.md`
- `specialized-assistants/{purpose}-assistant.md`

## Usage Examples

### Example 1: HR Domain Expert
```markdown
# HR Domain Agent

**Purpose**: Handle HR-specific business logic and compliance

**Responsibilities**:
- Employee lifecycle management
- Compliance with labor laws
- Benefits administration
- Performance management

**Integration**: Works with BA Agent for requirements, QA Agent for validation
```

### Example 2: Data Migration Assistant
```markdown
# Data Migration Assistant

**Purpose**: Handle complex data migration scenarios

**Capabilities**:
- Schema mapping
- Data transformation
- Validation rules
- Rollback procedures

**Integration**: Coordinates with Architect Agent for data architecture
```

## Generation Triggers

Project agents are generated when:
- **domain_expertise_required**: Project needs deep domain knowledge
- **specialized_task_identified**: Unique technical challenges identified
- **complex_business_logic**: Business rules exceed system agent capabilities

## Status

- **Current**: Structure created, ready for agent generation
- **Next**: Generate first domain expert based on project needs</content>
</xai:function_call"> 

<xai:function_call name="todowrite">
<parameter name="todos">[{"content":"Create structure for project-specific agents in .dev/agents/","status":"completed","priority":"medium","id":"create-project-agent-structure"}]