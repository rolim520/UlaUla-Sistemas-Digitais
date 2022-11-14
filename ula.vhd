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
           z : out  STD_LOGIC_VECTOR (3 downto 0);
			  cout : out STD_LOGIC;
			  overflow : out STD_LOGIC;
			  zero : out STD_LOGIC;
			  sinal : out STD_LOGIC);
			
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
	signal ziero: std_logic_vector(8 downto 1);
	signal sienal: std_logic_vector(8 downto 1);

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

ziero(1) <= NOT(ans1(0) OR ans1(1) OR ans1(2) OR ans1(3));
ziero(2) <= NOT(ans2(0) OR ans2(1) OR ans2(2) OR ans2(3));
ziero(3) <= NOT(ans3(0) OR ans3(1) OR ans3(2) OR ans3(3));
ziero(4) <= NOT(ans4(0) OR ans4(1) OR ans4(2) OR ans4(3));
ziero(5) <= NOT(ans5(0) OR ans5(1) OR ans5(2) OR ans5(3));
ziero(6) <= '0';
ziero(7) <= NOT(ans7(0) OR ans7(1) OR ans7(2) OR ans7(3));
ziero(8) <= NOT(ans8(0) OR ans8(1) OR ans8(2) OR ans8(3));

sienal(1) <= ans1(3);
sienal(2) <= ans2(3);
sienal(3) <= ans3(3);
sienal(4) <= ans4(3);
sienal(5) <= ans5(3);
sienal(6) <= '0';
sienal(7) <= ans7(3);
sienal(8) <= ans8(3);

newans6 <= ('0',ans6(2),ans6(1),ans6(0));

z <= ans1 when (sel = "000") else
     ans2 when (sel = "001") else
     ans3 when (sel = "010") else
     ans4 when (sel = "011") else
     ans5 when (sel = "100") else
     newans6 when (sel = "101") else
     ans7 when (sel = "110") else
     ans8;
	  
cout <= cout_soma when (sel = "000") else
     cout_sub when (sel = "001") else
     cout_inc when (sel = "010") else
     cout_dec when (sel = "011") else
     cout_compl when (sel = "100") else
     '0' when (sel = "101") else
     '0' when (sel = "110") else
     '0';

overflow <= of_soma when (sel = "000") else
     of_sub when (sel = "001") else
     of_inc	when (sel = "010") else
     of_dec when (sel = "011") else
     of_compl when (sel = "100") else
     '0' when (sel = "101") else
     '0' when (sel = "110") else
     '0';
	  
zero <= ziero(1) when (sel = "000") else
     ziero(2) when (sel = "001") else
     ziero(3) when (sel = "010") else
     ziero(4) when (sel = "011") else
     ziero(5) when (sel = "100") else
     ziero(6) when (sel = "101") else
     ziero(7) when (sel = "110") else
     ziero(8);
	 
sinal <= sienal(1) when (sel = "000") else
     sienal(2) when (sel = "001") else
     sienal(3) when (sel = "010") else
     sienal(4) when (sel = "011") else
     sienal(5) when (sel = "100") else
     sienal(6) when (sel = "101") else
     sienal(7) when (sel = "110") else
     sienal(8);
	  
end Behavioral;


