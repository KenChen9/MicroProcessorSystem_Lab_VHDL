LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

PACKAGE Lab4_package IS
	COMPONENT ALU1bit
		PORT(
			SIGNAL A, B, less, carryin : IN STD_LOGIC;
			SIGNAL opcode : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			SIGNAL result, set, carryout : OUT STD_LOGIC
		);
	END COMPONENT ALU1bit;
	
	COMPONENT ALU7bit
		PORT(
			SIGNAL A, B : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
			SIGNAL carryin : IN STD_LOGIC;
			SIGNAL opcode : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			SIGNAL result : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			SIGNAL carryout, overflow, zero : OUT STD_LOGIC
		);
	END COMPONENT ALU7bit;
	
	COMPONENT LED7
		 PORT(
			  SIGNAL sw : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			  SIGNAL led : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
		 );
	END COMPONENT LED7;
END PACKAGE Lab4_package;