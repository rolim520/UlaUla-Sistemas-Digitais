----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:43:51 10/25/2022 
-- Design Name: 
-- Module Name:    somador - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity somador is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           y : in  STD_LOGIC_VECTOR (3 downto 0);
           cin : in  STD_LOGIC;
           z : out  STD_LOGIC_VECTOR (3 downto 0);
           cout : out  STD_LOGIC;
           overflow : out  STD_LOGIC);
end somador;

architecture Behavioral of somador is

	signal c: std_logic_vector (3 downto 0);
	
	component fulladder is
	port (a,b,cin: in STD_LOGIC;
	soma,cout: out STD_LOGIC);
	end component;
	
begin
	
	op1: fulladder port map (x(0), y(0), cin, z(0), c(0));
	op2: fulladder port map (x(1), y(1), c(0), z(1), c(1));
	op3: fulladder port map (x(2), y(2), c(1), z(2), c(2));
	op4: fulladder port map (x(3), y(3), c(2), z(3), c(3));

	cout <= c(3);
	overflow <= c(3) XOR c(2);
	
	

end Behavioral;

