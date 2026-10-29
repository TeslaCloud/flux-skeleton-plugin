--- Client-side hooks of the Skeleton plugin: the greeting counter of the local player in the
-- top right corner of the HUD. The text is translated whenever the counter or the language
-- changes, so that drawing it costs nothing more than the draw call.

local draw_simple_text = draw.SimpleText
local text_color = Color(255, 255, 255, 220)
local greetings_text

--- Translates the greeting counter of the local player into the text the HUD shows, or
-- clears the text while the player has never been greeted.
local function update_text()
  local count = IsValid(PLAYER) and Skeleton:get_greetings(PLAYER) or 0

  greetings_text = count > 0 ? t('ui.skeleton.greetings', { count = count }) : nil
end

--- Draws the greeting counter of the local player.
-- @param _cur_time [Number current CurTime()]
-- @param scrw [Number screen width]
-- @param _scrh [Number screen height]
function Skeleton:HUDPaintAlive(_cur_time, scrw, _scrh)
  if !greetings_text then return end

  local margin = math.scale(8)

  draw_simple_text(greetings_text, Theme.get_font('text_small', 'default'), scrw - margin, margin, text_color,
    TEXT_ALIGN_RIGHT)
end

--- Updates the counter text when the data table of the local player arrives from the server.
-- @param entity [Entity the entity the variable belongs to]
-- @param key [String variable name]
function Skeleton:NetVarChanged(entity, key)
  if key == 'fl_data' and entity == PLAYER then
    update_text()
  end
end

--- Translates the counter text into the language the player has picked.
function Skeleton:LanguageChanged()
  update_text()
end

update_text()
