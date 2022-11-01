----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:40:17 10/27/2022 
-- Design Name: 
-- Module Name:    mdc - Behavioral 
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

entity mdc is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           y : in  STD_LOGIC_VECTOR (3 downto 0);
           z : out  STD_LOGIC_VECTOR (3 downto 0);
           neg : out  STD_LOGIC);
end mdc;

architecture Behavioral of mdc is

signal a1,a2,a3,a4,a5,a6,a7,a8: std_logic_vector(3 downto 0);
signal b1,b2,b3,b4,b5,b6,b7,b8: std_logic_vector(3 downto 0);
signal c1,c2,c3,c4,c5,c6,c7,c8: std_logic_vector(3 downto 0);

component mode is

    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
               y : in  STD_LOGIC_VECTOR (3 downto 0);
               z : out  STD_LOGIC_VECTOR (3 downto 0));

end component;

begin
a1 <= x;
b1 <= y;

op1: mode port map(a1,b1,c1);
a2 <= a1 when (c1 = "0000") else
		b1;
b2 <= b1 when (c1 = "0000") else
      c1; 

op2: mode port map(a2,b2,c2);
a3 <= a2 when (c2 = "0000") else
		b2;
b3 <= b2 when (c2 = "0000") else
      c2; 

op3: mode port map(a3,b3,c3);
a4 <= a3 when (c3 = "0000") else
		b3;
b4 <= b3 when (c3 = "0000") else
      c3; 
		
op4: mode port map(a4,b4,c4);
a5 <= a4 when (c4 = "0000") else
		b4;
b5 <= b4 when (c4 = "0000") else
      c4; 		
		
op5: mode port map(a5,b5,c5);
a6 <= a5 when (c5 = "0000") else
		b5;
b6 <= b5 when (c5 = "0000") else
      c5; 
		
op6: mode port map(a6,b6,c6);
a7 <= a6 when (c6 = "0000") else
		b6;
b7 <= b6 when (c6 = "0000") else
      c6; 
		
op7: mode port map(a7,b7,c7);
a8 <= a7 when (c7 = "0000") else
		b7;
b8 <= b7 when (c7 = "0000") else
      c7; 

		
z <= b8;

end Behavioral;
