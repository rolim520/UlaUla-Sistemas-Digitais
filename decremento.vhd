----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:26:51 10/25/2022 
-- Design Name: 
-- Module Name:    decremento - Behavioral 
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
-- um vetor binario (z), alem das flags declaradas na ULA. Esse vetor e resultado da subtracao do vetor x por 1.

entity decremento is
    
	Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           z : out  STD_LOGIC_VECTOR (3 downto 0);
			  cout: out STD_LOGIC;
			  overflow: out STD_LOGIC);
end decremento;

architecture Behavioral of decremento is
	
	signal aux: std_logic_vector (3 downto 0);
-- Para facilitar a implementacao dessa operacao, nos aproveitamos do modulo de subtrator a fim de realizar a função.

	component subtrator is
	port 	(x, y: in std_logic_vector (3 downto 0);
	 	 z: out std_logic_vector (3 downto 0);
	 	 cout, overflow: out std_logic);
	end component;

begin
	aux <= "0001";

	op: subtrator port map (x, aux, z, cout, overflow);

end Behavioral;

