-- test = la carte
Library IEEE; --Library
USE ieee.std_logic_1164.all;
ENTITY FA_1bit_test IS -- définition de l'entité, 8 bit en E/S
PORT (SW:IN STD_LOGIC_VECTOR(2 DOWNTO 0);
LEDR:OUT STD_LOGIC_VECTOR(9 DOWNTO 8));
END FA_1bit_test;

ARCHITECTURE FA_1bit_test_arch OF FA_1bit_test IS
Component FA_1bit IS 
PORT (
A,B,Cin:IN STD_LOGIC;
S,Cout:OUT STD_LOGIC
);
END Component;

BEGIN 
	u1:FA_1bit PORT MAP(A=>SW(2),B=>SW(1),Cin=>SW(0),S=>LEDR(9),Cout=>LEDR(8));
END FA_1bit_test_arch;
