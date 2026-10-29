--- Client side of the Skeleton plugin: the `skeleton_greet` console command, which greets the
-- player under the crosshair of the local player. Bind it to a key with
-- `bind g skeleton_greet`.

concommand.Add('skeleton_greet', function(client)
  if !IsValid(client) then return end

  local target = client:GetEyeTrace().Entity

  if IsValid(target) and target:IsPlayer() then
    Cable.send('fl_skeleton_greet', target)
  end
end)
