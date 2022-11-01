----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:59:46 10/25/2022 
-- Design Name: 
-- Module Name:    subtrator - Behavioral 
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

entity subtrator is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           y : in  STD_LOGIC_VECTOR (3 downto 0);
           z : out  STD_LOGIC_VECTOR (3 downto 0);
           cout : out  STD_LOGIC;
           overflow : out  STD_LOGIC);
end subtrator;

architecture Behavioral of subtrator is

	signal noty: std_logic_vector (3 downto 0);
	signal cin: std_logic;

	component somador is
	port 	(x, y: in std_logic_vector (3 downto 0);
		 cin: in std_logic;
	 	 z: out std_logic_vector (3 downto 0);
	 	 cout, overflow: out std_logic);
	end component;

begin

	noty <= NOT y;
	cin <= '1';
	op: somador port map (x, noty, cin, z, cout, overflow);

end Behavioral;

