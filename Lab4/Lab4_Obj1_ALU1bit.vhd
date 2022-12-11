LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY ALU1bit IS
	PORT(
		SIGNAL A, B, less, carryin : IN STD_LOGIC;
		SIGNAL opcode : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		SIGNAL result, set, carryout : OUT STD_LOGIC
	);
END ENTITY ALU1bit;

ARCHITECTURE Behavior OF ALU1bit IS
	SIGNAL Ain, Bin, Sin : STD_LOGIC;
BEGIN
	WITH opcode(3) SELECT
		Ain <= A WHEN '0',
		NOT A WHEN OTHERS;
	
	WITH opcode(2) SELECT
		Bin <= B WHEN '0',
		NOT B WHEN OTHERS;
	
	Sin <= Ain XOR Bin XOR carryin;
	carryout <= (Ain AND Bin) OR (Ain AND Carryin) OR (Bin AND carryin);
	
	set <= Sin;
	
	WITH opcode(1 DOWNTO 0) SELECT
		result <= Ain AND Bin WHEN "00",
		Ain OR Bin WHEN "01",
		Sin WHEN "10",
		less WHEN OTHERS;
END ARCHITECTURE Behavior;