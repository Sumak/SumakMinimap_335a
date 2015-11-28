---------------------------------------------
-- func.lua
---------------------------------------------

local FCV, CFG, LOC = unpack(SumakDB)
local str

local str_len = string.len

FCV.trimString = function(str, length, dots)
if (not str) then
  return
end
       
local Bytes = str_len(str)
       
if (Bytes <= length) then
  return str
else
	local Len, Pos = 0, 1
               
  while (Pos <= Bytes) do
    Len = Len + 1
    local c = strbyte(str, Pos)
    if (c > 0 and c <= 127) then
			Pos = Pos + 1
			elseif (c >= 192 and c <= 223) then
				Pos = Pos + 2
			elseif (c >= 224 and c <= 239) then
				Pos = Pos + 3
      elseif (c >= 240 and c <= 247) then
        Pos = Pos + 4
      end
                       
      if (Len == length) then
        break
      end
    end
 
    if (Len == length and Pos <= Bytes) then
			return strsub(str, 1, Pos - 1) .. (dots and "..." or "")
    else
      return str
    end
  end
end
