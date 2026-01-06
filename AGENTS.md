# AGENTS.md

## What this repo is

- Haxe externs and stdlib overrides for Node.js.
- Primary code lives under `src/`.
- `examples/` are small compilable samples.

## About this fork

- This is a fork of the original `hxnodejs` library.
- This fork is intended to be installed via `haxelib git`.
- **CAUTION:** Do not run release or deploy workflows in this fork.
  - No `Release.hx`.
  - No `deploy.hxml` or `ci/` publish steps (those target gh-pages for upstream).

## Development environment setup

Run these once so `build.hxml` can find the library:

1) `haxelib newrepo`
2) `haxelib dev hxnodejs .`

## Typical workflow for changes

1) Make changes in `src/`.
2) Verify the code compiles and examples build: `haxe build.hxml`

## Notes

- `ImportAll.hx` is a macro helper that forces all types under `src/` to load.
- `ci/` exists for upstream gh-pages deployment; ignore for this fork.
