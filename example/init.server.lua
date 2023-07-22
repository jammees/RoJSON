local JaSON = require(game:GetService("ReplicatedStorage").JaSON)

local example = {
	{
		string = "Hello world!",
		number = 101,
		nested_tbl = {
			{ "Hello" },
			{ "World" },
		},
		supported_types = {
			vec2 = Vector2.new(26, 363),
			vec3 = Vector3.new(0, 5, 0),
			enum_item = Enum.Font.Arcade,
			udim2 = UDim2.new(1, 500, 1, 500),
			udim = UDim.new(101, 101),
		},
	},
}

local json = JaSON.Encode(example)

function DeepCompare(tbl1, tbl2)
	for index, value in tbl1 do
		if typeof(value) == "table" and DeepCompare(tbl2[index], value) then
			continue
		end

		if typeof(value) ~= "table" and tbl2[index] == value then
			continue
		end

		return false
	end

	for index, value in tbl2 do
		if typeof(value) == "table" and DeepCompare(tbl1[index], value) then
			continue
		end

		if typeof(value) ~= "table" and tbl1[index] == value then
			continue
		end

		return false
	end

	return true
end

warn(`IsSame: {DeepCompare(example, JaSON.Decode(json))}`)
print(json)
