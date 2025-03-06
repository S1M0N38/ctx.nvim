---
name: Bug report
about: Create a report to help us improve
title: "bug: [replace these brackets with the actual title]"
labels: bug
assignees: S1M0N38
---

**Versions**

- _OS_ \[e.g. macOS 15.1\]
- _Neovim_ \[e.g. 0.10.1\]
- _Plugin_ \[e.g. 0.1.1\]

## Test with `minimal.lua`

> [!IMPORTANT]
> Please do not skip this step. For most users, issues occur because of their Neovim configuration.

1. Create the file `repro.lua` with the same content of [repro/repro.lua](https://raw.githubusercontent.com/S1M0N38/ctx.nvim/refs/heads/main/repro/repro.lua)

2. Run Neovim using `repro.lua` as config:

```
nvim -u repro.lua
```

3. Reproduce the bug

4. All the artifacts will be stored in the `.repro` directory, you can share them with us (e.g. logs, states, etc.)

## Describe the bug

A clear and concise description of what the bug is and the expected behavior.

## Reproduce the bug

Write down the steps to reproduce the behavior:

1. Go to '...'
1. Click on '....'
1. Scroll down to '....'
1. See error

You can also include screenshot (simply drag and drop image or video in this text area)
