while {alive player} do {
if (tolower (animationstate player) == "awoppercmstpsoptwbindnon_awoppknlmstpsoptwbindnon_lnr") then {
	disableuserinput true;	disableuserinput true;	disableuserinput true;
	player action ["sitDown", player]; "User Input Disabled" call dayz_rollingMessages;
	sleep 10;
	disableuserinput false;disableuserinput false;disableuserinput false;
};
sleep 0.1;
};