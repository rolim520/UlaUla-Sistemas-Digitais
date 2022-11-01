----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:42:27 10/25/2022 
-- Design Name: 
-- Module Name:    comparadorum - Behavioral 
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

entity comparadorum is
    Port ( x : in  STD_LOGIC;
           y : in  STD_LOGIC;
           z : out  STD_LOGIC_VECTOR (2 downto 0));
end comparadorum;

architecture Behavioral of comparadorum is

signal g: std_logic;
signal e: std_logic;
signal s: std_logic;

begin

g <= x AND (NOT y);
e <= NOT(x XOR y);
s <= NOT(x) AND y;

z <= (g,e,s);
end Behavioral;

