--Edited msg_checks.lua By @AbuAliAF
local TIME_CHECK = 30
local function pre_process(msg)
local data = load_data(_config.moderation.data)
local chat = msg.chat_id_
local user = msg.sender_user_id_
local is_channel = gp_type(chat) == "channel"
local is_chat = gp_type(chat) == "chat"
local auto_leave = 'auto_leave_bot'
local data = load_data(_config.moderation.data)
 msg.text = msg.content_.text_
  local groups = 'groups'
   if is_channel or is_chat then
    if msg.text then
  if msg.text:match("(.*)") then
    if not data[tostring(chat)] and not redis:get(auto_leave) and not is_admin(msg) then
  tdcli.sendMessage(msg.chat_id_, "", 0, "_This Is Not One Of My Groups_*", 0, "md")
  tdcli.changeChatMemberStatus(chat, our_id, 'Left', dl_cb, nil)
      end
   end
end
	if data[tostring(chat)] and data[tostring(chat)]['settings'] then
		settings = data[tostring(chat)]['settings']
	else
		return
	end
	if settings.mute_flood then
	mute_flood_user = settings.mute_flood
	else
		mute_flood = 'no'
	end
      if not is_mod(msg) then
if gp_type(chat) ~= 'pv' then
  if mute_flood == "yes" then
    local hash = 'user:'..user..':msgs'
    local msgs = tonumber(redis:get(hash) or 0)
        local NUM_MSG_MUTE_MAX = 5
        if data[tostring(chat)] then
          if data[tostring(chat)]['settings']['num_msg_mute_max'] then
            NUM_MSG_MUTE_MAX = tonumber(data[tostring(chat)]['settings']['num_msg_mute_max'])
          end
        end
    if msgs > NUM_MSG_MUTE_MAX then
  if is_mod(msg) then
    return
  end
  if msg.adduser then
    return
  end
if redis:get('sender:'..user..':mute_flood') then
return
else
   del_msg(msg.chat_id_, msg.id_)
  tdcli.sendMessage(msg.chat_id_, msg.id_, 0, "_User_ `[ "..user.." ]` _has been_ *kicked* _because of_ *Mute flooding*", 0, "md")
redis:setex('sender:'..user..':mute_flood', 30, true)
      end
    end
    redis:setex(hash, TIME_CHECK, msgs+1)
               end
           end
      end
   end
end
return {
	patterns = {},
	pre_process = pre_process
}
--End msg_checks.lua
