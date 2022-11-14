----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:12:24 10/25/2022 
-- Design Name: 
-- Module Name:    complemento - Behavioral 
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


-- Operacao responsavel por realizar o complemento a 2 de um vetor x
-- Sao retornados o comlemento a 2(z), o Cout e o overflow
entity complemento is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           z : out  STD_LOGIC_VECTOR (3 downto 0);
			  cout: out STD_LOGIC;
			  overflow: out STD_LOGIC);
end complemento;

architecture Behavioral of complemento is
	signal x_barrado: std_logic_vector (3 downto 0);
	signal aux: std_logic_vector (3 downto 0);
	signal cin: std_logic;

	component somador is
	port 	(x, y: in std_logic_vector (3 downto 0);
		 cin: in std_logic;
	 	 z: out std_logic_vector (3 downto 0);
	 	 cout, overflow: out std_logic);
	end component;

begin

-- O complemento a 2 e feito invertendo o vetor x, somando o mesmo com um vetor nulo e colocando Cin = 1
x_barrado <= NOT x;
aux <= "0000";
cin <= '1';
op: somador port map (x_barrado, aux, cin, z, cout, overflow);
end Behavioral;

