# JaSON
 A simple JSON implementation that supports roblox types (e.g. Vector2)

Version: 0.1

# Note:

It is recommended to replace the `PREFIX` to something else if it is being used in your code base!

# API:

## .Encode(`table`): `string`

Encodes the given table into a JSON formatted string.

### Supported constructors/values

- string
- table
- vector2
- vector3
- nil
- boolean
- number
- enumitem
- UDim
- UDim2

### Example

```lua
	local JaSON = require(PATH_TO_MODULE)

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

	print(json)
	```

## .Decode(`string`): `table`

Decodes the JSON string and reconverts it into a table.

### Example

```lua
	local JaSON = require(PATH_TO_MODULE)

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
	local decodedJson = JaSON.Decode(json)

	print(json)
	print(decodedJson)
	```