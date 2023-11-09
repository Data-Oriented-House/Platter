local function grade(str)
	local lines = string.split(str, "\n")

	local grades = ""

	if #lines[2] > 6 then grades ..= 0 end
	if #lines[3] > 6 or #lines[4] > 1 or #lines[5] > 1 then grades ..= 1 end
	if #lines[6] > 6 or #lines[7] > 1 or #lines[8] > 1 then grades ..= 2 end
	if #lines[9] > 6 then grades ..= 3 end

	return grades
end

local function prototype(gradea, gradeb)
	local fullproduct = [[

		a[0] * b[0] + a[1] * b[1] + a[2] * b[2] + a[3] * b[3] - a[4] * b[4] - a[5] * b[5] - a[6] * b[6] - a[7] * b[7],
		a[0] * b[1] + a[1] * b[0] - a[2] * b[4] + a[3] * b[6] + a[4] * b[2] - a[5] * b[7] - a[6] * b[3] - a[7] * b[5],
		a[0] * b[2] + a[1] * b[4] + a[2] * b[0] - a[3] * b[5] - a[4] * b[1] + a[5] * b[3] - a[6] * b[7] - a[7] * b[6],
		a[0] * b[3] - a[1] * b[6] + a[2] * b[5] + a[3] * b[0] - a[4] * b[7] - a[5] * b[2] + a[6] * b[1] - a[7] * b[4],
		a[0] * b[4] + a[1] * b[2] - a[2] * b[1] + a[3] * b[7] + a[4] * b[0] - a[5] * b[6] + a[6] * b[5] + a[7] * b[3],
		a[0] * b[5] + a[1] * b[7] + a[2] * b[3] - a[3] * b[2] + a[4] * b[6] + a[5] * b[0] - a[6] * b[4] + a[7] * b[1],
		a[0] * b[6] - a[1] * b[3] + a[2] * b[7] + a[3] * b[1] - a[4] * b[5] + a[5] * b[4] + a[6] * b[0] + a[7] * b[2],
		a[0] * b[7] + a[1] * b[5] + a[2] * b[6] + a[3] * b[4] + a[4] * b[3] + a[5] * b[1] + a[6] * b[2] + a[7] * b[0]
]]

	local gradesa = string.split(gradea, "")
	local gradesb = string.split(gradeb, "")

	local gradesainv = {}
	local gradesbinv = {}

	local ranges = { ["0"] = {0}, ["1"] = {1, 2, 3}, ["2"] = {4, 5, 6}, ["3"] = {7}}

	for i = 0, 3 do
		if not table.find(gradesa, tostring(i)) then 
			table.move(ranges[tostring(i)], 1, #ranges[tostring(i)] + 1, #gradesainv + 1, gradesainv)
		end
		if not table.find(gradesb, tostring(i)) then
			table.move(ranges[tostring(i)], 1, #ranges[tostring(i)] + 1, #gradesbinv + 1, gradesbinv)
		end 
	end

	for i, v in gradesainv do
		fullproduct = string.gsub(fullproduct, "[%+%-]? ?a%[".. v .. "%] %* b%[%d%] ?", "", 500)
	end

	for i, v in gradesbinv do
		fullproduct = string.gsub(fullproduct, "[%+%-]? ?a%[%d%] %* b%[" .. v .. "%] ?", "", 500)
	end

	fullproduct = string.gsub(fullproduct, "%c%w*,%w*", "", 500)
	fullproduct = string.gsub(fullproduct, "\t[%+%-] ", "\t", 500)
	fullproduct = string.gsub(fullproduct, " [%+%-] ,", ",", 500)

	local gradetype = grade(fullproduct)
	local header = "pub fn geo" .. gradea .. "_" .. gradeb .. "(a: Grade" .. gradea .. ", b: Grade" .. gradeb .. ") Grade" .. gradetype .. " {\n\treturn .{"

	return header .. fullproduct .. "\t};\n}"
end

local grades = {"0", "1", "2", "3", "01", "02", "03", "012", "013", "023", "12", "13", "23", "123", "0123"}
print(prototype("13", "02"))