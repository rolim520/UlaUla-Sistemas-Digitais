----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:05:28 10/25/2022 
-- Design Name: 
-- Module Name:    incremento - Behavioral 
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

-- Essa operacao tem como objetivo receber um vetor binario (x) e retornar, como saida, 
-- um vetor binario (z), alem das flags declaradas na ULA. Esse vetor e resultado da soma do vetor x com 1.
entity incremento is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           z : out  STD_LOGIC_VECTOR (3 downto 0);
           cout : out  STD_LOGIC;
           overflow : out  STD_LOGIC);
end incremento;

architecture Behavioral of incremento is
	signal aux: std_logic_vector (3 downto 0);
	signal cin: STD_LOGIC;

	-- Para facilitar a implementacao dessa operacao, nos aproveitamos do modulo de soma a fim de realizar a função.
	component somador is
	port 	(x, y: in std_logic_vector (3 downto 0);
		 cin: in std_logic;
	 	 z: out std_logic_vector (3 downto 0);
	 	 cout, overflow: out std_logic);
	end component;

begin
aux <= "0000";
cin <= '1';

-- Soma-se x com um vetor nulo e coloca-se Cin = 1
op: somador port map (x, aux, cin, z, cout, overflow);

end Behavioral;

