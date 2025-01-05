FONT_NORMAL			= 1
FONT_BOLD			= 2
FONT_BIGBOLD			= 3
FONT_NORMAL2			= 4

function MakeSetFont(fontType, mainFontSize)
	if fontType == FONT_NORMAL then
		Font = CreateFont(11, 0, 0, 0, 0, 0, 0, 0, 0x01, 0, 0, 3, 0, "Tahoma");
		return Font
	elseif fontType == FONT_BOLD then
		Font = CreateFont(11, 0, 0, 0, 0, 0, 0, 0, 0x01, 0, 0, 3, 0, "Tahoma");
		return Font
	elseif fontType == FONT_BIGBOLD then
		Font = CreateFont(12, 0, 0, 0, 0, 0, 0, 0, 0x01, 0, 0, 3, 0, "Tahoma");
		return Font
	elseif fontType == FONT_NORMAL2 then
		Font = CreateFont(12, 0, 0, 0, 0, 0, 0, 0, 0x01, 0, 0, 3, 0, "Tahoma");
		return Font
	end
	MsgBox(fontType);
	return 0
end