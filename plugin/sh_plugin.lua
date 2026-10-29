--- Skeleton is a demo plugin that shows one file of every kind a Flux plugin is built from.
-- Players greet each other with the `skeleton` command or by looking at someone and running
-- the `skeleton_greet` console command, which sends the `fl_skeleton_greet` message. Every
-- player counts the greetings they have received in their persistent player data
-- (`Skeleton:get_greetings`), and their HUD shows the count. Players are welcomed when they
-- join unless the `skeleton_greeting_enabled` config is off, and the `SkeletonCanGreet` hook
-- can refuse a greeting. `plugin.yml` limits the plugin to the development environment.
-- @environment [development]
-- @module [Skeleton]

PLUGIN:set_global('Skeleton')

require_relative 'cl_plugin'
require_relative 'cl_hooks'
require_relative 'sv_hooks'
