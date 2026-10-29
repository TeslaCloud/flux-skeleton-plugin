--- The greeting counter of the Skeleton plugin, read on both realms. A client only knows the
-- count of its local player.

if !Skeleton then
  PLUGIN:set_global('Skeleton')
end

--- The key of the player data value that counts the greetings a player has received.
Skeleton.data_key = 'skeleton_greetings'

--- Returns how many greetings a player has received, over all of their sessions.
-- @param target [Player]
-- @return [Number 0 for a player who has never been greeted, and on the client for anyone but
--   the local player]
function Skeleton:get_greetings(target)
  return target:get_player_data(self.data_key, 0)
end
