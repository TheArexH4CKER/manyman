local genv = getgenv and getgenv() or {}
local renv = getrenv and getrenv() or {}

local clonefunction = genv.clonefunction or function(f) return f end
local cloneref = genv.cloneref or function(r) return r end
local hook = genv.hookfunction or function(f) return f end

local game = cloneref(renv.game)
local IsA = clonefunction(game.IsA)
local Index = clonefunction(getrawmetatable(game).__index)

local ReplicatedStorage = cloneref(game:GetService("ReplicatedStorage"))
local Mailbox = ReplicatedStorage:WaitForChild("Network"):WaitForChild("Mailbox: Send", 9e9)

local SlaveFunc = cloneref(Instance.new("RemoteFunction"))
local Invoke = SlaveFunc.InvokeServer

local OldInvoke
OldInvoke = hook(Invoke, function(self, ...)
    if IsA(self, "RemoteFunction") and (self == Mailbox or Index(self, "Name") == "Mailbox: Send") then
        local args = {...}
        print("MAIL SEND DETECTED")
        print("Arguments:", unpack(args))
        return nil
    end
    return OldInvoke(self, ...)
end)

local OldNamecall
OldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
    local method = getnamecallmethod()
    if IsA(self, "RemoteFunction") and (self == Mailbox or Index(self, "Name") == "Mailbox: Send") and (method == "InvokeServer" or method == "invokeServer") then
        local args = {...}
        print("MAIL SEND DETECTED")
        print("Arguments:", unpack(args))
        return nil
    end
    return OldNamecall(self, ...)
end)

print("Antimail Ran")


getgenv().Config = {
    Sniper = { --[[ Sniper Settings ]]
        Booth_Sniper = false,
        Auction_Sniper = false,
        Items = {
            Custom_Items = {
                ["Mini Pinata"] = {Class = "Misc", Price = 1},
                ["Golden Huge Happy Rock"] = {Class = "Pet", Price = 1},
                ["Rainbow Shiny Huge Happy Rock"] = {Class = "Pet", Price = "20%"}, -- If Rap is 10000 and the price is 20%, it will be 2000.
            },  
            ["All Huges"] = {Price = "50%", MaxPrice = 100000000},
            ["All Titanics"] = {Price = "70%", MaxPrice = 5000000000},
            ["All Eggs"] = {Price = "70%", MaxPrice = 30000000},
            ["All Exclusives"] = {Price = "70%", MaxPrice = 2500000},
        },
        Webhook = "",
    },
    Seller = { --[[ Seller Settings]]
        Active = true,
        Items = {
            ["Huge Mechatronic Robot"] = {Class = "Pet", Price = "95%"},
            ["Golden Huge Mechatronic Robot"] = {Class = "Pet", Price = "110%"},
            ["Rainbow Huge Mechatronic Robot"] = {Class = "Pet", Price = "110%"},
            ["Shiny Huge Mechatronic Robot"] = {Class = "Pet", Price = "120%"},
            ["Golden Shiny Huge Mechatronic Robot"] = {Class = "Pet", Price = "100%"},
            --["Rainbow Shiny Huge Mechatronic Robot"] = {Class = "Pet", Price = "100%"},

            ["Huge Abyssal Jellyfish"] = {Class = "Pet", Price = "95%"},
            ["Golden Huge Abyssal Jellyfish"] = {Class = "Pet", Price = "110%"},
            ["Rainbow Huge Abyssal Jellyfish"] = {Class = "Pet", Price = "110%"},
            ["Shiny Huge Abyssal Jellyfish"] = {Class = "Pet", Price = "120%"},
            ["Golden Shiny Huge Abyssal Jellyfish"] = {Class = "Pet", Price = "100%"},
            --["Rainbow Shiny Huge Abyssal Jellyfish"] = {Class = "Pet", Price = "100%"},

            ["Huge Corrupt Butterfly"] = {Class = "Pet", Price = "95%"},
            ["Golden Huge Corrupt Butterfly"] = {Class = "Pet", Price = "110%"},
            ["Rainbow Huge Corrupt Butterfly"] = {Class = "Pet", Price = "110%"},
            ["Shiny Huge Corrupt Butterfly"] = {Class = "Pet", Price = "120%"},
            ["Golden Shiny Huge Corrupt Butterfly"] = {Class = "Pet", Price = "100%"},
            --["Rainbow Shiny Huge Corrupt Butterfly"] = {Class = "Pet", Price = "100%"},

            ["Huge Temporal Owl"] = {Class = "Pet", Price = "95%"},
            ["Golden Huge Temporal Owl"] = {Class = "Pet", Price = "110%"},
            ["Rainbow Huge Temporal Owl"] = {Class = "Pet", Price = "110%"},
            ["Shiny Huge Temporal Owl"] = {Class = "Pet", Price = "120%"},
            ["Golden Shiny Huge Temporal Owl"] = {Class = "Pet", Price = "100%"},
            --["Rainbow Shiny Huge Temporal Owl"] = {Class = "Pet", Price = "100%"},
        },
        Webhook = "https://discord.com/api/webhooks/1239469009456599132/y6np4HvbW_Lv4aFnH6Pea530Bl1Ue6Yt0qebQWxF9_beBy70O-_DeKYa5xXw-88v-h0c",
    },
    Serverhop = { --[[ ServerHop Settings ]] 
        TeleportDelay = "1h", -- [ M | S | H ]
        Alts = {"","",""},
        ["Terminal"] = {
            Item = "Random_Config", -- [ ITEM ID | Random_Huge | Random_Titanic | Random_Config ]
            Class = "Misc", 
            Version = nil,
            Shiny = nil,
            Tier = nil,
        },
    }
    --[[ Made with ❤️ by LordHippo <3 ]]
}

-- AUTO CLAIM MAIL
spawn(function()
    while true do
        pcall(function()
            game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Mailbox: Claim All"):InvokeServer()
        end)
        task.wait(600)
    end
end)

script_key="NqatBodgtOOWRgqyBhzaJaQaKxscSuwF";
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/2950873095224144803c891c9a0f9c6d.lua"))()
