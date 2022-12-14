LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE WORK.Lab4_package.ALL;

ENTITY Lab4 IS
	PORT(
		SIGNAL A, B : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
		SIGNAL carryin : IN STD_LOGIC;
		SIGNAL opcode : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		SIGNAL led0, led1 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		SIGNAL overflow, zero : OUT STD_LOGIC
	);
END ENTITY Lab4;

ARCHITECTURE Behavior OF Lab4 IS
	SIGNAL result : STD_LOGIC_VECTOR(6 DOWNTO 0);
BEGIN
	 -- SIGNAL A, B : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
	 -- SIGNAL carryin : IN STD_LOGIC;
	 -- SIGNAL opcode : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	 -- SIGNAL result : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	 -- SIGNAL carryout, overflow, zero : OUT STD_LOGIC
	ALU7bit0: ALU7bit PORT MAP (A, B, carryin, opcode, result, OPEN, overflow, zero);
	
	LED70: LED7 PORT MAP (result(3 DOWNTO 0), led0);
	LED71: LED7 PORT MAP ('0' & result(6 DOWNTO 4), led1);
END ARCHITECTURE Behavior;