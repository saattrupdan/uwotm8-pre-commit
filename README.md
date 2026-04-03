# uwotm8-pre-commit

A pre-commit hook wrapper for [uwotm8](https://pypi.org/project/uwotm8/) - converts
American English to British English in your code.

## Quick Start

### 1. Add to your `.pre-commit-config.yaml`

```yaml
repos:
  - repo: https://github.com/saattrupdan/uwotm8-pre-commit
    rev: v0.0.3
    hooks:
      - id: uwotm8
```

Optionally, you can add extra arguments to the hook:

```yaml
repos:
  - repo: https://github.com/saattrupdan/uwotm8-pre-commit
    rev: v0.0.3
    hooks:
      - id: uwotm8
        args:
          - --check
          - --comments-only
```

The `--comments-only` argument is the only one set by default. [Here is a list of all
the `uwotm8` arguments
available](https://i-dot-ai.github.io/uwotm8/usage/#command-line-options).

### 2. Install the hooks

```bash
pre-commit install
```

That's it! The hooks will now run automatically before every commit.

## Author

- Dan Saattrup Smart ([@saattrupdan](https://github.com/saattrupdan), <saattrupdan@gmail.com>)

## Acknowledgements

Built using the [uwotm8](https://pypi.org/project/uwotm8/) package by
[i.AI](https://github.com/GovernmentDigitalService/uwotm8), part of GDS in the
Department for Science, Innovation and Technology (DSIT).

## License

MIT
