----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:25:12 10/27/2022 
-- Design Name: 
-- Module Name:    mod - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:25:12 10/27/2022 
-- Design Name: 
-- Module Name:    mod - Behavioral 
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
-- Esse modulo recebe duas entradas binarias (x, y) e retorna a saida z, que representa o resta 
-- da divisao inteira de x por y.
entity mode is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           y : in  STD_LOGIC_VECTOR (3 downto 0);
           z : out  STD_LOGIC_VECTOR (3 downto 0));
end mode;

architecture Behavioral of mode is
	signal caux: std_logic_vector (8 downto 0);
	signal overaux: std_logic_vector (8 downto 0);
	signal um,dois,tres,quatro,cinco,seis,sete,oito,nove: std_logic_vector(2 downto 0);
	signal aux1,aux2,aux3,aux4,aux5,aux6,aux7,aux8,aux9: std_logic_vector(3 downto 0);
	signal newaux1,newaux2,newaux3,newaux4,newaux5,newaux6,newaux7,newaux8: std_logic_vector(3 downto 0);
	
component comp_completo is
	    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
           res : out  STD_LOGIC_VECTOR (2 downto 0));
end component;

signal overflow, cout: std_logic;

component subtrator is

Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           y : in  STD_LOGIC_VECTOR (3 downto 0);
           z : out  STD_LOGIC_VECTOR (3 downto 0);
           cout : out  STD_LOGIC;
           overflow : out  STD_LOGIC);

end component;
begin
aux1 <= x;
-- Precisamos do subtrator para realizar o maior numero de subtracoes possiveis de x em relacao a y
-- e determinar o resto. 
op1: subtrator port map (aux1, y, newaux1, caux(0), overaux(0));
op2: comp_completo port map (aux1,y,dois);
aux2 <= newaux1 when (dois(0) = '0') else
			aux1;
			
op3: subtrator port map (aux2, y, newaux2, caux(1), overaux(1));
op4: comp_completo port map (aux2,y,tres);
aux3 <= newaux2 when (tres(0) = '0') else
		   aux2;
			
op5: subtrator port map (aux3, y, newaux3, caux(2), overaux(2));
op6: comp_completo port map (aux3,y,quatro);
aux4 <= newaux3 when (quatro(0) = '0') else
		   aux3;
			
op7: subtrator port map (aux4, y, newaux4, caux(3), overaux(3));
op8: comp_completo port map (aux4,y,cinco);
aux5 <= newaux4 when (cinco(0) = '0') else
		   aux4;
			
op9: subtrator port map (aux5, y, newaux5, caux(4), overaux(4));
op10: comp_completo port map (aux5,y,seis);
aux6 <= newaux5 when (seis(0) = '0') else
		   aux5;

op11: subtrator port map (aux6, y, newaux6, caux(5), overaux(5));
op12: comp_completo port map (aux6,y,sete);
aux7 <= newaux6 when (sete(0) = '0') else
		   aux6;

op13: subtrator port map (aux7, y, newaux7, caux(6), overaux(6));
op14: comp_completo port map (aux7,y,oito);
aux8 <= newaux7 when (oito(0) = '0') else
		   aux7;

op15: subtrator port map (aux8, y, newaux8, caux(7), overaux(7));
op16: comp_completo port map (aux8,y,nove);
aux9 <= newaux8 when (nove(0) = '0') else
		   aux8;
			
z <= aux9;

end Behavioral;
