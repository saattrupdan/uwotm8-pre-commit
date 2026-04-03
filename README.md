# uwotm8-pre-commit

A pre-commit hook wrapper for [uwotm8](https://pypi.org/project/uwotm8/) - converts
American English to British English in your code.

## Quick Start

### 1. Add to your `.pre-commit-config.yaml`

```yaml
repos:
  - repo: https://github.com/saattrupdan/uwotm8-pre-commit
    rev: v0.1.0
    hooks:
      - id: uwotm8
      - id: uwotm8-check
      - id: uwotm8-comments-only
```

### 2. Install the hooks

```bash
pre-commit install
```

That's it! The hooks will now run automatically before every commit.

## Available Hooks

| Hook ID | Description | Files |
| --------- | ------------- | ------- |
| `uwotm8` | Converts American to British English | `.py`, `.txt`, `.md` |
| `uwotm8-check` | Check mode - shows what would change | `.py`, `.txt`, `.md` |
| `uwotm8-comments-only` | Python comments and docstrings only | `.py` |

## Author

- Dan Saattrup Smart ([@saattrupdan](https://github.com/saattrupdan), <dan.smart@alexandra.dk>)

## Acknowledgements

Built using the [uwotm8](https://pypi.org/project/uwotm8/) package by
[i.AI](https://github.com/GovernmentDigitalService/uwotm8), part of GDS in the
Department for Science, Innovation and Technology (DSIT).

## License

MIT
