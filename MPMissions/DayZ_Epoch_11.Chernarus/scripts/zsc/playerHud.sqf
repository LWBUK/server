private ["_wpui","_vitals","_money","_Bank_Balance"];
disableSerialization;

while {true} do {
	1000 cutRsc ["ZSC_Money_Display","PLAIN"];
	_wpui = uiNameSpace getVariable "ZSC_Money_Display";
	_vitals = _wpui displayCtrl 4900;
	_money = player getVariable[Z_MoneyVariable,0];
	_Bank_Balance 	= player getVariable["MoneySpecial",0];
	_vitals ctrlSetStructuredText parseText format 
["
	<t size='1'> %1 </t><img size='1' align='right' image='scripts\zsc\images\coins.paa'/><br/>
	<t size='1'> %2 </t><img size='1' align='right' image='scripts\zsc\images\Bank.paa'/><br/>",
	
	[_money] call BIS_fnc_numberText,
	[_Bank_Balance] call BIS_fnc_numberText
];
	_vitals ctrlCommit 0;
    sleep 1.5;
};
