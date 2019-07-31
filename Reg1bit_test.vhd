-- test = la carte
Library IEEE; --Library
USE ieee.std_logic_1164.all;
ENTITY Reg1bit_test IS -- définition de l'entité, 8 bit en E/S
PORT (SW:IN STD_LOGIC_VECTOR(2 DOWNTO 0);
LEDR:OUT STD_LOGIC_VECTOR(8 TO 9));
END Reg1bit_test;
-- reset asynchrone = indépendant de l'horloge et synchrone = quand on met un coup de clk, le reset s'effectue
ARCHITECTURE Reg1bit_test_arch OF Reg1bit_test IS
Component Reg1bit IS 
PORT (
clk, d, reset:IN STD_LOGIC;
q:OUT STD_LOGIC
);
END Component;

BEGIN 
	u1:Reg1bit PORT MAP(d=>SW(0),clk=>SW(1),reset=>SW(2),q=>LEDR(9)); -- LEDR = les led et SW les boutons poussoirs
END Reg1bit_test_arch;
