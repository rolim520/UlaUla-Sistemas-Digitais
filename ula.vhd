----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:26:36 10/25/2022 
-- Design Name: 
-- Module Name:    ula - Behavioral 
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

entity ula is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           --y : in  STD_LOGIC_VECTOR (3 downto 0);
           --sel : in  STD_LOGIC_VECTOR (2 downto 0);
           z : out  STD_LOGIC_VECTOR (3 downto 0));
			  
			  
end ula;

architecture Behavioral of ula is

	component comp_completo is
	Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
           res : out  STD_LOGIC_VECTOR (2 downto 0));
	end component;
	
	component complemento is
	Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           z : out  STD_LOGIC_VECTOR (3 downto 0);
			  cout: out STD_LOGIC;
			  overflow: out STD_LOGIC);
	end component;
	
	component decremento is
	Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           z : out  STD_LOGIC_VECTOR (3 downto 0);
			  cout: out STD_LOGIC;
			  overflow: out STD_LOGIC);
	end component;

	component somador is
	Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           y : in  STD_LOGIC_VECTOR (3 downto 0);
           cin : in  STD_LOGIC;
           z : out  STD_LOGIC_VECTOR (3 downto 0);
           cout : out  STD_LOGIC;
           overflow : out  STD_LOGIC);
	end component;
	
	component subtrator is
	Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           y : in  STD_LOGIC_VECTOR (3 downto 0);
           z : out  STD_LOGIC_VECTOR (3 downto 0);
           cout : out  STD_LOGIC;
           overflow : out  STD_LOGIC);
	end component;
	
	component incremento is
	Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           z : out  STD_LOGIC_VECTOR (3 downto 0);
           cout : out  STD_LOGIC;
           overflow : out  STD_LOGIC);
	end component;
	
	component mode is

    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
               y : in  STD_LOGIC_VECTOR (3 downto 0);
               z : out  STD_LOGIC_VECTOR (3 downto 0));

end component;

	component mdc is
	Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           y : in  STD_LOGIC_VECTOR (3 downto 0);
           z : out  STD_LOGIC_VECTOR (3 downto 0);
           neg : out  STD_LOGIC);
	end component;

	signal ans6: std_logic_vector (2 downto 0); signal newans6: std_logic_vector (3 downto 0);
	signal ans1, ans2, ans3, ans4, ans5, ans7, ans8: std_logic_vector (3 downto 0);
	signal cin: std_logic;
	signal cout_soma, of_soma, cout_sub, of_sub, cout_inc, of_inc, cout_compl, of_compl, 
	cout_dec, of_dec, z_comparador, neg_mdc: std_logic;

	signal y: std_logic_vector(3 downto 0);
	signal sel: std_logic_vector(2 downto 0);

begin

y <= "0100";
sel <= "111";

cin <= '0';
op1: somador port map (x,y,cin,ans1,cout_soma,of_soma);
op2: subtrator port map (x,y,ans2,cout_sub,of_sub);
op3: incremento port map (x, ans3, cout_inc, of_inc);
op4: decremento port map (x, ans4, cout_dec, of_dec);
op5: complemento port map (x, ans5, cout_compl, of_compl);
op6: comp_completo port map (x, y, ans6);
op7: mode port map (x,y,ans7);
op8: mdc port map (x,y,ans8,neg_mdc);

newans6 <= ('0',ans6(2),ans6(1),ans6(0));

z <= ans1 when (sel = "000") else
     ans2 when (sel = "001") else
     ans3 when (sel = "010") else
     ans4 when (sel = "011") else
     ans5 when (sel = "100") else
     newans6 when (sel = "101") else
     ans7 when (sel = "110") else
     ans8;
	  
end Behavioral;

