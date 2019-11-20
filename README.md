# Home Assistant config check action

This action check Home Assistant configuration.

## Usage

Please refer to: https://www.home-assistant.io/docs/tools/check_config/

## Configuration

Configuration must be placed in repository root or set by CONFIG_PATH env.

## Secrets

If you use secrets from outside repository, create dummy file, e.g. `secrets.yaml.tmpl`
and change its name before build.

## Example usage

```yaml
---
name: Config check
on: [push]
jobs:
  config-check-stable:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@master
      - run: mv secrets.yaml.tmpl secrets.yaml
      - uses: kpucynski/action-ha-config-check@master
```
