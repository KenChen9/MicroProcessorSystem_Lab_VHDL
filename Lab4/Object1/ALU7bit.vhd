LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_MISC.ALL;
USE WORK.Lab4_package.ALL;

ENTITY ALU7bit IS
	PORT(
		SIGNAL A, B : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
		SIGNAL carryin : IN STD_LOGIC;
		SIGNAL opcode : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		SIGNAL result : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		SIGNAL carryout, overflow, zero : OUT STD_LOGIC
	);
END ENTITY ALU7bit;

ARCHITECTURE Behavior OF ALU7bit IS
	SIGNAL carry : STD_LOGIC_VECTOR(6 DOWNTO 0);
	SIGNAL slt : STD_LOGIC;
BEGIN
	ALU0: ALU1bit PORT MAP (A(0), B(0), slt, carryin, opcode, result(0), OPEN, carry(0));
	G0: FOR I IN 1 TO 5 GENERATE
		ALUi: ALU1bit PORT MAP (A(i), B(i), '0', carry(i-1), opcode, result(i), OPEN, carry(i));
	END GENERATE G0;
	ALU6: ALU1bit PORT MAP (A(6), B(6), '0', carry(5), opcode, result(6), slt, carry(6));
	
	carryout <= carry(6);
	overflow <= carry(6) XOR carry(5);
	zero <= NOT OR_REDUCE(carry);
END ARCHITECTURE Behavior;