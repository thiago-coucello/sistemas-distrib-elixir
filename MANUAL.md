# Referências:

Todas as informações postas neste arquivo foram retiradas de:

- https://elixir-lang.org/getting-started/basic-types.html
- https://hexdocs.pm/elixir/String.html

## Tipos Básicos no Elixir

| **Valor**    |   **Tipo**   |
|:------------ |:------------ |
| 1            | int          |
| 0x1F         | int          |
| 1.0          | float        |
| :apple       | atom         |
| true         | boolean      | 
| "elixir"     | string       |
| [1, 2, 3]    | list         |
| {1, 2, 3}    | tuple        |

## Operações Básicas no Elixir

```elixir
iex> 1 + 2
3
iex> 5 * 5
25
iex> 10 / 2
5.0
```

---
Observação:

**Note que a operação de divisão ( / ) sempre retorna um tipo float.**

Para divisão de inteiros ou para encontrar o resto
da divisão, tem-se as seguintes funções

```elixir
iex> div(10, 2)
5
iex> div 10, 2
5
iex> rem 10, 3
1
```

---

## Elixir suporta algums atalhos para notações matemáticas e numéricas
---
Por exemplo se quisermos identificar o número binário 0101, o número octal 044 e o número hexadecimal F12:

```elixir
iex> 0b0101
5
iex> 0o044
36
iex> 0xF12
3858
```

---
A representação matemática dos decimais 1.5 e 1.5e-20

**Note que números tipo float precisam de pelo menos um número decimal seguido do ponto**

```elixir
iex> 1.5
1.5
iex> 1.5e-20
1.5e-20
```

No Elixir os números floats possuem 64bits de precisão.

## Arredondamento dos tipos float

No Elixir tem-se a função **round()** que encontra o inteiro mais próximo de um determinado float, e a função **trunc()** que recupera somente a parte inteira de um determinado float.

```elixir
iex> round(4.8)
5
iex> trunc(3.2125)
3
```

## Documentações de funções

O Elixir disponibiliza um mecanismo muito fácil e prático para encontrar a documentação de uma função específica, a função `h`.

A função `h` possui duas sintaxes possíveis:

```elixir
h {função}/{n° argumentos}
h {modulo}.{função}/{n° argumentos}
```

---
Exemplo, suponhamos que exista uma função `elixir` que possua 3 sobrecargas, uma com um único parâmetro, outra com dois, e a última com três, para encontrar a documentação da função basta executar a função `h`:

Caso a função esteja declarada no `Kernel` (já seja importada automaticamente no `namespace`):

```elixir
iex> h elixir/1   # Recupera a documentação da função com um argumento

iex> h elixir/2   # Recupera a documentação da função com dois argumentos

iex> h elixir/3   # Recupera a documentação da função com três argumentos

iex> h trunc/1    # Exemplo utilizando uma função que existe

def trunc(number) 
@spec trunc(number()) :: integer()
guard: true
Returns the integer part of `number`.

Allowed in guard tests. Inlined by the compiler.
## Examples
  iex> trunc(5.4)
  5 
  iex> trunc(-5.99)
  -5
  iex> trunc(-5)
  -5
```
---
Caso a função esteja em um outro módulo também é possível procurar sua documentação utilizando a segunda sintaxe da função `h`:

Supondo que exista a função `teste` no módulo `SisDistrib` e que ela receba 2 argumentos:

```elixir
h SisDistrib.teste/2
```
---
É possível utilizar a função `h` até para procurar a documentação de operadores:

```elixir
def left - right 
@spec integer() - integer() :: integer()
@spec float() - float() :: float()
@spec integer() - float() :: float()
@spec float() - integer() :: float()
guard: true
Arithmetic subtraction operator.
Allowed in guard tests. Inlined by the compiler.
## Examples
  iex> 1 - 2
  -1
```
---
**Ao invocar a função `h` sem argumentos ela exibe a documentação para funções do módulo `IEx.Helpers`, que contém a própria função `h` e outras mais.**

---
## Elixir também suporta operações booleanas

```elixir
iex> true
true
iex> true == false
false

```
---
Também disponibiliza algumas funções para verificar os tipos de uma variável, como:

```elixir
is_boolean/1
is_integer/1
is_float/1
is_number/1
```
---
Exemplo:
```elixir
iex> is_boolean(true)
true
iex> is_number(false)
false
```

## Tipos atômicos no Elixir

Os tipos atômicos são constantes cujo valor é o próprio nome. Algumas linguagens a chamam de símbolos, e são muito útils para diferenciar entre valores distintos, sua declaração é feita da seguinte forma:

