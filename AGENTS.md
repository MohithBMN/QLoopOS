# QLoopOS — Engineering Instructions

## Project Vision
QLoopOS is an independent, open-source operating system project under Quantum Loop.

The goal is to build a modern, mobile-first operating system with an original graphical interface, system framework and application ecosystem.

The system should eventually support mobile devices, desktops and potentially wearables.

## Architecture
- Linux-based operating system foundation.
- Qt 6 and Qt Quick/QML for the graphical interface.
- C++20 for system-level components.
- Wayland for display and window management.
- CMake and Ninja for builds.
- Python for development utilities and automation.

Keep the graphical shell, system services, hardware abstraction, compositor and applications modular.

Do not tightly couple the graphical interface to a particular compositor.

## Licensing
- The base operating system and designated core components are open-source.
- Proprietary Quantum Loop services must remain independently maintainable.
- Review the licence of every dependency and component before distribution.
- Never copy proprietary or incompatible code into open-source components.
- Preserve required copyright notices and licence files.

## Engineering Rules
1. Inspect existing code before modifying it.
2. Preserve existing functionality, logic, comments and documentation.
3. Do not rewrite entire files unnecessarily.
4. Do not introduce unnecessary dependencies.
5. Avoid duplicated implementations.
6. Follow consistent C++20 and QML conventions.
7. Use modular, maintainable architecture.
8. Handle errors explicitly.
9. Avoid blocking the UI thread.
10. Consider the target hardware's limited resources.

## File Safety
- Never delete existing files without explicit user approval.
- Never remove existing code, comments, documentation or logic unnecessarily.
- If deletion is necessary, explain why and identify dependencies first.
- Report all proposed file deletions in the final implementation report.
- Do not overwrite user work without permission.

## Hardware Constraints
Primary development machine:
- Intel Core i3-1115G4
- 8 GB physical RAM
- Intel UHD Graphics
- 512 GB SSD
- Ubuntu 26.04.1 LTS

Keep builds lightweight.
Avoid unnecessary parallel compilation.
Do not assume powerful GPU acceleration or abundant memory.

## Development Workflow
For every implementation task:

1. Inspect the relevant project files.
2. Explain the proposed implementation briefly.
3. Make focused changes.
4. Build using CMake and Ninja.
5. Run relevant tests.
6. Fix introduced errors.
7. Report modified files, features, build results and outstanding issues.

Never claim something works without testing it.

## UI/UX Direction
QLoopOS should have an original, premium interface inspired by modern mobile operating systems.

Design priorities:
- Refined typography.
- Consistent spacing and visual hierarchy.
- Smooth animations.
- Responsive layouts.
- High-quality light and dark themes.
- Subtle translucency and depth.
- Accessible controls.
- Touch-friendly interactions.

Avoid generic dashboard templates and default-looking Qt interfaces.

## AI Development
Use the available AI tools to accelerate implementation, but maintain architectural consistency.

Do not create placeholder implementations when functional implementations are reasonably achievable.