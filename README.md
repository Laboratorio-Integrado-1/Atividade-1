# Atividade 1 - Especificação do Problema

## UNIVERSIDADE FEDERAL DA BAHIA – UFBA
### ESCOLA POLITÉCNICA / DEPARTAMENTO DE ENGENHARIA ELÉTRICA E DE COMPUTAÇÃO
#### ENGG52 – LABORATÓRIO INTEGRADO I-A – 2024.1
#### Wagner Luiz Alves de Oliveira

## Equipe

- Felipe Soares Trebino
- Fabio Miguel Mascarenhas dos Santos
- Marcio Gabriel Alves Trindade

## Especificação do Problema

O objetivo é construir o controlador de um robô capaz de acompanhar um muro. A seguir, apresentamos as características e exigências deste problema.

### Problema do Robô

O mundo do robô é uma matriz de células, onde cada célula pode estar livre ou ocupada por um muro. O robô, representado por um triângulo, é colocado em qualquer célula livre e pode estar voltado para uma das quatro direções principais: Norte, Sul, Leste ou Oeste. O robô está equipado com dois sensores binários:

- **Head**: Situado na frente do robô, retorna 1 se a célula à frente estiver ocupada por um muro, caso contrário retorna 0.
- **Left**: Localizado na lateral esquerda do robô, retorna 1 se a célula do lado esquerdo estiver ocupada por um muro, caso contrário retorna 0.

Em termos de movimentação, o robô pode:

- Avançar para a célula livre à sua frente.
- Rotacionar 90º para a esquerda, permanecendo na mesma célula.

Cada movimento consome 1 pulso de clock.

### Comportamento Exigido

1. **Área Livre (Ambos sensores 0)**: O robô deve avançar até encontrar um muro e então acompanhá-lo mantendo o muro ao seu lado esquerdo.
2. **Muro à Frente e à Esquerda (Ambos sensores 1)**: O robô deve rotacionar até que possa acompanhar um muro à sua esquerda.
3. **Muro Somente à Frente (Head = 1, Left = 0)**: Comportamento similar ao caso 2.
4. **Muro Somente à Esquerda (Head = 0, Left = 1)**: O robô deve acompanhar o muro.

O robô deve seguir o muro até encontrar um novo muro ou até que o muro faça uma curva à esquerda, ocasião em que o robô também deve dobrar à esquerda e prosseguir. A regra prioritária após cada rotação é que se houver um muro à esquerda, o robô deve acompanhá-lo.

![Figura 1. Campo de Teste](https://github.com/Laboratorio-Integrado-1/Atividade-1/blob/main/campo_de_teste.png)

## Implementação

O problema foi solucionado utilizando a linguagem de descrição de hardware (HDL) verilog. Baseado na máquina de estados fornecida, utilizando o paradigma  **Nível de Transferência de Registros (RTL)**.

![Figura 2. Maquina de Estados](https://github.com/Laboratorio-Integrado-1/Atividade-1/blob/main/maquina_de_estados.png)
