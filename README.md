# Skeleton plugin for Flux

A small demo plugin for [Flux](https://github.com/TeslaCloud/flux-ce) with one file of every
kind a plugin is built from. Copy it to start a plugin of your own.

## What a Flux plugin is

A plugin is a folder that Flux finds by convention: `plugin.yml` describes it, and the files
in `plugin/` are included by their folder and realm prefix (`cl_` client, `sv_` server, `sh_`
both). Hooks are plain methods on the plugin's global table (`function Skeleton:PlayerSpawn()`),
and commands, roles, config definitions and phrases are one file each in the folder named
after their kind. Plugins live in `flux-ce/plugins` (framework plugins) or in
`<schema>/plugins` (schema plugins).

## Installing

Clone the repository into a plugins folder under the name `skeleton_plugin`:

```
git clone https://github.com/TeslaCloud/flux-skeleton-plugin.git <schema>/plugins/skeleton_plugin
```

Every plugin in the schema's `plugins` folder loads by itself. When you clone it into
`flux-ce/plugins/skeleton_plugin` instead, add `skeleton_plugin` to the `depends` list of
your schema's `<schema>.yml`. The plugin only loads in the `development` environment; remove
the `environment` line of `plugin.yml` to run it elsewhere.

## What it does

Players greet each other with `/skeleton <target>`, or by looking at a player and running the
`skeleton_greet` console command (`bind g skeleton_greet`). Each player counts the greetings
they have received, across sessions, and sees the count in the top right corner of the HUD.
Players are welcomed when they join unless the `skeleton_greeting_enabled` config is off.

## Files

- `plugin.yml`: name, description, author and the environment the plugin loads in.
- `plugin/sh_plugin.lua`: the main file; sets the `Skeleton` global and includes the root files.
- `plugin/lib/sh_skeleton.lua`: `Skeleton:get_greetings`, the counter kept in the player data.
- `plugin/lib/sv_skeleton.lua`: `Skeleton:greet`, the checked entry point that runs the `PlayerCanGreet` hook.
- `plugin/cl_plugin.lua`: the `skeleton_greet` console command, which sends the `fl_skeleton_greet` message.
- `plugin/cl_hooks.lua`: the HUD counter, translated only when the count or the language changes.
- `plugin/sv_hooks.lua`: the welcome notification when a player joins.
- `plugin/nethooks/sv_skeleton.lua`: the receiver of `fl_skeleton_greet`, with validity, type, permission and rate checks.
- `plugin/commands/sh_skeleton.lua`: the `/skeleton` command.
- `plugin/roles/sh_user.lua`: grants the `skeleton` permission to the `user` role and the roles based on it.
- `plugin/config/config.yml`: the definition of the `skeleton_greeting_enabled` config.
- `plugin/languages/{en,es,fr,ru}.yml`: every phrase the plugin shows, in four languages.
- `.proofreader.yml`: the lint rules Flux code is checked against.

## License

MIT, see [LICENSE](LICENSE).
