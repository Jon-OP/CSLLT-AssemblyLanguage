;---------------------------------------------{ Jonathan Owen Pang }---------------------------------------------
;--------------------------------------------------{ TP060491 }--------------------------------------------------
;------------------------------------{ CSLLT: Assignment - Enhanced Edition }------------------------------------

.MODEL SMALL
.STACK 100H

.DATA

;---------------------{ START: Display Banner }------------------------------------------------------------------

		;Banner for Main Menu: (m)ain (m)enu Banner
		mmBanner DB 09H, "+---------------------------------------------------------------+", 0AH, 09H
				 DB      "|                    ***FSEC-SS: Main Menu***                   |", 0AH, 09H
				 DB		 "+---------------------------------------------------------------+", 0AH, 09H
				 DB      "|                    1. Display Workshop Events                 |", 0AH, 09H
				 DB      "|                    2. Display Activity Events                 |", 0AH, 09H
				 DB      "|                    3. Display Competition Events              |", 0AH, 09H
				 DB      "|                    4. Exit FSEC-SS System                     |", 0AH, 09H
				 DB      "+---------------------------------------------------------------+", 0AH, 0AH
				 DB 09H, "Enter your Choice: $"
		
		;Banner Framework for all Events
		evBanner DB 09H, "+---------------------------------------------------------------+", 0AH, 09H
			     DB      "|                    ***FSEC-SS:                                |", 0AH, 09H
				 DB      "+--------+------------------------------+------------+----------+", 0AH, 09H
				 DB      "| Index  |         Event Name           | Price (RM) | Quantity |", 0AH, 09H
				 DB      "+--------+------------------------------+------------+----------+", 0AH, 09H
				 DB      "|   1.   |                              |            |    <>    |", 0AH, 09H
				 DB      "|   2.   |                              |            |          |", 0AH, 09H
				 DB      "|   3.   |                              |            |          |", 0AH, 09H
				 DB      "+--------+------------------------------+------------+----------+", 0AH, 09H
				 DB      "+---------------------- Enter 4 to Exit ------------------------+", 0AH, 0AH
				 DB 09H, "Select an Index to buy entry tickets.", 0AH, 09H
				 DB 	 "Enter your Choice: $"
		
		;Display User regarding Invalid Input: (er)ror Banner
		erBanner DB 09H, "+---------------------------------------------------------------+", 0AH, 09H
		     	 DB      "|                      ***Invalid Input***                      |", 0AH, 09H
				 DB		 "|                 <<Enter Any Key To Continue>>                 |", 0AH, 09H
				 DB		 "|                              ...                              |", 0AH, 09H
				 DB      "+---------------------------------------------------------------+", 0AH, 0AH,"$"
		
		;Display User regarding invalid quantity: (i)nvalid (q)uantity Banner
		iqBanner DB 09H, "+---------------------------------------------------------------+", 0AH, 09H
		     	 DB      "|                     ***Invalid Quantity***                    |", 0AH, 09H
				 DB		 "|                 <<Enter Any Key To Continue>>                 |", 0AH, 09H
				 DB		 "|                              ...                              |", 0AH, 09H
				 DB      "+---------------------------------------------------------------+", 0AH, 0AH,"$"
		
		;Display User regarding invalid team name: (i)nvalid (t)eam name Banner
		itBanner DB 09H, "+---------------------------------------------------------------+", 0AH, 09H
		     	 DB      "|                    ***Invalid Team Name***                    |", 0AH, 09H
				 DB		 "|                 <<Enter Any Key To Continue>>                 |", 0AH, 09H
				 DB		 "|                              ...                              |", 0AH, 09H
				 DB      "+---------------------------------------------------------------+", 0AH, 0AH,"$"
		
		;Display User regarding invalid confirm member input: (i)nvalid (m)ember Banner
		imBanner DB 09H, "+---------------------------------------------------------------+", 0AH, 09H
		     	 DB      "|                      ***Invalid Input***                      |", 0AH, 09H
		     	 DB      "|                 Enter 'Y' for Yes or 'N' or No                |", 0AH, 09H
				 DB		 "|                 <<Enter Any Key To Continue>>                 |", 0AH, 09H
				 DB		 "|                              ...                              |", 0AH, 09H
				 DB      "+---------------------------------------------------------------+", 0AH, 0AH,"$"	
		
		;Display User regarding invalid membership id: (i)nvalid (i)d Banner
		iiBanner DB 09H, "+---------------------------------------------------------------+", 0AH, 09H
		     	 DB      "|              ***Invalid FSEC-SS Membership ID***              |", 0AH, 09H
				 DB		 "|                 <<Enter Any Key To Continue>>                 |", 0AH, 09H
				 DB		 "|                              ...                              |", 0AH, 09H
				 DB      "+---------------------------------------------------------------+", 0AH, 0AH,"$"
		
		;Display User regarding Membership ID not found: (n)ot (f)ound Banner
		nfBanner DB 09H, "+---------------------------------------------------------------+", 0AH, 09H
		     	 DB      "|         ***FSEC-SS Membership ID Entered Not Found***         |", 0AH, 09H
				 DB		 "|                 <<Enter Any Key To Continue>>                 |", 0AH, 09H
				 DB		 "|                              ...                              |", 0AH, 09H
				 DB      "+---------------------------------------------------------------+", 0AH, 0AH,"$"
		
		;Display User regarding invalid finalization payment input: (i)nvalid input (2) Banner
		i2Banner DB 09H, "+---------------------------------------------------------------+", 0AH, 09H
		     	 DB      "|                      ***Invalid Input***                      |", 0AH, 09H
		     	 DB      "|                 Enter 'Y' for Yes or 'N' or No                |", 0AH, 09H
				 DB		 "|                              ...                              |", 0AH, 09H
				 DB      "+---------------------------------------------------------------+", 0AH, 0AH,"$"	
		
		;Display { Workshop / Activity / Competition } Details to User: (E)vent - (D)etails Banner
		;Initial Purchase Banner
		edBanner DB 09H, "+---------------------------------------------------------------+", 0AH, 09H
		     	 DB      "|        Event Name  :                                          |", 0AH, 09H
				 DB		 "|       Entry Price  : RM                                       |", 0AH, 09H
				 DB		 "|   Available Entry  :                                          |", 0AH, 09H
				 DB      "+---------------------------------------------------------------+", 0AH, 0AH, "$"

		;Display {Workshop / Activity } Details to User After Entering Quantity: (P)ost - (Q)uantity Banner
		;Purchase Banner for Workshop and Activity
		pqBanner DB 09H, "+---------------------------------------------------------------+", 0AH, 09H
		     	 DB      "|        Event Name  :                                          |", 0AH, 09H
				 DB		 "| Entries Purchased  :                                          |", 0AH, 09H
				 DB		 "|       Total Price  : RM                                       |", 0AH, 09H
				 DB      "+---------------------------------------------------------------+", 0AH, 0AH, "$"
		
		;Display Competition Details to User: (C)ompetition - (D)etails Banner
		;Purchase Banner for Competition
		cdBanner DB 09H, "+---------------------------------------------------------------+", 0AH, 09H
		     	 DB      "|        Event Name  :                                          |", 0AH, 09H
				 DB		 "|       Entry Price  : RM                                       |", 0AH, 09H
				 DB		 "|         Team Name  :                                          |", 0AH, 09H
				 DB      "+---------------------------------------------------------------+", 0AH, 0AH, "$"
		
		;Display Purchase Cancelled when use rejected the confirmation
		pcBanner DB 09H, "+---------------------------------------------------------------+", 0AH, 09H
		     	 DB      "|                   ***Purchase Cancelled***                    |", 0AH, 09H
				 DB		 "|                     Returning to Main Menu                    |", 0AH, 09H
				 DB		 "|                 <<Enter Any Key To Continue>>                 |", 0AH, 09H
				 DB		 "|                              ...                              |", 0AH, 09H
				 DB      "+---------------------------------------------------------------+", 0AH, 0AH,"$"

		;Complete Purchase Banner for Workshop and Activity: (t)hank (y)ou Banner 1
		tyBanner DB 09H, "     _____ ____  _____ ____     ____ ____  ", 0AH, 09H
				 DB		 "    |  ___/ ___|| ____/ ___|   / ___/ ___| ", 0AH, 09H
				 DB		 "    | |_  \___ \|  _|| |   ____\___ \___ \ ", 0AH, 09H
				 DB		 "    |  _|  ___) | |__| |__|_____|__) |__) |", 0AH, 09H
				 DB		 "    |_|   |____/|_____\____|   |____/____/ ", 0AH, 09H
				 DB		 "    +++++++++++++++++++++++++++++++++++++++", 0AH, 09H
				 DB		 "+-----------------------------------------------+", 0AH, 09H
				 DB		 "|                ***Thank You***                |", 0AH, 09H
				 DB		 "|               Please Come Again               |", 0AH, 09H
				 DB		 "|           <<Enter Any Key to Return>>         |", 0AH, 09H
				 DB      "|                      ...                      |", 0AH, 09H
				 DB      "+-----------------------------------------------+", 0AH, 0AH, "$"

		;Display Good Bye Message when User Exit the System: Good Bye Banner
		gbBanner DB 09H, 09H, "   ____                 _ _                ", 0AH, 09H
				 DB	09H, "  / ___| ___   ___   __| | |__  _   _  ___ ", 0AH, 09H
				 DB	09H, " | |  _ / _ \ / _ \ / _` | '_ \| | | |/ _ \", 0AH, 09H
				 DB	09H, " | |_| | (_) | (_) | (_| | |_) | |_| |  __/", 0AH, 09H
				 DB	09H, "  \____|\___/ \___/ \__,_|_.__/ \__, |\___|", 0AH, 09H
				 DB	09H, "                                |___/      ", 0AH, 09H
				 DB		 "+---------------------------------------------------------------+", 0AH, 09H
		     	 DB      "|                        ***Good Bye***                         |", 0AH, 09H
				 DB		 "|                   <<Enter Any Key To Exit>>                   |", 0AH, 09H
				 DB		 "|                              ...                              |", 0AH, 09H
				 DB      "+---------------------------------------------------------------+", 0AH, 0AH,"$"

