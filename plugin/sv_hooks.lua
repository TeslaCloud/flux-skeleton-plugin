--- Server-side hooks of the Skeleton plugin: the welcome message of players who join, unless
-- the `skeleton_greeting_enabled` config is off.

--- Welcomes a player once their client has finished loading and can show notifications.
-- @param actor [Player the player who has joined]
function Skeleton:PlayerInitialized(actor)
  if Config.get('skeleton_greeting_enabled') == false then return end

  actor:notify('notification.skeleton.welcome', { player = actor })
end
