if game.PlaceId == 9551640993 then
if _G.Executed == nil then
    _G.Executed = true
    game:GetService("Players").LocalPlayer.PlayerGui.Chat.Frame.ChatChannelParentFrame["Frame_MessageLogDisplay"].Scroller.ChildAdded:Connect(function(child)
        local okay = string.split(child.TextLabel.Text, " ")
        local kkay = string.split(child.TextLabel.Text, "[Server]: ")
        local Message = nil
        if okay[1] == "[Server]:" and okay[2] == game.Players.LocalPlayer.Name then
            for i,v in pairs(_G.PetsToPing) do
                if string.find(child.TextLabel.Text, v) then
                    Message = "[New Pet Hatched]" .. tostring(_G.Discord_UserID) .. ">"
                end
            end
                msg = {
                    ["content"] = Message,
                    ["embeds"] = {{
                        ["title"] = "Eggs Hatched: "..game:GetService("Players").LocalPlayer.leaderstats.Eggs.Value.."   |   ".."Coins: "..game:GetService("CoreGui").PlayerList.PlayerListMaster.OffsetFrame.PlayerScrollList.SizeOffsetFrame.ScrollingFrameContainer.ScrollingFrameClippingFrame.ScollingFrame.OffsetUndoFrame["p_"..game.Players.LocalPlayer.UserId].ChildrenFrame["GameStat_Coins"].OverlayFrame.StatText.Text,
                        ["description"] = kkay[2],
                        ["color"] = EE4B2B,
                    }}
                }
                local response = syn.request(
                    {
                        Url = _G.Webhook,
                        Method = "POST",
                        Headers = {
                        ["Content-Type"] = "application/json"
                        },
                        Body = game:GetService("HttpService"):JSONEncode(msg)
                    }
                )
            end
        end)
    end
end
print("Webhook Is now on")