;---------------------{ END: Display Banner }--------------------------------------------------------------------

		 
;---------------------{ START: Support Messages }----------------------------------------------------------------

		;Event Category
		eventCategory 	DB	"Workshop***$", "Activity***$", "Competition***$"

		;Prompt User to Enter Team Name: (t)eam (n)ame Banner
		tnPrompt		DB 09H, "[Enter !!! to Return to Main Menu]", 0AH
						DB 09H, "Minimum Team Name Length: 5 Characters", 0AH
						DB 09H, "Maximum Team Name Length: 20 Characters", 0AH
						DB 09H, "Enter your Team Name: $"

		;Prompt User to Enter Desired Quantity
		qtyPromptMsg	DB 09H, "[Enter !! to Return to Main Menu]", 0AH, 09H
						DB		"How many tickets would you like to buy?", 0AH, 09H
						DB      "Quantity: $"

		;Prompt User to enter Club ID for 50% Discount
		mbrPrompt		DB 09H, "FSEC-SS Club Members are entitled to 50% Discount", 0AH, 09H
						DB      "Are you a FSEC-SS Club Member? [ Y / N ]", 0AH, 09H
						DB      "Choice: $"

		;End Text to Prompt User for their Club ID for 50% Discount: (c)lub (no) Prompt
		cnoPrompt 		DB	0AH, 0AH, 09H, "*Your FSEC-SS Club ID is your TP Number [6 Characters]*"
						DB	0AH, 09H, "Enter your FSEC-SS Club ID", 0AH, 0AH
						DB	09H, 09H, 09H, 09H, "+----------+", 0AH
						DB	09H, 09H, 09H, 09H, "| TP______ |", 0AH
						DB	09H, 09H, 09H, 09H, "+----------+$"
		
		;Arrow to point old -> New total price
		updPrice		DB " --> RM $"

		;End Text for Finalizing Payment: (fin)alize Banner
		FinPayment 		DB 09H, "Finalize your payment? [ Y / N ]", 0AH, 09H
						DB      "Choice: $"

;---------------------{ END: Support Messages }------------------------------------------------------------------


;---------------------( START: Event Activity Details )----------------------------------------------------------

		;Preformatting for Workshop Events
		woNme    DB "Digital Forensic Workshop$", "Web Exploitation Workshop$", "Reverse Engineering Workshop$"
		woQty	 DB 16, 12, 10	;Initial Quantity of Digital Forensic, Web Exploit, Reverse Engineering
		woPrc	 DB 25, 30, 50	;Price of Digital Forensic, Web Exploit, Reverse Engineering

		;Preformatting for Activity Events
		acNme    DB "Digital Forensic Activity$", "Web Explotation Activity$", "Reverse Engineering Activity$"
		acQty	 DB 30, 30, 30	;Initial Quantity of Digital Forensic, Web Exploit, Reverse Engineering
		acPrc	 DB 15, 20, 20	;Price of Digital Forensic, Web Exploit, Reverse Engineering

		;Preformatting for Competition
		coNme    DB "Asia Pacific University CTF$", "FSEC-SS CTF Challenge: 2022$", "CTF Championship 2022$"
		coQty	 DB 30, 30, 30	;Initial Quantity of Digital Forensic, Web Exploit, Reverse Engineering
		coPrc	 DB 10, 30, 15	;Price of Digital Forensic, Web Exploit, Reverse Engineering

;---------------------( END: Event Activity Details )------------------------------------------------------------

;---------------------( START: System Flow Variables )-----------------------------------------------------------

		;User Chooses {1:Workshop, 2:Activity, 3:Competition}
		eventTypeIndex			DB '2'

		;User Chooses {1:Event_1, 2:Event_2, 3:Event_3}
		eventActivityIndex		DB '1'
		
		;Check if user escapes from entering a quantity {1: Continue, 2: Exit Quantity, 3: Invalid Input}
		quantityStatus			DB '1'
		
		;Check if user escapes from entering a team name {1: Continue, 2: Exit Team Name, 3:Invalid Input}
		teamNameStatus			DB '1'
		
		;Check if user state they are a member or not {1: Member, 2:Not a Member, 3:Invalid Input}
		membershipResponse		DB	'1'
		
		;Check if user is a club member {1: Club Member, 2: Not Club Member, 3: Invalid Input}
		membershipStatus		DB	'1'
		
		;Check if user finalized their payment {1: Yes, 2: No, 3: Error}
		paymentStatus			DB	'1'
		
		;Total Quantity Leading 0 Flag
		tQtyLead				DB '1'		;{1: There is a leading 0, 2: There is no leading 0}
		
		;Prebuilt Club Membership ID
		clubIDList				DB	"000000$", "111111$", "222222$","!" ;'!' is 'End of List Symbol'

		;Constant value used to convert large numbers to single character
		const_ten				DB 10			;Will never change
		const_div				DW 1000			;Changes when moving across totalPrice
		const_disc				DW 2			;50% Discount
		const_IDCtr				DB 0			;Internal Counter for the ID User entered

;---------------------( END: System Flow Variables )-------------------------------------------------------------

;---------------------( START: Input Variables )-----------------------------------------------------------------

		;Store Team Name Entered by Users [ TN = Team Name ]
		tnMaxLength			DB	21			;Maximum Length of Team Name
		tnInputCounter		DB	?			;Count Number of Characters entered by User
		tnTeamName			DB	21 DUP('$')	;Stores Actual Team Name

		;Store Quantity Entered by User [ Q = Quantity ]
		qMaxLength			DB	3			;Maximum Length of Quantity. Restrict to 3 Input (Include Line Feed)
		qInputCounter		DB	?			;Count Number of Characters entered by User
		userQuantity		DB	2 DUP(30H)	;Stores Actual Quantity Input by User, Initialized with 0
		
		;Store User's selected Event Price
		currentEventPrice 	DB 2 DUP(30H)	;Store user's selected event price
		totalPrice			DW	?
		totalPriceRemainder DW ?
		totalPriceCoins 	DW ?	;Holds coins

		;Store User's FSEC-SS Club Member ID
		idMaxLength			DB	7			;Maximum Length of FSEC-SS Club Member ID
		idInputCounter		DB	?			;Counts Number of Characters entered by User
		idMember			DB	6 DUP(30H)	;Stores Actual FSEC-SS Club Member ID

		;Store name of event selected by user
		eventNameCounter	DB	0
		eventName			DB	100 DUP ('$') ;Terminate String by $
		eventPrice			DB	?

;---------------------( END: Input Variables )-------------------------------------------------------------------

;---------------------( END: Data Segments )---------------------------------------------------------------------

.CODE

;---------------------( 1. Display Banners )---------------------------------------------------------------------

;[ 1.1 ] Clear TASM Console 
clearDisplay PROC
		MOV AH, 0H
		MOV AL, 03H
		INT 10H

	RET
	clearDisplay ENDP

