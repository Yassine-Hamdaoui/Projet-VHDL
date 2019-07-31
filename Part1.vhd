Library IEEE; --Library
USE ieee.std_logic_1164.all;
ENTITY part1 IS -- définition de l'entité, 8 bit en E/S
PORT (SW:IN STD_LOGIC_VECTOR(9 DOWNTO 0); -- STD_LOGIC_VECTOR = type 
LEDR : OUT STD_LOGIC_VECTOR(9 DOWNTO 0));
END part1;-- SW entrée | LEDR sortie
ARCHITECTURE Behavior OF part1 IS -- definition de l'architecture = opération effectuée
BEGIN
LEDR <= SW;
END Behavior;