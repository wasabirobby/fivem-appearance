-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------

local curVersion = GetResourceMetadata(GetCurrentResourceName(), "version")
local resourceName = "fivem-appereance (" .. GetCurrentResourceName() .. ")"

CreateThread(function()
    while true do
        PerformHttpRequest("https://api.github.com/repos/wasabirobby/fivem-appearance/releases/latest", CheckVersion, "GET")
        Wait(3600000)
    end
end)

function CheckVersion(err, responseText, headers)
    local repoVersion, repoURL = GetLatestVersion()

    CreateThread(function()
        if curVersion ~= repoVersion then
            Wait(4000)
            print("^0[^3WARNING^0] " .. resourceName .. " is ^1NOT ^0up to date!")
            print("^0[^3WARNING^0] Your Version: ^2" .. curVersion .. "^0")
            print("^0[^3WARNING^0] Latest Version: ^2" .. repoVersion .. "^0")
            print("^0[^3WARNING^0] Get the latest Version from: ^2" .. repoURL .. "^0")
        else
            Wait(4000)
            print("^0[^2INFO^0] " .. resourceName .. " is up to date! (^2" .. curVersion .. "^0)")
        end
    end)
end

function GetLatestVersion()
    local repoVersion, repoURL = nil, nil

    PerformHttpRequest("https://api.github.com/repos/wasabirobby/fivem-appearance/releases/latest", function(err, response, headers)
        if err == 200 then
            local data = json.decode(response)

            repoVersion = data.tag_name
            repoURL = data.html_url
        else
            repoVersion = curVersion
            repoURL = "https://github.com/wasabirobby/fivem-appearance"
        end
    end, "GET")

    repeat
        Wait(50)
    until (repoVersion and repoURL)

    return repoVersion, repoURL
end