;[ 1.2 ] Display Main Menu Banner of FSEC-SS System
displayMainMenu PROC
		CALL clearDisplay
		
		LEA DX, mmBanner
		MOV AH, 09H
		INT 21H

	RET
	displayMainMenu ENDP

;[ 1.3 ] Display Error Banner when user enters a bad input
displayError PROC			
		CALL clearDisplay	;Clear Console Screen
		
		;Load and Display Error Banner
		LEA DX, erBanner
		MOV AH, 09H
		INT 21H

		;Set Cursor Postion
		MOV AH, 02H
		MOV DL, 40			;X-Coordinate: 40
		MOV DH, 3			;Y-Coordinate: 3
		INT 10H

		;Await User to Input a Character 
		MOV AH, 08H			;Function [08H]: Input Character without Echo
		INT 21H
		
	RET
	displayError ENDP

;[ 1.4 ] Display Error Banner [Quantity Version] when user enters a bad quantity
displayQtyError PROC
		CALL clearDisplay	;Clear Console Screen
		
		;Load and Display Quantity Error Banner
		LEA DX, iqBanner
		MOV AH, 09H
		INT 21H
		
		;Set Cursor Position
		MOV AH, 02H
		MOV DL, 40
		MOV DH, 3
		INT 10H
		
		;Await User to Input a Character
		MOV AH, 08H
		INT 21H
		
	RET
	displayQtyError ENDP

;[ 1.5 ] Display Error Banner [Team Name Version] when user enters a bad team name
displayTeamNameError PROC
		CALL clearDisplay	;Clear Console Screen
		
		;Load and Display Team Name Error Banner
		LEA DX, itBanner
		MOV AH, 09H
		INT 21H
		
		;Set Cursor Position
		MOV AH, 02H
		MOV DL, 40
		MOV DH, 3
		INT 10H
		
		;Await User to Input a Character
		MOV AH, 08H	;Read Character Input without Echo
		INT 21H
		
	RET
	displayTeamNameError ENDP

;[ 1.6 ] User did not enter Y or N when prompted about Club Membership
displayMemberResponseErrorBanner PROC
		CALL clearDisplay	;Clear Console Screen
		
		;Load and Display Invalid Membership Response Banner
		LEA DX, imBanner
		MOV AH, 09H
		INT 21H
		
		;Set Cursor Position
		MOV AH, 02H
		MOV DL, 40
		MOV DH, 4
		INT 10H
		
		;Await User to Input a Character
		MOV AH, 08H		;Read Character Input without Echo
		INT 21H
		
	RET
	displayMemberResponseErrorBanner ENDP

;[ 1.7 ] User entered an invalid FSEC-SS Membership ID
displayBadMembershipIDBanner PROC
		CALL clearDisplay	;Clear Console Screen
		
		;Load and Display Invalid ID Banner
		LEA DX, iiBanner
		MOV AH, 09H
		INT 21H
		
		;Set Cursor Position
		MOV AH, 02H
		MOV DL, 40
		MOV DH, 3
		INT 10H
		
		;Await User to Input a Character
		MOV AH, 08H		;Read Character Input without Echo
		INT 21H
		
	RET
	displayBadMembershipIDBanner ENDP

;[ 1.8 ] ID entered by User does not exist in the predefined Database ( clubIDList )
displayIDNotFound PROC
		CALL clearDisplay	;Clear Console Screen

		;Load and Display ID Not Found Banner
		LEA DX, nfBanner
		MOV AH, 09H
		INT 21H
		
		;Set Cursor Position
		MOV AH, 02H
		MOV DL, 40
		MOV DH, 3
		INT 10H
		
		;Await User to Input a Character
		MOV AH, 08H		;Read Character Input without Echo
		INT 21H
	RET
	displayIDNotFound ENDP

;[ 1.9 ] Display Thank You Banner
displayTYBanner PROC

		;Clear Screen
		CALL clearDisplay
		
		;Display Thank You Banner Type 1
		LEA DX, tyBanner
		MOV AH, 09H
		INT 21H
		
		;Set Cursor Position
		MOV AH, 02H
		MOV DL, 32
		MOV DH, 10
		INT 10H
		
		;Await User to Input a Character
		MOV AH, 08H		;Read Character Input without Echo
		INT 21H
	RET
	displayTYBanner ENDP

;[ 1.10 ] Display Exit Banner when user exits the FSEC-SS System
displayExit PROC			
		CALL clearDisplay	;Clear Console Screen
		
		;Load and Display Exit Banner
		LEA DX, gbBanner
		MOV AH, 09H
		INT 21H
		
		;Set Cursor Position
		MOV AH, 02H
		MOV DL, 40
		MOV DH, 9
		INT 10H
		
		;Await User to Input a Character
		MOV AH, 08H			;Function [08H]: Input Character without Echo
		INT 21H
		
		;Set Cursor Position after Program Terminates
		MOV AH, 02H
		MOV DH, 12
		INT 10H

	RET
	displayExit ENDP

;---------------------( 2. Main Menu Handling )------------------------------------------------------------------
implementMainMenu PROC

	implementMainMenu_Start:
		;Clear Screen and Display Main Menu
		CALL displayMainMenu
		
		;Get User's Input: Character
		MOV AH, 01H
		INT 21H			;Character Input Stored in AL Register
		
		;Check if User Enters Less than 31H [ASCII Char: 1]
		CMP AL, 31H
		JL implementMainMenu_BadInput
		
		;Check if User Enters More than 34H [ASCII Char: 4]
		CMP AL, 34H
		JG implementMainMenu_BadInput
		
		;While AL > 0 && AL < 5
		MOV [eventTypeIndex], AL
		JMP implementMainMenu_End

	;User entered an Invalid Input. Display Error Message and JUMP to start
	implementMainMenu_BadInput:
		CALL displayError
		JMP implementMainMenu_Start
	
	implementMainMenu_End:
		
	RET
	implementMainMenu ENDP



;---------------------( 3. Displaying Activity Banner showing activities )---------------------------------------

;[ 3.1 ] Display Event Banner Framework
displayEventBannerFramework PROC
		CALL clearDisplay		;Clear Console Screen

		;Load and Display Event Banner Framework
		LEA DX, evBanner
		MOV AH, 09H
		INT 21H
		
	RET
	displayEventBannerFramework ENDP

;[ 3.2 ] Set Banner Title - EG: { Workshop***, Activity***, Competition*** }
setEventBannerTitle PROC
		;Set Cursor Position at Banner Title
		MOV AH, 02H
		MOV DL, 41					;X-Coordinate for Banner Title
		MOV DH, 1					;Y-Coordinate for Banner Title
		INT 10H

		LEA SI, eventCategory		;Pseudo-Array containing {"Workshop$", "Activity$", "Competition$"}
									;Load eventCategory to SI Register
		
		XOR DX, DX					;Reset DX Register to 0
		XOR BX, BX					;Reset BX Register to 0

		MOV CL, eventTypeIndex		;User chose either {1st, 2nd, 3rd Event}
		SUB CX, '1'					;Convert CX Register from Text to Integer Type
		JZ endTitle

	nextCharacterTitle:	
		MOV DL, [SI+BX]				;Load SI Register Location + 0 (Initial BX Value)
		INC BX						;Increase BX Value by 1 to Traverse ONE Character
		CMP DL, '$'					;$ signals End of String for an element in eventCategory
		JNE nextCharacterTitle		;$ not detected. Move to next Character until $ is reached
		LOOP nextCharacterTitle		;Decrement CX Value until desired Element in eventCategory is reached

	endTitle:		
		LEA DX, eventCategory[BX]	;CX = 0. We are at the desired Element. Load Position in eventCategory to DX Register
		MOV AH, 09H					;Use 'Print String' Function. Stop printing when $ is reached
		INT 21H

	RET
	setEventBannerTitle ENDP

;[ 3.3 ] Set Banner Event Name
setEventBannerName PROC
	PUSH BP					;Store whatever was in BP to Stack
	MOV BP, SP				;Move SI Value to BP
		
		MOV SI, 4[BP]			;Access nmeArray PUSHED to Stack in displayEventBanner MACRO
		XOR BX, BX				;Reset BX Register to 0s [0000 0000, 0000 0000]
		
		MOV CX, 3				;Loop 3 times for 3 Event Names

	nextRowName:	
		MOV AH, 02H				;Call 'Set Cursor Position' Function
		MOV DL, 19				;X-Coordinate for Event Name: 19
		MOV DH, 5				;Y-Coordinate for Event Name; 5
		ADD DH, 3				;Add 3 because I want to move 1 Row below for each iteration of CX
		SUB DH, CL
		
		INT 10H					;Execute 'Set Cursor Position' Function

		MOV AH, 02H				;Call 'Print Character' Function

	nextCharacterName:	
		MOV DL, [SI+BX]			;Get 1 Character at [Memory Location of nmeArray + BX]
		INC BX					;Increment BX by 1 to get Next Char in nmeArray
		CMP DL, '$'	
		JE endName				;'$' Reached. Jump TO B
		INT 21H					;Execute Print Character Function
		JMP nextCharacterName	;No '$' Reached. Continue Printing Character

	endName: 	
		LOOP nextRowName		;Loop to X. If CX = 0, Move to ENDP State

		POP BP					;Restore Previous BP Value

	RET
	setEventBannerName ENDP

