--- The greetings of the Skeleton plugin on the server: the checked entry point that the
-- command and the network receiver go through.

if !Skeleton then
  PLUGIN:set_global('Skeleton')
end

--- Makes a player greet another one: the greeted player's counter goes up by one and both are
-- told. A player cannot greet themselves, and the `PlayerCanGreet` hook may refuse the
-- greeting, in which case the greeting player is told so.
-- @param actor [Player the player who greets]
-- @param target [Player the player who is greeted]
-- @return [Boolean whether the greeting took place]
function Skeleton:greet(actor, target)
  if !IsValid(target) or !target:IsPlayer() then return false end

  --- Called on the server before a player greets another one, with the `skeleton` command or
  -- the `skeleton_greet` console command.
  -- @param actor [Player the player who greets]
  -- @param target [Player the player who is greeted]
  -- @return [Boolean return false to refuse the greeting; nothing lets it take place]
  if target == actor or hook.Run('PlayerCanGreet', actor, target) == false then
    actor:notify('error.skeleton.cant_greet', { target = target })

    return false
  end

  target:set_player_data(self.data_key, self:get_greetings(target) + 1)
  target:notify('notification.skeleton.greeted', { player = actor })
  actor:notify('notification.skeleton.greet_sent', { target = target })

  return true
end
