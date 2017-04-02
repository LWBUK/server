/*
	Custom Marker Requirements:
	
	Spawn markers: The area covered by the marker will be used as the patrol and spawning area.
	
		1. Marker shape must be Ellipse (Could be rectangular but the function will consider the marker as elliptical regardless)
		2. Marker should have identical x and y dimensions. If they are different, the smaller dimension will be used instead.
	
	Blacklist markers: If a player is within this area, they will not be selected as a target for dynamic AI spawns.
	
		1. Marker shape may be Ellipse or Rectangle
		2. Marker dimensions should cover the area to be blacklisted.
	
	Example Marker (Note: the marker name must be unique! In this example, it's named "dzaicustomspawntest"):
	
	_this = createMarker ["dzaicustomspawntest", [6650.9883, 9411.541, -6.1035156e-005]];
	_this setMarkerShape "ELLIPSE";
	_this setMarkerType "Empty";
	_this setMarkerBrush "Solid";
	_this setMarkerSize [200, 200];
	_this setMarkerAlpha 0;
	_dzaicustomspawntest = _this;		//_dzaicustomspawntest must be a unique name
	
	Note: This marker is used in the example found in the custom_spawns config files.
*/

//----------------------------Add your custom markers below this line ----------------------------



_this = createMarker ["Novy", [9324.17,11502,0.00137329]];
	_this setMarkerShape "ELLIPSE";
	_this setMarkerType "Empty";
	_this setMarkerBrush "Solid";
	_this setMarkerSize [20, 20];
	_this setMarkerAlpha 0;
	_Novy = _this;	
	
	_this = createMarker ["Dichina", [4473.84,8291.04,0.00140381]];
	_this setMarkerShape "ELLIPSE";
	_this setMarkerType "Empty";
	_this setMarkerBrush "Solid";
	_this setMarkerSize [20, 20];
	_this setMarkerAlpha 0;
	_Dichina = _this;	
	
	_this = createMarker ["Threevalley", [12885.6,5609.57,0.00143433]];
	_this setMarkerShape "ELLIPSE";
	_this setMarkerType "Empty";
	_this setMarkerBrush "Solid";
	_this setMarkerSize [20, 20];
	_this setMarkerAlpha 0;
	_Threevalley = _this;	
	
	_this = createMarker ["Krutoy", [13174.7,3986.64,0.00143433]];
	_this setMarkerShape "ELLIPSE";
	_this setMarkerType "Empty";
	_this setMarkerBrush "Solid";
	_this setMarkerSize [20, 20];
	_this setMarkerAlpha 0;
	_Krutoy = _this;	

	//_this = createMarker ["NWAF1", [4155.21,10803.6,0.00143433]];
	//_this setMarkerShape "ELLIPSE";
	//_this setMarkerType "Empty";
	//_this setMarkerBrush "Solid";
	//_this setMarkerSize [30, 30];
	//_this setMarkerAlpha 0;
	//_NWAF1 = _this;	
	
	//_this = createMarker ["NWAF2", [4177.21,10738.6,0.00143433]];
	//_this setMarkerShape "ELLIPSE";
	//_this setMarkerType "Empty";
	//_this setMarkerBrush "Solid";
	//_this setMarkerSize [30, 30];
	//_this setMarkerAlpha 0;
	//_NWAF2 = _this;	