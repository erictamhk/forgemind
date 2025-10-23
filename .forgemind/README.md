# .forgemind/ Configuration

This folder contains ForgeMind project configuration.

## Files

### config.json
Current project context:
- Active Idea (IDEA-XXX)
- Current Phase (0-3)
- Current Layer (0-4)
- Clarity levels
- Agent preferences

**Auto-updated by**: Facilitator Agent
**Manually edit**: Use `facilitator update config` command

## Backup

Config is automatically backed up before changes:
- `config.json.bak` - Previous version
- Git tracks changes if committed

## Schema

Config follows JSON schema:
https://forgemind.dev/schemas/config.v1.json

(Schema documentation to be published)
