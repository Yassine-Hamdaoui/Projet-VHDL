Library IEEE; --Library
USE ieee.std_logic_1164.all;
ENTITY FA_1bit IS -- définition de l'entité, 8 bit en E/S
PORT (
A,B,Cin:IN STD_LOGIC;
S,Cout:OUT STD_LOGIC
);
END FA_1bit;

ARCHITECTURE FA_1bit_arch OF FA_1bit IS
	-- no component
BEGIN --0 = ACTIVE 1 = INACTIF
	S <= A XOR B XOR Cin;
	Cout <= (A AND B) OR (Cin AND ( A OR B));	
	
END FA_1bit_arch;