# Home Assistant config check action

This action checks Home Assistant configuration against specified HA version.

## Usage

Please refer to [check_config documentation](https://www.home-assistant.io/docs/tools/check_config/)

Additional parameters for `hass` can be suppied by `HASS_EXTRA_ARGS` env.
Home Assistant version can be supplied using `ha_version` parameter (defaults to `latest`).

## Configuration

It checks configuration placed in repository root.
You can override config placement using `CONFIG_PATH` env.

## Secrets

If you use secrets in configuration which are not included in the repository,
you will have to create dummy file, e.g. `secrets.yaml.tmpl` and change its name before build (check example usage).

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
        with:
          ha_version: "latest"
        env:
          HASS_EXTRA_ARGS: "-f -s -i"
```
