LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
ENTITY cpu IS
PORT(
 DIN : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	Resetn, CLK, Run : IN STD_LOGIC;
	Done : OUT STD_LOGIC;
	BusWire : OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
END cpu;
ARCHITECTURE cpu_arch OF cpu IS

TYPE state_type IS (T0, T1, T2, T3);
SIGNAL Tstep_Q, Tstep_D: state_type;
SIGNAL s_r0,s_r1,s_r2,s_r3,s_r4,s_r5,s_r6,s_r7,s_m: STD_LOGIC_VECTOR(15 DOWNTO 0); -- signaux pour les registre RX = X => [0:7] + sortie mux
SIGNAL R0s,R1s,R2s,R3s,R4s,R5s,R6s,R7s,As,Gs,IRs: STD_LOGIC;
SIGNAL s_g,s_ALU,s_A: STD_LOGIC_VECTOR(15 DOWNTO 0); -- signaux de sortie pour G, A
SIGNAL bus_sel : STD_LOGIC_VECTOR(3 DOWNTO 0); 
SIGNAL s_IR : STD_LOGIC_VECTOR(15 DOWNTO 7); -- signal sortie 9 bits IR
SIGNAL add_sub : STD_LOGIC_VECTOR(2 DOWNTO 0); -- signal sélecteur entrée pour ALU

-- COMPONENTS
COMPONENT RegNbits IS
GENERIC(N : INTEGER := 16);
PORT (
	clk, reset,setn:IN STD_LOGIC;
	d : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	q:OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
);
END COMPONENT;

COMPONENT Mux10v1_16bits IS
PORT(
	a,b,c,d,e,f,g,h,i,j:IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	s0,s1,s2,s3 : IN STD_LOGIC;
	m:OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
);
END COMPONENT;

COMPONENT ALU IS
PORT(
	A_a,B_b : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	sel : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	S_s :OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
);
END COMPONENT;
-- ARCHITECTURE
BEGIN
	u0:Mux10v1_16bits PORT MAP(DIN, s_r0,s_r1,s_r2,s_r3,s_r4,s_r5,s_r6,s_r7,s_g,bus_sel(0),bus_sel(1),bus_sel(2),bus_sel(3),s_m); --a,b,c,d,e,f,g,h,i,j
	r0:RegNbits PORT MAP(CLK, Resetn,R0s,s_m,s_r0);
	r1:RegNbits PORT MAP(CLK, Resetn,R1s,s_m,s_r1);
	r2:RegNbits PORT MAP(CLK, Resetn,R2s,s_m,s_r2);
	r3:RegNbits PORT MAP(CLK, Resetn,R3s,s_m,s_r3);
	r4:RegNbits PORT MAP(CLK, Resetn,R4s,s_m,s_r4);
	r5:RegNbits PORT MAP(CLK, Resetn,R5s,s_m,s_r5);
	r6:RegNbits PORT MAP(CLK, Resetn,R6s,s_m,s_r6);
	r7:RegNbits PORT MAP(CLK, Resetn,R7s,s_m,s_r7);
	A:RegNbits PORT MAP(CLK, Resetn,As,s_m,s_A);
	G:RegNbits PORT MAP(CLK, Resetn,Gs,s_ALU,s_g);
	IR:RegNbits Generic map(N => 9) PORT MAP(CLK, Resetn,IRs,DIN(15 DOWNTO 7),s_IR);
	ALU_comp:ALU PORT MAP(s_A,s_m,add_sub,s_ALU);

END ARCHITECTURE;
