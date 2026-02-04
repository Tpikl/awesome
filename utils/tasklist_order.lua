-- Manages custom tasklist ordering per screen.
-- Clients are initially sorted by X11 window ID, and can be
-- reordered via tasklist_order.swap_focused_forward/backward().

local awful = require("awful")

local tasklist_order = {}

-- Per-screen ordered list of window IDs.
-- Lazily initialised on first access per screen.
local screen_order = {}

--- Build (or rebuild) the order list for a screen from its current clients.
local function init_screen(s)
    local cls = s.all_clients
    table.sort(cls, function(a, b) return a.window < b.window end)
    local order = {}
    for i, c in ipairs(cls) do
        order[i] = c.window
    end
    screen_order[s] = order
end

--- Return an ordered client list for the given screen.
-- Used as the tasklist `source` callback.
function tasklist_order.source(s)
    local order = screen_order[s]

    -- Lazy init: first call or after screen reset.
    if not order then
        init_screen(s)
        order = screen_order[s]
    end

    -- Collect current clients keyed by window ID for fast lookup.
    local by_wid = {}
    for _, c in ipairs(s.all_clients) do
        by_wid[c.window] = c
    end

    -- Insert any new clients that aren't in the order list yet (append).
    for wid in pairs(by_wid) do
        local found = false
        for _, oid in ipairs(order) do
            if oid == wid then found = true; break end
        end
        if not found then
            order[#order + 1] = wid
        end
    end

    -- Build result, skipping stale entries (closed windows).
    local result = {}
    local cleaned = {}
    for _, wid in ipairs(order) do
        if by_wid[wid] then
            result[#result + 1] = by_wid[wid]
            cleaned[#cleaned + 1] = wid
        end
    end
    screen_order[s] = cleaned

    return result
end

--- Swap the focused client with its neighbour in the tasklist order.
-- @param direction  1 = forward (right), -1 = backward (left)
local function swap_focused(direction)
    local c = client.focus
    if not c then return end

    local s = c.screen
    -- Ensure order is initialised.
    if not screen_order[s] then
        init_screen(s)
    end
    local order = screen_order[s]

    -- Find the focused client's position.
    local idx
    for i, wid in ipairs(order) do
        if wid == c.window then
            idx = i
            break
        end
    end
    if not idx then return end

    local target = idx + direction
    if target < 1 or target > #order then return end

    -- Swap.
    order[idx], order[target] = order[target], order[idx]

    -- Force tasklist refresh by signalling a client list change.
    client.emit_signal("list")
end

--- Move the focused client one position to the right in the tasklist.
function tasklist_order.swap_focused_forward()
    swap_focused(1)
end

--- Move the focused client one position to the left in the tasklist.
function tasklist_order.swap_focused_backward()
    swap_focused(-1)
end

return tasklist_order
