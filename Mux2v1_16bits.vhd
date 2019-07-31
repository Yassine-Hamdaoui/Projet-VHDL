Library IEEE; --Library
USE ieee.std_logic_1164.all;
ENTITY MUX2v1_16bits IS 
PORT (x,y:IN STD_LOGIC_VECTOR(15 DOWNTO 0); -- entrée
s:IN STD_LOGIC;-- sélecteur
m:OUT STD_LOGIC_VECTOR(15 DOWNTO 0)); -- sortie
END MUX2v1_16bits;

ARCHITECTURE MUX2v1_16bits_arch OF MUX2v1_16bits IS
BEGIN -- VECTOR, donc on peut utiliser les s(VAR) parenthèses
 m(0) <= (NOT (s) AND x(0)) OR (s AND y(0));
 m(1) <= (NOT (s) AND x(1)) OR (s AND y(1));
 m(2) <= (NOT (s) AND x(2)) OR (s AND y(2));
 m(3) <= (NOT (s) AND x(3)) OR (s AND y(3));
 m(4) <= (NOT (s) AND x(4)) OR (s AND y(4));
 m(5) <= (NOT (s) AND x(5)) OR (s AND y(5));
 m(6) <= (NOT (s) AND x(6)) OR (s AND y(6));
 m(7) <= (NOT (s) AND x(7)) OR (s AND y(7));
 m(8) <= (NOT (s) AND x(8)) OR (s AND y(8));
 m(9) <= (NOT (s) AND x(9)) OR (s AND y(9));
 m(10) <= (NOT (s) AND x(10)) OR (s AND y(10));
 m(11) <= (NOT (s) AND x(11)) OR (s AND y(11));
 m(12) <= (NOT (s) AND x(12)) OR (s AND y(12));
 m(13) <= (NOT (s) AND x(13)) OR (s AND y(13));
 m(14) <= (NOT (s) AND x(14)) OR (s AND y(14));
 m(15) <= (NOT (s) AND x(15)) OR (s AND y(15));
END MUX2v1_16bits_arch;