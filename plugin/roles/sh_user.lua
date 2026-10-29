--- Adds the Skeleton command, and with it the `fl_skeleton_greet` message, to the `user` role,
-- and through it to every role based on it.

--- Allows the Skeleton command.
function ROLE:define_permissions()
  can 'skeleton'
end
