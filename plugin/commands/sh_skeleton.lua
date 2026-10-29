--- The Skeleton command: the player greets the targeted players.

CMD.name = 'Skeleton'
CMD.description = 'command.skeleton.description'
CMD.syntax = 'command.skeleton.syntax'
CMD.category = 'permission.categories.general'
CMD.arguments = 1
CMD.arg_types = { 'player' }
CMD.no_console = true

--- Greets every targeted player.
-- @param actor [Player the player running the command]
-- @param targets [List<Player> players to greet]
function CMD:on_run(actor, targets)
  for _, target in ipairs(targets) do
    Skeleton:greet(actor, target)
  end
end
