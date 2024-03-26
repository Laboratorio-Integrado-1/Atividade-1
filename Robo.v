module Robo (clock, reset, head, left, avancar, girar);
// Inputs, Outputs, Registradores e Parâmetros
input clock, reset, head, left;
output reg avancar, girar;
reg [1:0] EstadoAtual, EstadoFuturo;
reg[1:0] contador = 1'b1;
parameter ProcurandoMuro = 2'b00,
	  Rotacionando = 2'b01,
	  AcompanhandoMuro = 2'b10;

// Definição FSM
always @*

/*

// Default
EstadoFuturo = ProcurandoMuro;
avancar = 1'b0;
girar = 1'b0;

*/

begin

// Switch (Case):
case (EstadoAtual)
	ProcurandoMuro: case({head, left})
			2'b00: 
				begin
				EstadoFuturo = ProcurandoMuro;
				avancar = 1'b1;
				girar = 1'b0;
				end
			2'b01:
				begin
				EstadoFuturo = AcompanhandoMuro;
				avancar = 1'b1;
				girar = 1'b0;
				end
			2'b10:
				begin
				EstadoFuturo = Rotacionando;
				avancar = 1'b0;
				girar = 1'b1;
				end
			2'b11:
				begin
				EstadoFuturo = Rotacionando;
				avancar = 1'b0;
				girar = 1'b1;
				end
			endcase

	Rotacionando: case({head, left})
			2'b00: 
				begin
				EstadoFuturo = Rotacionando;
				avancar = 1'b0;
				girar = 1'b1;
				end
			2'b01:
				begin
				EstadoFuturo = AcompanhandoMuro;
				avancar = 1'b1;
				girar = 1'b0;
				end
			2'b10:
				begin
				EstadoFuturo = Rotacionando;
				avancar = 1'b0;
				girar = 1'b1;
				end
			2'b11:
				begin
				EstadoFuturo = Rotacionando;
				avancar = 1'b0;
				girar = 1'b1;
				end
			endcase

	AcompanhandoMuro: case({head, left})
			2'b00:
				begin
				EstadoFuturo = ProcurandoMuro;
				avancar = 1'b0;
				girar = 1'b1;
				end
			2'b01:
				begin
				EstadoFuturo = AcompanhandoMuro;
				avancar = 1'b1;
				girar = 1'b0;
				end
			2'b10:
				begin
				EstadoFuturo = ProcurandoMuro;
				avancar = 1'b0;
				girar = 1'b1;
				end
			2'b11:
				begin
				EstadoFuturo = Rotacionando;
				avancar = 1'b0;
				girar = 1'b1;
				end
			endcase
	default:
		begin
		EstadoFuturo = ProcurandoMuro;
		avancar = 1'b0;
		girar = 1'b0;
		end
endcase
end

// Att de Estado e Reset
always @(negedge clock or negedge reset)
begin
if(reset)
	EstadoAtual <= ProcurandoMuro;
/*
	case ({head,left})
		2'b00: EstadoAtual <= ProcurandoMuro;
		2'b01: EstadoAtual <= Rotacionando;
		2'b10: EstadoAtual <= AcompanhandoMuro;
		2'b11: EstadoAtual <= Rotacionando;
		default: EstadoAtual <= ProcurandoMuro;
	endcase
*/
else
	if (contador)
		EstadoAtual <= EstadoFuturo;
contador <= !contador;
end

endmodule