;[ 3.4 ] Set Banner Event Quantity and Price
setEventBannerQtyPrc PROC
		PUSH BP					;Preserve BP Register value
		MOV BP, SP
		
		XOR DX, DX				;Preparation of 'End of Stack' Symbol: $
		MOV DX, '$'
		PUSH DX
		
		;Set Cursor Pointer Coordinate for Quantity
		MOV AH, 02H				;Call 'Set Cursor Position' Function
		MOV DL, 66				;X-Coordinate for Quantity: 5
		MOV DH, 5				;Y-Coordinate for Quantity: 5
		PUSH DX					;Store Cursor Pointer Coordinate for Quantity First
		
		;Set Cursor Pointer Coordinate for Price
		MOV DL, 54
		MOV DH, 5
		
		MOV SI, 6[BP]			;Load Array containing Price List from STACK
		
	nextColumnQtyPrc:	
		XOR BX, BX				;Reset BX Register Value to 0s
		MOV CX, 3				;Loop 3 times for 3 events
		
	nextRowQtyPrc:	INT 10H			;Execute 'Set Cursor Pointer' Function
		PUSH DX					;Store Cursor Pointer Coordinates. DX Registers will be used to print Integers
		
		MOV AL, [SI+BX]			;Get 1 Character at [Memory Location of prcArray + BX]
		AAM						;Parse AX Register to perform Addition by Spliting 21 to '2' and '1'
		ADD AX, 3030H			;Convert ASCII to Integer by Adding 0
		
		MOV DH, AL
		MOV DL, AH
		
		MOV AH, 02H
		INT 21H
		
		MOV DL, DH
		INT 21H
		
		POP DX					;Retrieve Cursor Pointer Coordinates. Previous DX Values Discarded by default
		
		ADD BX, 1				;Move to Next Element in prcArray
		ADD DH, 1				;Move to Next Row
		
		LOOP nextRowQtyPrc		;Loop to next row 3 times until CX = 0
		
		POP DX					;CX = 0. Retrieve the Next Coordinate
		CMP DX, '$'				;Did all viable values in STACK get popped?
		JE endPrcQty
		MOV SI, 4[BP]
		JNE nextColumnQtyPrc	;Move on to Quantity Column and repeat process
		
		;Both Quantity and Price has been set
	endPrcQty:	
		MOV AH, 02H			;Call 'Set Cursor Position' Function
		MOV DL, 27			;Set Cursor Position to proper location for users to input choices
		MOV DH, 12
		INT 10H

	POP BP				;Restore Previous BP Values

	RET
	setEventBannerQtyPrc ENDP

;[ 3.5 ] Master MACRO displaying the Main Event Banner
displayEventBanner MACRO nmeArray, prcArray, qtyArray
LOCAL evBannerStart, evBannerBadInput, evBannerEnd

evBannerStart:
		;Clear Console Display
		CALL clearDisplay
		
		;Display Event Banner Skeleton
		CALL displayEventBannerFramework	;Display Banner Skeleton
		
		;Set the Event Banner Title {Workshop, Activity, Competition}
		CALL setEventBannerTitle
		
		;Set the Event Names into the Event Banner
		LEA DX, nmeArray
		PUSH DX
		CALL setEventBannerName
		POP DX
		XOR DX, DX
		
		;Set the Event Price and Quantity into the Event Banner
		LEA SI, prcArray
		PUSH SI
		LEA SI, qtyArray
		PUSH SI
		CALL setEventBannerQtyPrc
		POP SI
		POP SI
		XOR SI, SI
		;POP and XOR are to erase any outcome of this Procedure affecting the overall system
		
		;Get User Input for Event Activity
		MOV AH, 01H
		INT 21H
		MOV [eventActivityIndex], AL
		
		;Input Validation: Ensure user enter between 1 - 4
		CMP [eventActivityIndex], 30H 
		JLE evBannerBadInput
		
		CMP [eventActivityIndex], 34H
		JG evBannerBadInput
		JMP evBannerEnd

	evBannerBadInput:

		CALL displayError
		JMP evBannerStart
		
	evBannerEnd:

	ENDM

;---------------------( 4. Make a Record of Event Selected by User )---------------------------------------------

