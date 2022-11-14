----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:48:41 10/25/2022 
-- Design Name: 
-- Module Name:    comp_completo - Behavioral 
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

-- Esse modulo recebe duas entradas binarias, compara-as bit a bit, partindo do bit mais significativo
-- e retorna como saida um sinal indicando se x>y, x=y ou x<y.
entity comp_completo is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
           res : out  STD_LOGIC_VECTOR (2 downto 0));
end comp_completo;

architecture Behavioral of comp_completo is

	signal maior: std_logic;
	signal igual: std_logic;
	signal menor: std_logic;

	signal trd: std_logic_vector(2 downto 0);
	signal snd: std_logic_vector(2 downto 0);
	signal fst: std_logic_vector(2 downto 0);
	signal zero: std_logic_vector(2 downto 0);

-- O comparador de um bit e utilizado e expandido para criar o comparador completo.
	component comparadorum is
	port (x,y: in std_logic;
		z: out std_logic_vector (2 downto 0));
	end component;
	
begin

op1: comparadorum port map (a(3), b(3), trd);
op2: comparadorum port map (a(2), b(2), snd);
op3: comparadorum port map (a(1), b(1), fst);
op4: comparadorum port map (a(0), b(0), zero);

-- Indicacao das condicoes para as saidas.
maior <= trd(0) OR (trd(1) AND snd(0)) OR (trd(1) AND fst(0) AND snd(1)) OR (trd(1) AND snd(1) AND fst(1) AND zero(0));
igual <= trd(1) AND snd(1) AND fst(1) AND zero(1);
menor <= trd(2) OR (trd(1) AND snd(2)) OR (trd(1) AND fst(2) AND snd(1)) OR (trd(1) AND snd(1) AND fst(1) AND zero(2));
 
res <= (menor, igual, maior);

end Behavioral;

