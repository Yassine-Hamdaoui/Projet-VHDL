Library IEEE; --Library
USE ieee.std_logic_1164.all;
ENTITY MUX10v1_16bits IS -- définition de l'entité, 16 bit en E/S + 4 sélecteurs ( 16 possibilités -- 10 utilisées )
PORT (
a,b,c,d,e,f,g,h,i,j:IN STD_LOGIC_VECTOR(15 DOWNTO 0);
s0,s1,s2,s3 : IN STD_LOGIC;
m:OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
);
END MUX10v1_16bits;

ARCHITECTURE MUX10v1_16bits_arch OF MUX10v1_16bits IS
-- déclaration des signaux pour communication entre entité => 9 mux à déclarer
SIGNAL tmp0,tmp1, tmp2, tmp3, tmp4,tmp5,tmp6,tmp7 : STD_LOGIC_VECTOR(15 DOWNTO 0);

COMPONENT Mux2v1_16bits IS
PORT (x,y:IN STD_LOGIC_VECTOR(15 DOWNTO 0); -- entrée
s:IN STD_LOGIC;-- sélecteur
m:OUT STD_LOGIC_VECTOR(15 DOWNTO 0)); -- sortie
END COMPONENT;

BEGIN 
	u1:Mux2v1_16bits PORT MAP(a,b,s0,tmp0);
	u2:Mux2v1_16bits PORT MAP(c,d,s0,tmp1);
	u3:Mux2v1_16bits PORT MAP(e,f,s0,tmp2);
	u4:Mux2v1_16bits PORT MAP(g,h,s0,tmp3);
	u5:Mux2v1_16bits PORT MAP(i,j,s0,tmp4);
	u6:Mux2v1_16bits PORT MAP(tmp0,tmp1,s1,tmp5);
	u7:Mux2v1_16bits PORT MAP(tmp2,tmp3,s1,tmp6);
	u8:Mux2v1_16bits PORT MAP(tmp5,tmp6,s2,tmp7);
	u9:Mux2v1_16bits PORT MAP(tmp7,tmp4,s3,m);
END MUX10v1_16bits_arch;