copyEventName PROC
	PUSH BP				;Store BP Values beforehand
	MOV BP, SP			;Load Value pushed to STACK from SP to BP Register

		;Reset the eventName Variable for Subsequent Event Name Access
		XOR CX, CX
		MOV CL, 99
		LEA SI, eventName
	copyEventName_ResetEventName:
		;Reset eventName Variable First
		MOV AL, '$'
		MOV [SI], AL
		INC SI
		LOOP copyEventName_ResetEventName
		
		;Reset CX Register Values
		XOR CX, CX
	
		;Get Event Name List PUSHED to Stack
		MOV SI, 4[BP]					;4[BP] is where Event Name List is stored in the Stack
		MOV CL, [eventActivityIndex]	;Set a Counter. Implementation is similar to Random Access in High
										;	Programming Languages
		SUB CL, '1'						;SUB 31H to convert eventActivityIndex to DECIMAL and to address 
										;	Arrays starting at Position 0: How Arrays are Indexed
		XOR BX, BX						;Set BX Register ot 0. It will be used to access Characters stored
										; in nmeArray: Random Access on Index of Char Array
		CMP CL, 0
		LEA DI, eventName				;Load eventName to DI Register`

		JZ copyEventName_DesiredName	;We reached the Desired Name.

		
	copyEventName_NextName:
		MOV DL, [SI+BX]					;Load Character in nmeArray to DL Register
		INC BX							;Move to the Next Character in nmeArray
		CMP DL, '$'						;Check if an event name has been read
		JNE copyEventName_NextName		;If DL = '$', Then Check the CX Register Value
		LOOP copyEventName_NextName		;DL = '$'. But CX != 0. Loop until CX = 0 to reach the desired
										;	Event Name

	copyEventName_DesiredName:			;We reached the Right Event Name
		
		MOV DL, [SI+BX]					;Move Correct Char to DL Register
		CMP DL, '$'						;Check if End of Event Name is reached
		JE copyEventName_End			;If DL = '$', We are done copying the string
		MOV [DI], DL					;Copy the Char to eventName
		INC BX							;Traverse to next char to copy
		INC DI							;Traverse eventName to the next char
		JMP copyEventName_DesiredName	;Loop until DL = '$'


	copyEventName_End:

	POP BP
	RET
	copyEventName ENDP

;---------------------( 5. Display an Event Details )------------------------------------------------------------
;;Precursor to 6. and 7.

;[ 5.1 ] Set Cursor and Print Name
displayEventDetails_DisplayName PROC

		;Set Cursor Position
		MOV AH, 02H
		MOV DL, 31
		MOV DH, 1
		INT 10H
		
		;Display Event Name
		LEA DX, eventName
		MOV AH, 09H
		INT 21H
		
	RET
	displayEventDetails_DisplayName ENDP

;[ 5.2 ] Set the Quantity and Price of the Event
displayEventDetails_SetQuantityAndPrice PROC
	PUSH BP				;Store BP Values beforehand
	MOV BP, SP			;Load Value pushed to STACK from SP to BP Register

		;Set the Cursor Position to Print Event Quantity
		MOV DL, 31
		MOV DH, 3
		PUSH DX			;Store Cursor Position for Later Use
		
		;Set the Cursor Position for Entry Price
		MOV DL, 34
		MOV DH, 2
		MOV AH, 02H
		INT 10H
		
		;Load the Event Quantity List to SI Register
		MOV SI, 6[BP]
		MOV CL, 2			;CL = 2 because Max Quantity is 99
		
		;Get the Desired Index in Price and Quantity Array
		XOR BX, BX						;Eliminate any intefering values in BH
		MOV BL, [eventActivityIndex]
		SUB BL, 31H						;Convert ASCII Char to Decimal. Set Index position to 0

	displayEventDetails_Print:
		MOV AL, [SI+BX]					;Address Directly with the Quantity/Price
		
		;CL = 2, The system is printing Price
		;Set the selected event price to eventPrice
		CMP CL, 2
		JNE displayEventDetails_Print_Skip
		MOV eventPrice, AL
	
	displayEventDetails_Print_Skip:
		
		AAM								;Quantity and Price are stored in DECIMAL
		ADD AX, 3030H					;Unpack and Convert Decimal to ASCII
										;Example: AX = '3', '2'
		MOV DL, AH						;PRINT 3 First then only 2
		MOV DH, AL
		
		MOV AH, 02H
		INT 21H
		
		MOV DL, DH
		INT 21H
		
		CMP CL, 1						;If CL = 1 then We have printed both Quantity and Price
		JE displayEventDetails_End		;Jump to end
		
		MOV SI, 4[BP]					;Load Event Price List to SI
		POP DX							;Restore Price Cursor Position
		MOV AH, 02H						;Set the Cursor Position
		INT 10H
		LOOP displayEventDetails_Print	;Print out Price 

	displayEventDetails_End:
	POP BP					;Restore old BP Register values

	RET
	displayEventDetails_SetQuantityAndPrice ENDP

;[ 5.3 ] Master Macro Displaying Event Details
displayEventDetails MACRO nmeArray, prcArray, qtyArray
LOCAL displayEventDetails_Start

	displayEventDetails_Start:
		;Reset TASM Console Display
		CALL clearDisplay
		
		;Load and Display Event Detail Banner Framework
		LEA DX, edBanner
		MOV AH, 09H
		INT 21H
		
		;Make a Copy of Event Name
		LEA DX, nmeArray
		PUSH DX
		CALL copyEventName
		POP DX
		
		;Print Event Name
		CALL displayEventDetails_DisplayName
		
		;Load and Push prcArray to Stack
		LEA SI, prcArray
		PUSH SI
		
		;Load and Push qtyArray to Stack
		LEA SI, qtyArray
		PUSH SI
		CALL displayEventDetails_SetQuantityAndPrice
		POP SI
		POP SI
		
		;Load Cursor Position
		MOV AH, 02H
		MOV DH, 6
		MOV DL, 0
		INT 10H

	ENDM

;---------------------( 6. Prompt for Quantity [ Workshop, Activity ] )------------------------------------------

;[ 6.1 ] Prompt user to enter quantity and validate their input
promptQuantity PROC
	
	PUSH BP				;Store BP Values beforehand
	MOV BP, SP			;Load Value pushed to STACK from SP to BP Register

		;Restore Original Assumption: Quantity Entered by User is Valid
		MOV AL, '1'
		MOV [quantityStatus], AL

		;Print Quanitty Prompt Message
		LEA DX, qtyPromptMsg
		MOV AH, 09H
		INT 21H
		
		;Reset userQuantity to 0 
		MOV [userQuantity]  , 30H
		MOV [userQuantity+1], 30H
		
		;Get quantity from user: 2 Digits + 1 Line Feed / NewLine
		MOV AH, 0AH			;Read String Function
		LEA DX, qMaxLength
		INT 21H
		
		;Reset CX and SI Register
		XOR CX, CX
		XOR SI, SI

		;Set the Counter according to the number of inputs given by the user
		MOV CL, qInputCounter
	
	promptQuantity_checkUserEscape:
	
		;If user changed their mind, they enter the Escape Sequence: !!
		CMP [userQuantity], '!'
		JNE promptQuantity_validateInteger
		
		CMP [userQuantity+1], '!'
		JNE promptQuantity_validateInteger
		
		;User entered the Escape Sequence.
		MOV AL, '2'
		MOV [quantityStatus], AL	;quantityStatus = '2': User returns to main menu
		JMP promptQuantity_End
		
	promptQuantity_validateInteger:
		
		;Verify if user entered an empty String. 0 Digits and 1 LineFeed / NewLine
		CMP qInputCounter, ?
		JE promptQuantity_BadInput 
		
		;Integer Validation: Verify if User entered characters between [ 0 ~ 9 ] in ASCII
		CMP userQuantity[SI], 30H			;Check if User enter ASCII Character less than 30H
		JL promptQuantity_BadInput
		
		CMP userQuantity[SI], 39H			;Check if User enter ASCII Character less than 39H
		JG promptQuantity_BadInput

		INC SI
		LOOP promptQuantity_validateInteger
		
		;User entered numbers
		JMP promptQuantity_quantityComparisonProcedure
		
	promptQuantity_BadInput:
		CALL displayError
		
		;Set quantityStatus to 3. User has made an invalid input
		MOV AL, '3'
		MOV [quantityStatus], AL
		JMP promptQuantity_End

	promptQuantity_quantityComparisonProcedure:
		
		;Reset SI, BX, CX Registers
		XOR SI, SI
		XOR BX, BX
		XOR CX, CX
		
		LEA DI, userQuantity		;Load User's Input to DI Register
		
		;Check if user entered ONLY ONE Digit
		CMP [qInputCounter], 1
		JE promptQuantity_FormatOneChar		;User entered only one digit
		
		;Else, user entered two digits
		MOV CL, 2
		JMP promptQuantity_quantityComparison

	promptQuantity_FormatOneChar:
		
		;User entered only one character. EG: 5 -> In userQuantity = {'5', '0'}
		MOV AL, [DI]			;Load ['5' OR 35H] to AL Register
		MOV [DI+1], AL			;Set userQuantity to {'5', '5'}
		MOV BL, 30H				;Pass '0' to BL Register
		MOV [DI], BL			;Set userQuantity to {'0', '5'}. Effectively, 05.

	promptQuantity_quantityComparison:

		;Compare Available Quantity with Quantity provided by User
		;SUB 30H to convert {1, 2, 3} in ASCII to Decimal
		;Now, BL = 1, 2, 3. Minus 1H to set index position: 0, 1, 2
		MOV BL, [eventActivityIndex] 
		SUB BL, 31H
		
		;Retrieve Quantity Array [qtyArray] previously PUSHED
		;qtyArray pushed to stack to pass variable to this Procedure
		MOV SI, 4[BP]
		MOV AL, [SI+BX]		;Get the Desired Quantity in Memory
		AAM					;Unpack Quantity. EG: 12 -> "1", "2"
		ADD AX, 3030H		;Convert Decimal to ASCII by adding 30H
							;Result: AH = '1', AL = '2'
		CMP AH, 30H			;Check if Available Quantity > 10
	
		JE promptQuantity_quantityLessTen	;Available Quantity < 10
		JMP promptQuantity_quantityMoreTen	;Available Quantity > 10
	
	promptQuantity_quantityLessTen:	;Available Quantity < 10
	
		XOR BX, BX
		MOV BL, 30H
		CMP [DI], BL			;Check if First Digit in userQuantity is More than 0
		JNE promptQuantity_BadInput	;userQuantity > 10. So not valid.

		;User Quantity is Less than 10.
		CMP AL, [DI+1]			;Check if 2nd Digit from userQuantity and Available Quantity
		JB promptQuantity_BadInput		;2nd Digit in userQuantity > 2nd Digit in Available Quantity
		JMP promptQuantity_End	;userQuantity < Available Quantity. Input is Valid
		
	promptQuantity_quantityMoreTen:	;Available Quantity > 10
	
		;Check first Digit of userQuantity and Available Quantity
		CMP AH, [DI]
		JE promptQuantity_firstDigitSame		;First Digit of userQuantity and Available Quantity ARE THE SAME
		JB promptQuantity_BadInput		;First Digit of userQuantity > First Digit of Available Quantity: Bad Qty
		JMP promptQuantity_End	;First Digit of userQuantity < First Digit of Available Quantity: Good Qty

	promptQuantity_firstDigitSame:

		;Check if Second Digit of userQuantity < Second Digit of Available Quantity
		CMP AL, [DI+1]
		JB promptQuantity_BadInput	;Second Digit of userQuantity > Second Digit of Available Quantity: Bad Qty
		
		;If Second Digit of userQuantity < Second Digit of Available Quantity: Good Qty

	promptQuantity_End:
		
	POP BP	
	RET
	promptQuantity ENDP

;---------------------( 7. Prompt for Team Name [ Competition ] )------------------------------------------------

;[ 7.1 ] Prompt user to enter their Team Name and verify team name validity
promptTeamName PROC

		;Restore Original Assumption: Team Name Entered by User is Valid
		MOV AL, '3'
		MOV [teamNameStatus], '1'
		
		;Reset Team Name Variable for Subsequent Purchase
		XOR BX, BX
		LEA SI, tnTeamName
		MOV CL, 21			;Loop 21 times for 21 Character
		MOV AL, '$'			;Pass '$' value to AL Register
		
	promptTeamName_ResetTeamName:
		
		MOV [SI+BX], AL
		INC BX
		LOOP promptTeamName_ResetTeamName
		
		;Completed Resetting the tnTeamName Variable
		
		;Print Message Prompting User to enter a Team Name
		LEA DX, tnPrompt
		MOV AH, 09H
		INT 21H
		
		;Read String from User [ Team Name restricted to 20 Characters + Line Feed / NewLine ]
		LEA DX, tnMaxLength
		MOV AH, 0AH
		INT 21H
		
		;Check if user enter Escape Sequence where the Input is 3 Characters Long
		CMP tnInputCounter, 3
		JE promptTeamName_VerifyEscapeSequence
		
		;Check if user enters MORE than 5 Characters. Team Name must be atleast 5 Characters Long
		CMP tnInputCounter, 5
		JL promptTeamName_BadInput
		
		;Set the Last Char after User Input in tnTeamName to be '$'.
		;Allow for AH = 09H / INT 21H Function
		XOR BX, BX
		LEA SI, tnTeamName
		MOV BL, tnInputCounter
		MOV AL, '$'
		MOV [SI+BX], AL
		
		;Set quantity to 1
		MOV AL, '0'
		MOV [userQuantity], AL
		MOV AL, '1'
		MOV [userQuantity+1], AL
		
		JMP promptTeamName_End		;User entered a valid Team Name
		
	promptTeamName_VerifyEscapeSequence:
		
		;Reset BX Register
		XOR BX, BX
		MOV CL, 3	;Loop 3 times
	
	promptTeamName_VerifyEscapeSequence_Process:
	
		;Check if user enters '!' 3 times.
		;If user Input is not !!!, then its a bad input
		CMP [tnTeamName+BX], '!'
		JNE promptTeamName_BadInput
		LOOP promptTeamName_VerifyEscapeSequence_Process
		
		;User entered ( !!! ). Set teamNameStatus to 2 [Exit]
		MOV [teamNameStatus], '2'
		JMP promptTeamName_End

	promptTeamName_BadInput:
		;Display Bad Team Name Message
		CALL displayTeamNameError
		MOV AL, '3'
		MOV [teamNameStatus], AL
	
	promptTeamName_End:

	RET
	promptTeamName ENDP

;---------------------( 8. Display Total Price Page )------------------------------------------------------------

;[ 8.1 ] Calculating the total price by: totalPrice = userQuantity * eventPrice
calculateTotalPrice PROC
		
		;Reset CX and BX Registers
		;XOR CX, CX
		;XOR BX, BX
		
		LEA SI, userQuantity	;Load user input
		MOV AL, [SI]			;Store first Digit of userQuantity to AL
		
		SUB AL, 30H				;Convert first digit to Decimal
		MUL const_ten
		
		MOV DL, [SI+1]			;Store Second Digit of userQuantity to DL
		SUB DL, 30H				;Convert second digit to Decimal
		
		ADD DL, AL				;Add both First and Second Digit to restore original value in Decimal

		;NOTE: DL now stores the value of userQuantity
		XOR BX, BX				;Reset BX Register incase MUL operation produces Overflow
		XOR AX, AX
		
		MOV AL, eventPrice		;Load stored eventPrice to AL Register
		
		MUL DL					;AL x BL --[Store To]-> AX Register
	
		MOV totalPrice, AX		;Store result of multiplication to totalPrice
		
	RET
	calculateTotalPrice ENDP

;[ 8.2 ] Displaying the totalPrice
displayTotalPrice PROC

		;Load TotalPrice to AX Register
		MOV AX, totalPrice
		
		;Restore Original Assumption: totalPrice has a leading 0 -> RM 0125
		MOV tQtyLead, '1'
		;Restore Original const_div Value which allows the division up to 4 Digits. 999 < X < 10 000
		MOV const_div, 1000

		;Reset CX Register
		XOR CX, CX
		
		;Loop 4 times for 4 Digits up to 1000
		MOV CL, 4
		
	displayTotalPrice_TotalPriceSegmentation:

		;Reset DX Register because DX will store the remainder.
		;Residual value will be added to DX which distorts the actual remainder value
		XOR DX, DX

		;Divide totalPrice by 10, 100, 1000. Get the Quotient and display the quotient
		DIV const_div
		;Pass the remainder of division to totalPriceRemainder
		MOV totalPriceRemainder, DX

		;Load the Quotient of the division: Print left to right for total Quantity
		MOV DL, AL
		ADD DL, 30H

		CMP DL, 30H	;Check if there is a leading 0
		JNE displayTotalPrice_Print

		CMP tQtyLead, '1' ;Check leading zero flag
		JE displayTotalPrice_SkipPrint

	displayTotalPrice_Print:

		;Print the most left number
		MOV tQtyLead, '2'			;Set the flag to mention there is no leading zero. EG: 0030Z
		MOV AH, 02H
		INT 21H

	displayTotalPrice_SkipPrint:

		;Divide const_div by 10. 1000 -> 100
		MOV AX, const_div
		DIV const_ten
		
		;Pass the multiplication result back to const_div
		MOV const_div, AX
		
		;Load back the remainder to AX Register for further division
		MOV AX, totalPriceRemainder
		
		LOOP displayTotalPrice_TotalPriceSegmentation

	displayTotalPrice_End:
	
		MOV tQtyLead, '1'		;Reset original tQtyLead Flag for subsequent purchases

	RET
	displayTotalPrice ENDP

;[ 8.4 ] Displaying The Banner Displaying Total Quantity and Price
displayEventTransactionConfirmation_WorkshopActivity PROC

		;Clear TASM Console Display
		CALL clearDisplay
		
		;Print Confirmation Banner Framework to User
		LEA DX, pqBanner
		MOV AH, 09H
		INT 21H
		
		;Set the Event Name
		;;Set Cursor Position for Event Name
		MOV AH, 02H
		MOV DL, 31
		MOV DH, 1
		INT 10H
		
		;;Print Event Name
		LEA DX, eventName
		MOV AH, 09H
		INT 21H
		
		;Set userQuantity
		;;Set Cursor Position for Total Quantity
		MOV AH, 02H
		MOV DL, 31
		MOV DH, 2
		INT 10H
		
		;;Display Event Quantity
		MOV DL, [userQuantity]
		CMP DL, 30H				;Check if user ordered > 10 Entries
		JE displayEventTransactionConfirmation_TwoDigits
		INT 21H

	displayEventTransactionConfirmation_TwoDigits:
		;;;If user enters less than 10, skip printing the first digit which is a 0
		;;;Print 9 instead of 09
		MOV DL, [userQuantity+1]
		INT 21H
	
		;Display Total Price
		;;Set Cursor Position for Total Price
		MOV AH, 02H
		MOV DL, 34
		MOV DH, 3
		INT 10H
		
		;;Display Total Price
		CALL calculateTotalPrice
		CALL displayTotalPrice

		;Set Cursor for Further Prompts
		MOV AH, 02H
		MOV DL, 0
		MOV DH, 6
		INT 10H

	RET
	displayEventTransactionConfirmation_WorkshopActivity ENDP

;[ 8.5 ] Displaying The Banner Displaying Event Name, Team Name, and Cost of Entry
displayEventTransactionConfirmation_Competition PROC
		
		;Clear TASM Console Display
		CALL clearDisplay
		
		;Display Confirmation Banner for Competition Skeleton
		LEA DX, cdBanner
		MOV AH, 09H
		INT 21H
		
		;Set the Event Name
		;;Set Cursor Position for Event Name
		MOV AH, 02H
		MOV DL, 31
		MOV DH, 1
		INT 10H
		
		;;Print Event Name
		LEA DX, eventName
		MOV AH, 09H
		INT 21H
		
		;Set the Entry Price
		;;Set Cursor Position for Entry Price
		MOV AH, 02H
		MOV DL, 34 
		MOV DH, 2
		INT 10H
		
		;Reset AX Register
		XOR AX, AX
		;;Print Entry Price
		MOV AL, eventPrice
		
		;;;Set event Price at totalPrice
		MOV [totalPrice], AX
		
		AAM
		ADD AX, 3030H
		MOV DH, AL
		MOV DL, AH
		MOV AH, 02H
		INT 21H
		MOV DL, DH
		INT 21H
		
		;Set the Team Name
		;;Set Cursor Position for Team Name
		MOV AH, 02H
		MOV DL, 31
		MOV DH, 3
		INT 10H
		
		;;Display Team Name Character by Character
		LEA SI, tnTeamName
		MOV CL, tnInputCounter		;Iterate following the number of input entered by user
		MOV AH, 02H

	displayEventTransactionConfirmation_Competition_DisplayTeamName:
		MOV DL, [SI]
		INT 21H
		INC SI
		LOOP displayEventTransactionConfirmation_Competition_DisplayTeamName
		
		;Set Cursor for Further Prompts
		MOV AH, 02H
		MOV DL, 0
		MOV DH, 6
		INT 10H

	RET
	displayEventTransactionConfirmation_Competition ENDP

;---------------------( 9. Prompt Membership )-------------------------------------------------------------------

;[ 9.1 ] Ask user if they are a club member
membershipPromptResponse PROC

		;Display Membership Prompt
		LEA DX, mbrPrompt
		MOV AH, 09H
		INT 21H
		
		;Read user input
		MOV AH, 01H			;User Character Input is stored to the AL Register
		INT 21H
		
		;Check user's Input
		CMP AL, 'Y'
		JE membershipPromptResponse_Yes
		
		CMP AL, 'y'
		JE membershipPromptResponse_Yes
		
		CMP AL, 'N'
		JE membershipPromptResponse_No
		
		CMP AL, 'n'
		JE membershipPromptResponse_No
		
		;User did not enter 'Y', 'y', 'N', 'n'
		JMP membershipPromptResponse_Error
		
	
	membershipPromptResponse_Yes:
		MOV [membershipStatus], '1'
		JMP membershipPromptResponse_End
	
	membershipPromptResponse_No:
		MOV [membershipStatus], '2'
		JMP membershipPromptResponse_End
	
	membershipPromptResponse_Error:
		MOV [membershipStatus], '3'
		CALL displayBadMembershipIDBanner

	membershipPromptResponse_End:

	RET
	membershipPromptResponse ENDP

;[ 9.2 ] Ask User to enter their Club ID
promptMembershipID PROC
	
		;Display Message Prompting user to enter their TP Number / Club ID
		LEA DX, cnoPrompt
		MOV AH, 09H
		INT 21H
		
		;Set Cursor Position for user to enter their TP Number / Club ID
		MOV AH, 02H
		MOV DH, 14
		MOV DL, 36
		INT 10H
		
		;Read User's Input
		LEA DX, idMaxLength
		MOV AH, 0AH
		INT 21H
		
		;Club ID are 6 digits long. Any less means input is invalid
		CMP [idInputCounter], 6
		JE promptMembershipID_CheckID
		
		;User entered an Invalid Club ID
		MOV membershipStatus, '3'			;3 = Bad Input
		JMP promptMembershipID_StatusCheck
		
	promptMembershipID_CheckID:
	
		;6 Char ID Detected. Check whether it matches with the ID in the Database
		LEA SI, idMember			;Load the ID entered by User
		LEA DI, clubIDList			;Load the ID stored in the Database
		
	promptMembershipID_nextID:
		;Restore Original Assumption: All users are members as we check the Next ID in the List
		MOV membershipStatus, '1'
		XOR BX, BX				;BX is used as counter to traverse SI Register

	promptMembershipID_nextCharacter:
		MOV AL, [SI+BX]
		MOV DL, [DI]
		
		CMP DL, '$'		;Check if an ID has been read completeley
		JE promptMembershipID_checkEndOfList
		
		CMP AL, DL		;Check if the character matches
		JE promptMembershipID_sameCharacter	;Character Compared are the same
		
		MOV membershipStatus, '3'	;JUMP failing indicates user entered a mismatched ID

	promptMembershipID_sameCharacter:
		;Increment BX and DI Register Values to traverse to the next Character
		INC BX
		INC DI
		JMP promptMembershipID_nextCharacter

	promptMembershipID_checkEndOfList:
		;This Segment will be accessed if AL = '$'
		;'$' Symbolizes the end of an ID
		;Check if jthe current ID is being Correct
		CMP membershipStatus, '1'
		JE promptMembershipID_StatusCheck	;It is the same, hence jump to the end
		
		;Current ID being read does not match the ID entered by the User
		;Check if we reached the end of clubIDList
		INC DI
		MOV AL, [DI]
		CMP AL, '!'
		JNE promptMembershipID_nextID	;We did not reach end of list. Continue traversing the ID List

	promptMembershipID_StatusCheck:
		;Check if user made an invalid ID
		CMP membershipStatus, '3'
		JNE promptMembershipID_End
		
		CALL displayBadMembershipIDBanner
	
	promptMembershipID_End:

	RET
	promptMembershipID ENDP

;[ 9.3 ] Implementation of Prompting User for Membership
membershipPrompt PROC

	membershipPrompt_Start:
		;Restore Original Assumption: All users are members
		MOV membershipStatus, '1'
		
		CALL membershipPromptResponse
		
		;User is not a member or has made a mistake inputting. Exit this function
		CMP membershipStatus, '1'
		JNE membershipPrompt_End
		
		CALL promptMembershipID

	membershipPrompt_End:

	RET
	membershipPrompt ENDP

;[ 9.4 ] Calculate Discount for Club Members
calculateDiscount PROC
		
		;Reset Coins
		MOV [totalPriceCoins], 0
		
		;Load Original Total Price. Example: RM 300
		XOR DX, DX		;Reset DX Register to store remainder in DIV Operation
		MOV AX, [totalPrice]		;Total Price = RM 300
		MOV BX, [const_disc]		;const_disc = 2
		DIV BX						; AX / BX -> 300 / 2 = 150
		
		;Reallocate Reuslts of Division to totalPrice
		MOV totalPrice, AX			;AX holds the quotient
		
		CMP DX, 0					;Check if there are any remainder
		JZ calculateDiscount_End	;No Remainder
		
		;There are Remainders.
		;Example: 25 / 2 = 12.5. Remainder = .5 x 2 = 1. DX = 1
		MOV AX, DX				;Move Remainder to AX Register as AX is the Implied Register for MUL
		MUL const_ten			;1 x 10 = 10
		MOV BX, [const_disc]	;Load back 2 to divide 10
		XOR DX, DX				;Reset DX Register to store potential remainders
								;Non empty DX Register interfere with remainder's accuracy
		DIV BX					;10 / 2 = 5
		MUL [const_ten]			;5 x 10 = 50 Cents
		MOV totalPriceCoins, AX	;Store the remainder which is usually 50 Cents to totalPriceCoins

	calculateDiscount_End:

	RET
	calculateDiscount ENDP

;[ 9.5 ] Display the Discounted Total Price
displayDiscountedValue PROC

		;Calculate the discounted price
		CALL calculateDiscount
		
		CMP eventTypeIndex, '3'			;Check if user chose workshop
		JNE displayDiscountedValue_WorkshopActivity
		
		;Set Cursor Position for Competition
		MOV AH, 02H
		MOV DL, 38
		MOV DH, 2
		INT 10H

		JMP displayDiscountedValue_Display
	displayDiscountedValue_WorkshopActivity:	
		;Set Cursor Position for Workshop and Activity
		MOV AH, 02H
		MOV DL, 38
		MOV DH, 3
		INT 10H

	displayDiscountedValue_Display:
		;Print Arrow Line
		LEA DX, updPrice
		MOV AH, 09H
		INT 21H
		
		CALL displayTotalPrice
		
		;Display Fullstop
		MOV AH, 02H
		MOV DL, '.'
		INT 21H
		
		;Display the Coins
		MOV AX, totalPriceCoins
		AAM
		ADD AX, 3030H
		MOV DH, AL
		MOV DL, AH
		MOV AH, 02H
		INT 21H
		MOV DL, DH
		INT 21H
		
		MOV AH, 02H
		MOV DL, 0
		MOV DH, 6
		INT 10H
		

	RET
	displayDiscountedValue ENDP

;[ 9.6 ] Display and Ask user to confirm their payment
displayAndPromptUserInput PROC
		
		;Display Prompt Message
		LEA DX, FinPayment
		MOV AH, 09H
		INT 21H
		
		;Read User Input
		MOV AH, 01H
		INT 21H
		
		;Check user Input
		CMP AL, 'Y'
		JE displayAndPromptUserInput_Yes
		CMP AL, 'y'
		JE displayAndPromptUserInput_Yes
		
		CMP AL, 'N'
		JE displayAndPromptUserInput_No
		CMP AL, 'n'
		JE displayAndPromptUserInput_No
		
		;User entered an invalid input
		MOV paymentStatus, '3'
		CALL displayError
		JMP displayAndPromptUserInput_End

	displayAndPromptUserInput_Yes:
		MOV paymentStatus, '1'		;User completed the payment
		JMP displayAndPromptUserInput_End

	displayAndPromptUserInput_No:
		MOV paymentStatus, '2'		;User cancelled payment

	displayAndPromptUserInput_End:

	RET
	displayAndPromptUserInput ENDP

;[ 9.7 ] Reduce Quantity according to user's purchase
subtractQuantity PROC

		LEA SI, [userQuantity]
		MOV AL, [SI]	;Get first Number from userQuantity. Example: 20. Get 2 from 20
		SUB AL, 30H		;Convert ASCII Char to Decimal
		MUL const_ten			;DEC: 2 -> 20
		MOV DL, [SI+1]	;Get 0 from 20
		SUB DL, 30H		;Convert ASCII Char to Decimal
		ADD AL, DL		;20 + 2 = 22
		
		;Get the Correct Quantity Index
		XOR BX, BX
		MOV BL, [eventActivityIndex]	;Load index of event selected by user. Stored in ASCII
		SUB BL, 31H						;Convert ASCII to Decimal and -1 for Indexing
		
		
		;User chose Workshop
		CMP [eventTypeIndex], '1'
		JE subtractQuantity_Workshop
		
		;User chose Activity
		CMP [eventTypeIndex], '2'
		JE subtractQuantity_Activity

		;User chose Competition
		LEA SI, coQty
		JMP subtractQuantity_PerformSubtraction
	
	subtractQuantity_Workshop:
		LEA SI, woQty
		JMP subtractQuantity_PerformSubtraction

	subtractQuantity_Activity:
		LEA SI, acQty
	
	subtractQuantity_PerformSubtraction:
		MOV DL, [SI+BX]
		
		SUB DL, AL
		MOV [SI+BX], DL

	RET
	subtractQuantity ENDP

;[ 9.8 ] Display the Final Confirmation Banner to finalize transaction
displayFinalConfirmation PROC

	displayFinalConfirmation_Start:
		;Clear TASM Console
		CALL clearDisplay
		
		CMP [eventTypeIndex], '3' 
		JNE displayFinalConfirmation_WorkshopActivity
		
		CALL displayEventTransactionConfirmation_Competition
		JMP displayFinalConfirmation_checkDiscount
		;JMP displayFinalConfirmation_End
		
	displayFinalConfirmation_WorkshopActivity:
		CALL displayEventTransactionConfirmation_WorkshopActivity 

	displayFinalConfirmation_checkDiscount:
		CMP membershipStatus, '1'
		JNE displayFinalConfirmation_End
		
		;Calculate the Discount and Display Discount
		CALL displayDiscountedValue
	
	displayFinalConfirmation_End:
		;Display "Confirm Purchase Banner"
		CALL displayAndPromptUserInput
		CMP paymentStatus, '3'
		JE displayFinalConfirmation_Start
		
	RET
	displayFinalConfirmation ENDP

;---------------------( 10. Decision Tree to Displaying Activities in a Particular Event Type )------------------

;Note [implementEventBanner]: No error validation here as error validation is carried out before this
;							: PROCEDURE is called
implementEventBanner PROC	
		
		;User chose Workshop
		CMP [eventTypeIndex], 31H
		JE implementEventBanner_Workshop
		
		;User chose Activity
		CMP [eventTypeIndex], 32H
		JE implementEventBanner_Activity

		;User chose Competition
		CMP [eventTypeIndex], 33H
		JMP implementEventBanner_Competition

	implementEventBanner_Workshop:
		;Implementation of Workshop
		displayEventBanner woNme, woPrc, woQty
		JMP implementEventBanner_End


	implementEventBanner_Activity:
		;Implementation of Activity
		displayEventBanner acNme, acPrc, acQty
		JMP implementEventBanner_End


	implementEventBanner_Competition:
		;Implementation of Competition
		displayEventBanner coNme, coPrc, coQty

	implementEventBanner_End:

	RET
	implementEventBanner ENDP

;---------------------( 11. Prompting User to Enter a Quantity or Team Name )------------------------------------

implementEventPrompt PROC

	implementEventPrompt_Start:
	
		;User chose Workshop
		CMP [eventTypeIndex], 31H
		JE implementEventPrompt_Workshop
		
		;User chose Activity
		CMP [eventTypeIndex], 32H
		JE implementEventPrompt_Activity
		
		;User chose Competition
		CMP [eventTypeIndex], 33H
		JMP implementEventPrompt_Competition


	implementEventPrompt_Workshop:
	
		;Display Event Details for Workshop
		displayEventDetails woNme, woPrc, woQty
		
		;Prompt User to Enter Quantity
		LEA DX, woQty
		PUSH DX
		CALL promptQuantity
		POP DX
		
		JMP implementEventPrompt_CheckQuantityStatus

		
	implementEventPrompt_Activity:
	
		;Display Event Details for Activity
		displayEventDetails acNme, acPrc, acQty
		
		;Prompt User to Enter Quantity
		LEA DX, acQty
		PUSH DX
		CALL promptQuantity
		POP DX

		JMP implementEventPrompt_CheckQuantityStatus

;COMPETITION
	implementEventPrompt_Competition:
		displayEventDetails coNme, coPrc, coQty
		
		;Prompt User to enter Team Name
		CALL promptTeamName
		CMP teamNameStatus, '3'
		JNE implementEventPrompt_CheckQuantityStatus 
		JMP implementEventPrompt_Start
	implementEventPrompt_CheckQuantityStatus:
	
		;Check if user made a mistake entering quantity
		CMP [quantityStatus], '3'
		JNE implementEventPrompt_End
		JMP implementEventPrompt_Start

	implementEventPrompt_End:

	RET
	implementEventPrompt ENDP

;---------------------( 12. Purchase and Membership Confirmation )-----------------------------------------------

implementTransactionConfirmation PROC

	implementTransactionConfirmation_Start:
	
		;Check whether user is Purchasing entry to Workshop, Activity, or Competition
		CMP eventTypeIndex, '3'
		JE implementTransactionConfirmation_Competition
		;Display Event Name, Total Quantity, and Price
		
		CALL displayEventTransactionConfirmation_WorkshopActivity

		JMP implementTransactionConfirmation_PromptMembership
		;Ask user if they are a Club Member
		

	implementTransactionConfirmation_Competition:
		CALL displayEventTransactionConfirmation_Competition

	implementTransactionConfirmation_PromptMembership:

		CALL membershipPrompt
		
		;Check if user entered a bad club id
		CMP membershipStatus, '3'
		JE implementTransactionConfirmation_Start

		;Check if user is a club member
		CMP membershipStatus, '1'
		JNE implementTransactionConfirmation_FinalConfirmation ;User is not a member. Jump to the end
		
		;User is a club member
		;CALL calculateDiscount
		
	implementTransactionConfirmation_FinalConfirmation:

		;Final Confirmation
		CALL displayFinalConfirmation
		
		;Check if user finalize their payment
		CMP paymentStatus, '1'
		JNE implementTransactionConfirmation_End
		
		;User has finalized their payment
		CALL displayTYBanner
		;REDUCE QUANTITY
		CALL subtractQuantity
		
	implementTransactionConfirmation_End:

	RET
	implementTransactionConfirmation ENDP

;---------------------( 13. MAIN Process )------------------------------------------------------------------------

MAIN PROC
		;Initialize the Data Segment
		MOV AX, @DATA
		MOV DS, AX

	MAIN_START:
			CALL implementMainMenu

			;Check if user enters 4 (4: Exit FSEC-SS System)
			CMP [eventTypeIndex], 34H
			JE MAIN_END

			CALL implementEventBanner
			;Check if user enters 4 (4: Return to Main Menu)
			CMP [eventActivityIndex], 34H
			JE MAIN_START
			
			;Ask them for Quantity [Placeholder]
			CALL implementEventPrompt
			
			;Check if user enters Quantity Escape Sequence !! (2: Return to Main Menu)

			CMP [quantityStatus], '2'
			JE MAIN_START
			
			CMP [teamNameStatus], '2'
			JE MAIN_START
			
			
			;Prompt for Membership and Finalize Payment
			CALL implementTransactionConfirmation

			JMP MAIN_START

	MAIN_END:

			CALL displayExit

			MOV AH, 4CH
			INT 21H

MAIN ENDP
END MAIN
