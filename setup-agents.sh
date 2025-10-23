# Setup ForgeMind AGENTS.md System

#!/bin/bash

echo "=================================="
echo "ForgeMind AGENTS.md Setup"
echo "=================================="
echo ""

# Create .forgemind folder
echo "📁 Creating .forgemind/ folder..."
mkdir -p .forgemind

# Copy config template
echo "📄 Creating config.json..."

cat > .forgemind/config.json << 'EOF'
{
  "$schema": "https://forgemind.dev/schemas/config.v1.json",
  "version": "1.0",
  "project_name": "ForgeMind",
  "description": "AI-driven software development system for non-technical Boss",
  
  "current_context": {
    "idea": "IDEA-001",
    "phase": 0,
    "layer": 0,
    "clarity": 92
  },
  
  "agent_config": {
    "default_agent": "facilitator",
    "language": "auto",
    "auto_save": true,
    "auto_commit": false
  },
  
  "file_paths": {
    "ideas": ".dev/current/ideas",
    "modules": ".dev/current/modules",
    "domains": ".dev/current/domains",
    "requirements": ".dev/current/requirements",
    "specs": ".dev/current/specs"
  },
  
  "metadata": {
    "created": "$(date -Iseconds)",
    "last_updated": "$(date -Iseconds)",
    "last_session": "$(date -Iseconds)",
    "total_sessions": 0
  },
  
  "notes": [
    "This file is auto-updated by Facilitator Agent",
    "Modify with care or use 'facilitator update config' command",
    "Current context tracks active Idea, Phase, and Layer"
  ]
}
EOF

echo "✅ Created .forgemind/config.json"

# Add .gitignore entry for .forgemind if needed
if [ -f .gitignore ]; then
  if ! grep -q ".forgemind/" .gitignore; then
    echo "" >> .gitignore
    echo "# ForgeMind config (optional: remove this line if you want to commit config)" >> .gitignore
    echo ".forgemind/config.json.bak" >> .gitignore
    echo "✅ Added .forgemind/ to .gitignore"
  fi
fi

# Create README in .forgemind
cat > .forgemind/README.md << 'EOF'
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
EOF

echo "✅ Created .forgemind/README.md"

# Verify AGENTS.md exists
if [ ! -f AGENTS.md ]; then
  echo "⚠️  Warning: AGENTS.md not found in root directory"
  echo "   Please copy AGENTS.md to project root"
else
  echo "✅ AGENTS.md found"
fi

echo ""
echo "=================================="
echo "✅ Setup Complete!"
echo "=================================="
echo ""
echo "Created:"
echo "  • .forgemind/config.json"
echo "  • .forgemind/README.md"
echo ""
echo "Next steps:"
echo "  1. Verify AGENTS.md is in root directory"
echo "  2. Start your AI tool: opencode (or cursor, etc.)"
echo "  3. AI will auto-initialize as Facilitator Agent"
echo "  4. Type: facilitator status"
echo ""
echo "Configuration:"
echo "  • Project: $(grep -o '"project_name": "[^"]*"' .forgemind/config.json | cut -d'"' -f4)"
echo "  • Current Idea: $(grep -o '"idea": "[^"]*"' .forgemind/config.json | cut -d'"' -f4)"
echo "  • Current Phase: $(grep -o '"phase": [0-9]*' .forgemind/config.json | cut -d':' -f2 | tr -d ' ')"
echo ""