```
:{nome do átomo}
```

Exemplo:

```elixir
iex> :sol
:sol
iex> :lua
:lua
iex> :eclipse
:eclipse
```
---
**Na comparação entre átomos, serão iguais aqueles que tiverem o mesmo nome:**

```elixir
iex> :sol == :lua
false
iex> :sol == :sol
true
```
---
Átomos são muito utilizados em definições de estado, onde podemos utilizar átomos como `:ok` ou `:sucesso` e `:erro`

---
Os valores `true`e `false` também são átomos

```elixir
iex> is_atom(true)
true
```

**O Elixir permite que os valores atômicos `true`, `false` e `nil` sejam representados sem os `:`.**

---
No Elixir existe ainda um construtor chamado de ```aliases```. Os quais começam com letra maiúscula e também são átomos.

## Os tipos string

Como normalmente utilizado em outras linguagens o tipo `string` é representado utilizando aspas duplas `""` e são codificadas em `UTF-8`

```elixir
iex> "Olá"
"Olá"
```
---
**Alguns terminais podem ter dificuldades em exibir a string corretamente por não suportar a codifição `UTF-8`**

---
As strings no elixir suportam a operação de interpolação:

```elixir
iex> string = :aula
:aula
iex> "Bem vindo a #{string}"
"Bem vindo a aula"
```

Também podem apresentar quebras de linha (`\n`):

```elixir
iex> "Bem vindo a aula:
...> Thiago Fernandes"
"Bem vindo a aula:\nThiago Fernandes"
iex> "Bem vindo a aula:\nThiago Fernandes"
"Bem vindo a aula:\nThiago Fernandes"
```

É possível printar na tela utilizando a função `IO.puts/1`:

```elixir
iex> IO.puts("Bem vindo a aula:\nThiago Fernandes")
Bem vindo a aula
Thiago Fernandes
:ok
```

No Elixir as string são internamente representadas como uma sequência de `bytes` (são binárias):

```elixir
iex> is_binary("Texto qualquer") # Verifica se a string é binário
true
iex> byte_size("Texto qualquer") # Número de bytes na string
14
iex> byte_size("hellö")
6 # Porque 6 se "hellö" possui 5 caracteres?
```

Para encontrar o número correto de caracteres em uma `string` basta utilizar a função `length` do módulo `String`:

```elixir
iex> String.length("hellö")
5
```

O módulo `String` contém várias funções para se trabalhar com essas variáveis:

```elixir
<> # Concatenação de strings
"string1 #{string2}" # Interpolação de strings
"\n\t\r"  # Caracteres de escape
String.upcase/1  # Converte para caixa alta
String.downcase/1 # Converte para caixa baixa
```
---
Mais informações em:

- https://hexdocs.pm/elixir/String.html
---

## Funções anônimas

Elixir oferece a possibilidade de criar `funções anônimas`. Permitindo guardar e passar adiante um código executável como se fosse um inteiro ou uma string.

**São delimitadas pelas palavras chave `fn` e `end`**

```elixir
# Cria uma função anônima que concatena duas strings e atribui ela a variável { concat }
iex> concat = fn a, b -> a <> b end
#Function<43.40011524/2 in :erl_eval.expr/5>

# Executando a função anônima
iex> concat.("string1", "string2")
"string1string2"
```
---
**Para utilizar funções anônimas é essencial que a sintaxe seja mantida `variavel.(parametros)`**

---
É possível identificar se uma variável armazena uma função utilizando a função `is_function/2`:

```elixir
# is_function({variavel}, {n° parametros})

# Verifica se concat é uma função que recebe 2 parâmetros
iex> is_function(concat, 2)
true
# Verifica se concat é uma função que recebe 1 parâmetro
iex> is_function(concat, 1)
false
```

As funções anônimas podem ser declaradas e executadas sem serem atribuídas a variáveis:

```elixir
# Redeclarando a função concat sem atribuí-la a uma variável
iex> (fn a, b -> a <> b end).("string1", " string2")
"string1 string2"
```

E também podem acessar outras variáveis declaradas no mesmo escopo:

```elixir
# Uma função que recebe duas strings e faz retorna o número de caracteres depois de concatena-las
iex> len = 
fn str1, str2 -> 
  String.length(concat.(str1, str2)) 
end

iex> len.("texto", "qualquer")
13
```

Como é comun em outras linguagens variáveis atribuídas dentro das funções anônimas não afetam o resto do ambiente:

```elixir
iex> nome = "Thiago"
"Thiago"
iex> (fn -> nome = "Não é mais Thiago" end).()
"Não é mais Thiago"
iex> nome
"Thiago"
```
