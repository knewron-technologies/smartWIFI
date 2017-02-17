local fName = "main";
local lcFile = fName..".lc";
local luaFile = fName..".lua";

if file.open(lcFile) ~= nil then
	file.close(lcFile);
	dofile(lcFile);
else
	if file.open(luaFile) ~= nil then
		node.compile(luaFile);
		file.remove(luaFile);
		dofile(lcFile);
	else
		printf("Hello !");
	end
end

fName = nil;
lcFile = nil;
luaFile = nil;
