ATMDialogTransferAmount = 23000;
ATMDialogPlayerBalance = 23001;
ATMDialogBankBalance = 23002;

ATMDialogUpdateAmounts = {
	ctrlSetText [AtmDialogPlayerBalance, format["%1 %2", (player getVariable [Z_MoneyVariable, 0] call BIS_fnc_numberText), CurrencyName]];
	ctrlSetText [AtmDialogBankBalance, format["%1 %2", (player getVariable ['MoneySpecial', 0] call BIS_fnc_numberText), CurrencyName]];
};

ATMDialogWithdrawAmount = {

	private ["_amount","_bank","_wealth"];

	_amount = parseNumber (_this select 0);	
	_bank = player getVariable ["MoneySpecial", 0];
	_wealth = player getVariable[Z_MoneyVariable,0];
	
	if(_amount > 999999) exitWith { cutText ["You can not withdraw more then 999,999 coins at once.", "PLAIN DOWN"]; };
	if(_amount < 1 or _amount > _bank) exitWith { cutText ["You can not withdraw more than is in your bank.", "PLAIN DOWN"]; };

	player setVariable[Z_MoneyVariable,(_wealth + _amount),true];
	player setVariable["MoneySpecial",(_bank - _amount),true];
	call player_forceSave;
	
	cutText [format["You have withdrawn %1 %2.", [_amount] call BIS_fnc_numberText, CurrencyName], "PLAIN DOWN"];

};

ATMDialogDepositAmount = {

	private ["_amount","_bank","_wealth"];

	_amount = parseNumber (_this select 0);
	_bank = player getVariable ["MoneySpecial", 0];
	_wealth = player getVariable[Z_MoneyVariable,0];

	if(_amount > 999999) exitWith { cutText ["You can not deposit more then 999,999 coins at once.", "PLAIN DOWN"]; };
    if (_amount < 1 or _amount > _wealth) exitWith { cutText ["You can not deposit more than you have.", "PLAIN DOWN"]; };

	if(LimitOnBank && ((_bank + _amount ) >  MaxBankMoney )) then {			
		cutText [format["You can only have a max of %1 %2", [MaxBankMoney] call BIS_fnc_numberText,CurrencyName], "PLAIN DOWN"];
	} else {
		player setVariable[Z_MoneyVariable,(_wealth - _amount),true];
		player setVariable["MoneySpecial",(_bank + _amount),true];
		cutText [format["You have deposited %1 %2", [_amount] call BIS_fnc_numberText, CurrencyName], "PLAIN DOWN"];
	};
	call player_forceSave;
	

};
