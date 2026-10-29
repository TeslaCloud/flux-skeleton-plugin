--- Server-side network receivers of the Skeleton plugin: the `fl_skeleton_greet` message, with
-- which the `skeleton_greet` console command greets the player under the crosshair. A player
-- may send it once a second, and only with the permission of the `skeleton` command.

Cable.receive('fl_skeleton_greet', function(actor, target)
  if !IsValid(actor) or !actor:can('skeleton') then return end
  if !isentity(target) or !IsValid(target) or !target:IsPlayer() then return end

  local cur_time = CurTime()

  if (actor.fl_next_skeleton_greet or 0) > cur_time then return end

  actor.fl_next_skeleton_greet = cur_time + 1

  Skeleton:greet(actor, target)
end)
