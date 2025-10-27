# IDEA-001: ForgeMind System

> **Version**: v0.4.0
> **Status**: Ready for Layer 1 (MODULE)
> **Clarity**: 90%

## Vision

ForgeMind is a **framework + agent library** for existing AI tools (Claude Code, Gemini CLI, OpenCode, Codex) that enables **constitution-governed, disciplined software development**. It provides **68 specialized AI agents as Anthropic Agent Skills** - complete filesystem packages with SKILL.md files, YAML metadata, progressive disclosure (3-level loading), and supporting scripts - that AI tools can load and call, plus integration protocols, templates, and guidelines for systematic development processes.

You use ForgeMind within your preferred AI tool, and it coordinates specialized markdown agents (BA for requirements, Architect for design, Domain Expert for business logic, etc.) following Plan → Ask → Execute processes. All agents adhere to constitution principles, ensuring disciplined, hallucination-free development. The facilitator-agent (like this one) coordinates the overall process as a markdown agent that your AI tool calls.

## Goals

1. **Framework Integration** - Seamlessly works within existing AI tools (Claude Code, Gemini CLI, OpenCode, Codex)
2. **Agent Library** - Provides 68 specialized markdown agents that AI tools can call for specific development tasks
3. **Boss Mode** - You provide business decisions, ForgeMind agents handle all technical complexity
4. **Constitution Compliance** - All agents strictly adhere to project-principles.md governance rules
5. **Disciplined Process** - Plan → Ask → Execute ensures deliberate, approved actions within AI tools
6. **Markdown Agents** - Agents defined as markdown files that AI tools load and execute
7. **Two-Tier Agent System** - ForgeMind system agents + project-specific domain experts (all as markdown)
8. **Non-Linear Development** - Backtrack any layer anytime, 3-second Impact Analysis
9. **Zero Technical Debt** - AI auto-maintains consistency, bidirectional traceability
10. **Quality Assurance** - 21+ Anti-Hallucination checks prevent AI errors
11. **Open Source** - Freely available framework and agent library

## Target Users

- **Primary**: Small business owners who can't afford full development teams + Technical founders who want to accelerate development
- **Secondary**: Developers needing assistance with new projects, refactoring legacy code, or adding/changing features

## Pain Points

1. **Vague ideas and insufficient requirements**
2. **Lack of domain experts**
3. **AI lack of discipline** (not following rules, disordered code, inconsistent behavior)
4. **Cumbersome change management** (knowledge, ideas, specs, requirements, tech stack changes)
5. **Premature decisions** making software hard to change
6. **AI hallucinations and quality control** issues in code generation

## Success Metrics

- Time saved per project (e.g., 50% faster development)
- Cost reduction percentage (e.g., 70% lower development costs)
- Code quality scores (maintainability, bug rates)
- User satisfaction ratings (Boss and developer feedback)
- Project completion rates (percentage of projects finished on time)
- Clarity level improvements (idea clarity progression)
- **Plus**: Excellent change management with comprehensive records for all artifacts (knowledge, ideas, specifications, requirements, etc.)

## Technology Scope

- **Primary focus**: Enterprise applications
- **Includes**: Web apps, mobile apps, APIs, microservices, and other enterprise systems

## Integration Points

- **Git repository integration** (simplified, tracks project growth and version control)
- **CI/CD, IDE, and other integrations**: Not considered for initial phases

## Agent Architecture

ForgeMind implements a **Two-Tier Agent Architecture** within a 3-tier skill structure:

### Two-Tier Architecture
- **System Agents (ForgeMind)**: Core 68 agents that are part of the ForgeMind framework
- **Project Agents (Domain Experts)**: Dynamically generated agent skills for specific project domains

### 3-Tier Skill Structure
- **Level 1 (Executive)**: 4 system agents - Facilitator, Product Owner, Scrum Master, QA Manager
- **Level 2 (Department)**: 38 system agents - BA, Architect, Domain Expert, Requirements Engineer, Security, Performance, etc.
- **Level 3 (Sub-agents)**: 26 system agents - Impact Analysis, Traceability, Code Generation, Testing, etc.

Each agent skill follows **progressive disclosure** (metadata → instructions → resources) and integrates with **context engineering** for intelligent artifact loading/unloading.

## Constitution Foundation

ForgeMind is built on a constitution-based governance framework (project-principles.md) that ensures:

- **Agent Discipline**: All agents follow defined roles and principles strictly
- **Disciplined Process**: Plan → Ask → Execute for all operations
- **Constitution Compliance**: Continuous validation against governance rules
- **Two-Tier Architecture**: System agents (ForgeMind) + Project agents (domain experts)
- **Context Engineering**: Intelligent loading of only relevant artifacts
- **Anti-Hallucination**: Framework prevents AI fabrication and errors

## Modules

- **MODULE-001**: Agent Orchestration Engine (generates 68 system Agent Skills + project domain experts, coordinates multi-tool integration)
- **MODULE-002**: Framework Infrastructure (context engineering, knowledge artifact management, quality assurance, memory management)

## Current Status

- Layer 0 (Idea): 90% clarity ✅ **Complete - Ready for Layer 1**
- Planning phase: ✅ Complete
- Clarification phase: ✅ Complete (8 questions answered)
- Current: Ready for Layer 1 (MODULE) - System Architecture Definition



## Next Steps

1. Re-evaluate implementation approach
2. Align with original goals

## MVP Definition

### Communication Rules
- **Boss ↔ Facilitator only**: Agents never contact Boss directly
- **Facilitator gathers info**: Collects updates from BA/Architect/QA, reports to Boss
- **Boss approvals required**: All updates need Boss permission via Facilitator
- **Meeting records**: All agent interactions logged for traceability

### Success Criteria
- Constitution compliance: All agents follow project-principles.md rules
- Zero hallucinations: 21+ anti-hallucination checks prevent AI errors
- Disciplined process: Plan → Ask → Execute for all operations
- Boss control: Only Facilitator communicates with Boss
- Quality gates: Each phase validated before proceeding
- Traceability: Meeting records maintain audit trail
- Non-linear support: Backtrack any layer anytime with 3-second impact analysis

## References

- Full documentation: `FORGEMIND-README.md`
- Artifact manifest: `ARTIFACT-MANIFEST.md`
- Knowledge base: `exports/forgemind_knowledge_base.json`
