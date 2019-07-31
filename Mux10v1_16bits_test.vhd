Library IEEE; --Library
USE ieee.std_logic_1164.all;
ENTITY MUX10v1_16bits_test IS -- définition de l'entité, 8 bit en E/S
PORT (SW:IN STD_LOGIC_VECTOR(3 DOWNTO 0);
LEDR:OUT STD_LOGIC_VECTOR( 9 DOWNTO 0));
END MUX10v1_16bits_test;
ARCHITECTURE MUX10v1_16bits_test_arch OF MUX10v1_16bits_test IS
-- zone de déclaration
Component MUX10v1_16bits IS -- définition de l'entité, 8 bit en E/S, un peu commen un prototype en C, il ne fait qu'appeler ce qui a été déclaré dans l'autre fichier
PORT (a,b,c,d,e,f,g,h,i,j:IN STD_LOGIC_VECTOR(15 DOWNTO 0);
s0,s1,s2,s3 : IN STD_LOGIC;
m:OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
END Component;

BEGIN 
	u:MUX10v1_16bits PORT MAP(a=>"1000000000000000", b=>"1100000000000001",c=>"1110000000000111",d=>"1111000000000101",e=>"1111100000000101",f=>"1010000000000101",g=>"0100100000000101",h=>"1010001000000101",i=>"0000000000000101",j=>"0000000000000101",s0=>SW(0),s1=>SW(1),s2=>SW(2),s3=>SW(3), m(15 DOWNTO 6)=>LEDR(9 DOWNTO 0) );
	
END MUX10v1_16bits_test_arch;