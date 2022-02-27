# Referências:

Todas as informações postas neste arquivo foram retiradas de:

- https://elixir-lang.org/install.html
- https://elixir-lang.org/getting-started/basic-types.html
- https://hexdocs.pm/elixir/String.html
- https://elixir-lang.org/getting-started/modules-and-functions.html

# Instalação

  - MacOs
    - Usando **Homebrew**: `brew install elixir`
    - Usando **Macports**: `sudo port install elixir`

  - GNU/Linux
    - ArchLinux: `pacman -S elixir`
    - Ubuntu/Debian: 
      - Adicione o repositório `Earlang Solutions`: `wget https://packages.erlang-solutions.com/erlang-solutions_2.0_all.deb && sudo dpkg -i erlang-solutions_2.0_all.deb`
      - Atualize os pacotes: `sudo apt-get update`
      - Instalando a plataforma Earlang/OTP: `sudo apt-get install esl-erlang`
      - Instalando o Elixir: `sudo apt-get install elixir`

  - Windows
    - Usando instalador web:
      - [Baixe o instalador](https://github.com/elixir-lang/elixir-windows-setup/releases/download/v2.2/elixir-websetup.exe)
      - Instalação padrão: `next, next, ..., finish`
    - Utilizando `chocolatey`: `cinst elixir`

  - Docker
    - Entre no modo interativo:
      - Execute: `docker run -it --rm elixir`
    - Entre no terminal dentro do container com o elixir instalado:
      - Execute: `docker run -it --rm elixir bash`

  A instalação do Docker automaticamente aponta para a última versão do Erlang e Elixir, é recomendado utilizar [Hex pm Docker images](https://hub.docker.com/r/hexpm/elixir) que são imutáveis e apontam para uma versão específica do Erlang e Elixir.

  Mais informações podem ser adquiridas na página de instalação:

  - https://elixir-lang.org/install.html

# Tipos Básicos no Elixir

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
iex> h -/2

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

## Listas no Elixir
As listas no elixir são representadas por colchetes `[]` especificando uma lista de valores. Os valores podem ser de qualquer tipo:

```elixir
iex> lista = [1, 5.0, :atomo, "Texto", false]
[1, 5.0, :atomo, "Texto", false]
iex> length lista
5
```
---
Como é possível observar no exemplo acima, o módulo `Kernel` possui uma função length/1 que retorna o tamanho de uma lista.

---

Listas podem ser concatenadas ou subtraídas utilizando os operadores `++/2` e `--/2`:

```elixir
iex> [1, 2, 3] ++ [4, 5, 6]
[1, 2, 3, 4, 5, 6]

iex> [1, true, 2, false, 3, true] -- [true, false]
[1, 2, 3, true]

iex> [1, true, 2, false, 3, true] -- [true, false, true]
[1, 2, 3]
```

As operações com listas nunca modificam a lista em questão, apenas geram uma nova lista com os valores modificados.

---
**No elixir as estruturas de dados como `lista (list)` e `tuplas (tuple)` são imutáveis**

---
É possível que quando uma lista for criada ela seja representada como uma string em aspas simples `''`, por exemplo:

```elixir
iex> [11, 12, 13]
'\v\f\r'

iex> [104, 101, 108, 108, 111]
'hello'
```

Isso acontece porque quando o Elixir percebe uma lista com elementos "printáveis", ele vai exibí-los como uma **lista de caracteres**.

Sempre que um valor inesperado surgir ao mexer com o IEx é possível observar as informações dele com a função `i/1`:

```elixir
iex> i 'uma lista de caracteres'

Term
  'uma lista de caracteres'

Data type
  List

Description
  This is a list of integers that is printed as a sequence of characters
  delimited by single quotes because all the integers in it represent printable ASCII characters. 
  
  Conventionally, a list of Unicode code points is known as a charlist and a list of ASCII characters is a subset of it.

Raw representation
  [117, 109, 97, 32, 108, 105, 115, 116, 97, 32, 100, 101, 32, 99, 97, 114, 97, 99, 116, 101, 114, 101, 115]

Reference modules
  List

Implemented protocols
  Collectable, Enumerable, IEx.Info, Inspect, List.Chars, String.Chars

```

Para comprovar a diferença entre uma lista de caracteres e uma string, basta realizar o teste:

``` elixir
ìex> 'string' == "string"
false
```
---
*AVISO:*

**As listas no elixir são listas conectadas `linked lists`, ou seja os seus elementos não estão necessariamente salvos em sequência na memória então buscas e acessos a indices específicos podem demorar um pouco**

## Tuplas no Elixir
As tuplas, diferentemente das listas, são armazenadas em espaços contínuos de memória (cada elemento é armazenado em sequência).

São representadas por chaves `{}` e também podem armazenar qualquer valor:

```elixir
iex> {:sistemas, "Um texto"}
{:sistemas, "Um texto"}
```

Como o armazenamento dos elementos é contínuo, **acessar uma tupla por indices específicos** é uma tarefa com **complexidade O(1)**.

Recuperar o tamanho de uma tupla também é uma tarefa bem rápida:

```elixir
iex> tupla = {:sistemas, "Um texto"}
{:sistemas, "Um texto"}

# Recupera o elemento de indice 1 da tupla (indices começam em 0)
iex>  elem(tupla, 1)
"Um texto"

iex> tuple_size(tupla)
2
```

Também é possível inserir novos elementos em uma tupla utilizando a função `put_elem/3`, observando a sintaxe com `h` temos:

```elixir
iex> h put_elem/3

def put_elem(tuple, index, value)
@spec put_elem(tuple(), non_neg_integer(), term()) :: tuple()

Puts `value` at the given zero-based `index` in `tuple`.

Inlined by the compiler.

## Examples

    iex> tuple = {:foo, :bar, 3}
    iex> put_elem(tuple, 0, :baz)
    {:baz, :bar, 3}
```

Um outro exemplo:

```elixir
iex> tupla = {:sistemas, "Um texto"}
{:sistemas, "Um texto"}

iex> put_elem(tupla, 1, "Outro texto")
{:sistemas, "Outro texto"}

iex> tupla
{:sistemas, "Um texto"}
```
---
**Diferentemente do python os valores de uma tupla podem ser "modificados"**

---

## Uma comparação entre Listas e Tuplas

Como as listas são armazenadas em memória como `linked lists` recuperar seu tamanho é uma tarefa com **complexidade O(n)**.

De forma similar a concatenação de listas depende do tamanho da lista a esquerda da operação:

```elixir
iex> lista = [1, 2, 3, 4, 5, 6, 7]

iex> [0] ++ lista
[0, 1, 2, 3, 4, 5, 6, 7]

iex> lista ++ [8]
[0, 1, 2, 3, 4, 5, 6, 7, 8]
```

Por outro lado, como as tuplas são armazenadas em sequência acessar o tamanho ou um elemento específico é mais rápido, mas atualizar ou adicionar elementos em uma é mais custoso pois envolve criar outra tupla em memória.

```elixir
iex> tuple = {:a, :b, :c, :d}
{:a, :b, :c, :d}
iex> put_elem(tuple, 2, :e)
{:a, :b, :e, :d}
```

Mas no caso esse problema só se aplica a própria tupla, não aos seus elementos.

O uso mais comum das tuplas, assim como no python, é para retornar mais informações em uma função, por exemplo:

``` elixir
iex> funcao = 
  fn a, b ->
    c = a * 2
    d = b / 2
    {c, d}
  end

iex> funcao.(2, 5)
{4, 2.5}

iex> {resp1, resp2} = funcao(3, 7)
iex> resp1
6
iex> resp2
3.5
```

# Módulos e funções

Os módulos no Elixir são representados pelas palavras-chave `defmodule` e `end`, enquanto as funções dentro dos módulos por `def` e `end`:

```elixir
iex> defmodule Exemplo do:
  ...
  def funcao(param) do:
    ...
  end
end 

iex> Exemplo.funcao(param)
...

```

Com a criação de módulos e funções, pode ser muito trabalhoso declará-los no terminal interativo `IEx` para isso os exemplos serão criados em arquivos `.ex`:

Criando um módulo `Math` no arquivo `ExemploMath\math.ex`, escrevemos dentro dele:

```elixir
defmodule Math do
  def sum(a, b) do
    a + b
  end
end
```

Para compilar o arquivo basta executar `elixirc ExemploMath\math.ex`.

Depois da compilação será criado um arquivo `Elixir.Math.beam`, assim que o terminal interativo IEx for executado novamente o módulo estará disponível.

## Organização da árvore de projetos

* `_builder`
  * Contém os artefatos de compilação
* `lib`
  * Contém o código em elixir (normalmente `.ex`)
* `test`
  * Contém os códigos para teste (normalmente `.exs`)

Quando trabalhando com projetos a ferramenta de build `mix` será responsável por compilar e organizar os devidos caminhos. Por motivos de conveniência o Elixir também possibilita trabalhar num modo baseado em scripts, que é mais flexível.

## Scripts

Os scripts do Elixir são caracterizados pela extensão `.exs` e são tratados da mesma forma que os arquivos `.ex`, a única diferença sendo seus objetivos.

Por exemplo podemos criar um script muito similar ao módulo `ExemploMath\math.ex`.

Para isso criamos o arquivo `ExemploMath\math.exs` e escrevemos o mesmo código presente no módulo:

``` elixir
defmodule Math do
  def sum(a, b) do
    a + b
  end
end
```

Mas como o `math.exs` é um arquivo que pode ser executado, podemos inserir a chamada da função nele mesmo utilizando um print:

``` elixir
defmodule Math do
  def sum(a, b) do
    a + b
  end
end

IO.puts(Math.sum(1, 2))

# IO.puts Math.sum(1, 2) também funciona
```

Para executar um determinado script basta escrever no seu terminal:

```
> elixir .\math.exs

> elixir caminho\para\math.exs
```

## Modificadores de função

Dentro de um determinado módulo, podemos ter dois tipos de funções, as funções públicas que são definidas por `def` e as funções privadas definidas por `defp`.

As funções privadas só podem ser chamadas de dentro do próprio módulo.

Por exemplo podemos alterar o script `math.exs` para:

``` elixir
defmodule Math do
  def divide(a, b) do
    print(a / b)
  end

  defp print(msg) do
    IO.puts(msg)
  end
end

Math.divide(5,2) # 2.5
Math.print("Uma mensagem") # Erro
```

As declarações de funções também suportam guardas e cláusulas multiplas. Se uma função possui várias cláusulas o Elixir testará cada uma até encontrar uma que combine. Aqui está a implementação de uma função que checa se um número é par ou ímpar:

```elixir
defmodule Math do
  # O ? no final indica que as funções retornam booleano (convenção de nomenclatura no Elixir)
  def par?(2) do
    true
  end

  def par?(num) when is_integer(num) do
    rem(num, 2) == 0
  end
end

IO.puts Math.par?(2)  # true
IO.puts Math.par?(4)  # true
IO.puts Math.par?(1)  # false
IO.puts Math.par?([1, 2, 3])  # erro
IO.puts Math.par?(0, 0) # erro
```

As funções podem ser declaradas tanto no formato `do` como no formato `do:`, mostrado a baixo:

```elixir
defmodule Math do
  # O ? no final indica que as funções retornam booleano (convenção de nomenclatura no Elixir)
  def par?(2), do: true

  def par?(num) when is_integer(num), do: rem(num, 2)
end
```

## Capturando funções e operações no iex

No iex as funções e operações podem ser capturadas e atribuídas a variáveis. Como exemplo vamos executar o script `math.exs` com o  iex, primeiro retiramos as linhas que podem dar erro do final do arquivo e executamos o comando a seguir no terminal:

```
> iex ExemploMath\math.exs

# No powershell
> iex.bat ExemploMath\math.exs
```

Em seguida podemos capturar a função `par?` para uma variável `par`:

```elixir
iex> par = &Math.par?/1
&Math.par/1
iex> par.(3)
false
iex> is_function(par)
true
```

Funções locais ou importadas podem ser capturadas sem o módulo:

```elixir
iex> resto = &rem/2
&:erlang.rem/2
iex> resto.(5,2)
1
```

Também é possível capturar operações:

```elixir
iex> concat = &++/2
&:erlang.++/2
iex> concat.([1, 2], [3, 4])
[1, 2, 3, 4]
```

O operador de captura também pode ser utilizado para encurtar a declaração de funções:

```elixir
iex> soma1 = &(&1 + 1)
#Function<44.40011524/1 in :erl_eval.expr/5>
iex> soma1.(3)
4
iex> bom = &"Bom #{&1}"
#Function<44.40011524/1 in :erl_eval.expr/5>
iex> bom.("dia")
"Bom dia"
iex> bom.("domingo")
"Bom domingo"
```

É possível passar um valor padrão aos argumentos de uma função. Para isso vamos criar o script `ExemploPadrao\padrao.exs` e inserir este código:

```elixir
defmodule Padrao do
  # O argumento sep recebe por padrão a string "/"
  def formata_data(dia, mes, ano, sep \\ "/"), do: dia <> sep <> mes <> sep <> ano
end

IO.puts Padrao.formata_data("3", "3", "2022") # 3/3/2022
IO.puts Padrao.formata_data("3", "3", "2022", "-")  # 3-3-2022
```

Quando uma função com argumentos que possuam valores padrões é declarada e ela possui múltiplas cláusulas, é necessário declarar uma função principal que tenha os argumentos com seus valores padrões e em seguida as declarações das funções em cada comportamento, por exemplo vamos criar o módulo `Concat` no arquivo de script `padrao.exs`:

```elixir
defmodule Concat do
  # Função principal com os valores padrões de cada argumento
  def join(a, b \\ nil, sep \\ " ")

  # Função para caso b seja nil
  # o "_" antes de sep indica que esse argumento é ignorado na função (Convenção de nomenclatura)
  def join(a, b, _sep) when is_nil(b), do: a

  # Função para caso b não seja nulo
  def join(a, b, sep), do: a <> sep <> b
end

IO.puts Concat.join("texto")  # texto
IO.puts Concat.join("texto", , "-") # texto
IO.puts Concat.join("texto", "concatenado") # texto concatenado
IO.puts Concat.join("texto", "concatenado", "-") # texto-concatenado
```

# Criando um projeto com Elixir

Para criar um projeto com Elixir será utilizada a ferramenta `mix` que funciona com a seguinte sintaxe:

```
> mix new {caminho\para\nome_projeto}
```

Criando o projeto com `mix new projeto_sist_distrib`:

Dentro da pasta recém criada `projeto_sist_distrib`, temos várias pastas e arquivos:

* lib
  * projeto_sist_distrib.ex
* test
  * projeto_sist_distrib_test.exs
  * test_helper.exs
* .formatter.exs
* .gitignore
* mix.exs
* README.md

O primeiro arquivo é o `mix.exs` que é responsável pelas configurações do projeto (similar ao package.json de uma aplicação node):

Dentro deste arquivo temos o seguinte código:

```elixir
defmodule ProjetoSistDistrib.MixProject do
  use Mix.Project

  def project do
    [
      app: :projeto_sist_distrib,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
```

O mix declara duas funções públicas `project` que retorna as configurações do projeto e `application` que é utilizado para gerar um arquivo de aplicação.

Existe também a função privada `deps` chamada pela função `project` que retorna todas as dependências utilizadas pelo projeto.

O arquivo `lib\projeto_sist_distrib.ex` é um módulo que contém apenas uma função `hello`. E é o bastante para testar a compilação do projeto. Para compilar basta entrar na pasta do projeto `cd projeto_sist_distrib` e executar o comando `mix compile`.

```
cd projeto_sist_distrib
mix compile

Compiling 1 file (.ex)
Generated projeto_sist_distrib app
```

Todos os arquivos gerados pela compilação são postos na pasta `_build` que deve ter sido criada na pasta do projeto.

Assim que o projeto é compilado podemos começar uma sessão iex dentro dele com o comando `iex -S mix`, assim que qualquer alteração é realizada no código a sessão iex pode ser reiniciada, ou pode ser utilizada a função `recompile()`.

Caso o `recompile()` ache algo para ser recompilado aparecerá uma mensagem:

``` elixir
Compiling 1 file (.ex)
:ok
```

Se não uma mensagem:

```elixir
:noop
```

O arquivo `.formatter.exs` também criado pelo `mix` é responsável por definir quais arquivos vão ser automaticamente formatados pelo comando `mix format`

O mix também oferece o conceito de `ambientes` onde existem as chamadas `variáveis de ambiente`, sendo os ambientes definidos como `:prod`, `:dev` e `:test`:

* `:prod` - Quando o projeto for executado em produção
* `:dev` - Quando o projeto é executado pelas tarefas Mix (`mix compile`) é utilizado como padrão;
* `:test` - Quando se está executando os testes;

# Agentes

Agentes são simples containers que envolvem o estado. Muito utilizados caso tudo que seja necessário seja manter o estado.

Brincando um pouco com agentes:

* Primeiro crie uma sessão `iex` dentro do projeto: `iex -S mix`
  
Agora insira a sequência de comandos a seguir:
```elixir
# Cria um agente com uma lista vazia
iex> {:ok, agent} = Agent.start_link fn -> [] end
{:ok, #PID<0.151.0>}

# Atualiza a lista do agente adicionando "eggs" no começo
iex> Agent.update(agent, fn list -> ["eggs" | list] end)

# Recupera a lista do agente
iex> Agent.get(agent, fn list -> list end)
["eggs"]

# Para o agente
iex> Agent.stop(agent)
:ok
```

É possível inserir um nome próprio para o agente:

```elixir
# Cria um agente com um mapa vazio e com nome :mapa
iex> {:ok, agent} = Agent.start_link fn -> %{} end, name: :mapa
{:ok, #PID<0.149.0>}
iex> Agent.update(:mapa, fn mapa -> Map.put(mapa, "chave", :valor) end)
:ok
iex> Agent.get(:mapa, fn mapa -> mapa end)
%{"chave" => :valor}
iex> Agent.stop(:mapa)
:ok
```

Mas como um estado dentro de um agente pode ser alterado de várias formas, o mais recomendado é encapsulálo dentro de um módulo.

Para isso vamos criar o módulo `lib\bucket.ex` dentro do projeto. Nesse arquivo vamos escrever este código:

```elixir
defmodule Bucket do
  use Agent

  @doc """
  Starts a new bucket.
  """
  def start_link(_opts) do
    Agent.start_link(fn -> %{} end)
  end

  @doc """
  Gets a value from the `bucket` by `key`.
  """
  def get(bucket, key) do
    Agent.get(bucket, &Map.get(&1, key))
  end

  @doc """
  Puts the `value` for the given `key` in the `bucket`.
  """
  def put(bucket, key, value) do
    Agent.update(bucket, &Map.put(&1, key, value))
  end
end
```

Em seguida vamos criar o módulo `BucketTest` no arquivo `test\projeto_sist_distrib.exs`, nesse módulo vamos ter o seguinte código:

```elixir
defmodule BucketTest do
  use ExUnit.Case, async: true
  doctest Bucket

  setup do
    {:ok, bucket} = Bucket.start_link([])
    %{bucket: bucket}
  end

  test "stores values by key", %{bucket: bucket} do
    assert Bucket.get(bucket, "milk") == nil # Verifica se a chave leite não está no bucket

    Bucket.put(bucket, "milk", 3)
    assert Bucket.get(bucket, "milk") == 3 # Verifica se a chave leite está no bucket com valor 3

    Bucket.put(bucket, "banana", 5)
    assert Bucket.get(bucket, "banana") == 5
  end
end
```

Todas as funções passadas para um agente são executadas dentro do processo do agente chamado de `servidor` já que recebe e responde às mensagens, tudo que acontece fora dele é o `cliente`.

## GenServer (_Generic Server_)

No tópico anterior foi criado um módulo `Bucket` que administrava e controlava as operações realizadas pelo agente. O ideal seria conseguir criar cada bucket de forma dinâmica:

```
CREATE shopping
OK

PUT shopping "milk" 3
OK

GET shopping "milk"
3
```

Mesmo que seja possível nomear cada agente com um nome próprio, nomear um processo dinâmico com nome atômico é altamente não recomendado. **Nunca se deve converter um input do usuário em valor atômico**, já que átomos não são destruidos automaticamente pelo sistema.

Ao invés de abusar da mecânica de nomear agentes com valores atômicos, é mais recomendável criar o próprio registro de processos que associa o nome agente com o devido processo.

Para isso criaremos um `GenServer` para controlar os agentes.

Mas antes vamos entender como funcionavam os processos dentro do modulo `Bucket`:

```elixir
@doc """
  Puts the `value` for the given `key` in the `bucket`.
  """
  def put(bucket, key, value) do
    Agent.update(bucket, &Map.put(&1, key, value))
  end
```

Num `GenServer` o código acima seria dividido em duas funções:

```elixir
def put(bucket, key, value) do
  # Manda uma "instrução" :put para o servidor
  GenServer.call(bucket, {:put, key, value})
end

# Retorno do servidor

def handle_call({:put, key, value}, _from, state) do
  # Retorna essa tupla
  {:reply, :ok, Map.put(state, key, value)}
end
```

Vamos criar um arquivo para lidar com os retornos do servidor para a lógica de registro de agentes dinâmicos, sem a própria API. Para isso criamos um outro arquivo `lib/registry.ex`, com o seguinte código:

```elixir
defmodule BucketRegistry do
  use GenServer

  ## Missing Client API - will add this later

  ## Defining GenServer Callbacks

  @impl true
  def init(:ok) do
    {:ok, %{}}
  end

  @impl true
  def handle_call({:lookup, name}, _from, names) do
    {:reply, Map.fetch(names, name), names}
  end

  @impl true
  def handle_cast({:create, name}, names) do
    if Map.has_key?(names, name) do
      {:noreply, names}
    else
      {:ok, bucket} = Bucket.start_link([])
      {:noreply, Map.put(names, name, bucket)}
    end
  end
end
```

Existem dois tipos de requisição que um `GenServer` precisa lidar, as do tipo `call` que são sincronas e precisam devolver uma resposta. E as do tipo `cast` que são assincronas e não precisam de uma devolver uma resposta.

Um exemplo de como invocar os tratamentos do `BucketRegistry`:

```elixir
iex> {:ok, registry} = GenServer.start_link(BucketRegistry, :ok)
{:ok, #PID<0.140.0>}
iex> GenServer.cast(registry, {:create, "shopping"})
:ok
iex> {:ok, bucket} =  GenServer.call(registry, {:lookup, "shopping"})
{:ok, #PID<0.150.0>}
``` 

No exemplo registramos um agente `shopping` e em seguida o recuperamos dos registros. O termo `@impl true` antes de cada `callback` serve para indicar ao compilador que a declaração subsequente é para criar um `callback` e caso ocorresse algum erro na declaração ele emitiria um aviso e daria sugestões de como declarar.

### A API do Cliente

Um `GenServer` tem duas partes, a API do Cliente e as Respostas do Servidor, as duas partes podem ser separadas em módulos diferentes ou implementadas no mesmo módulo. O cliente é qualquer processo que envolva as funções do cliente. O servidor é sempre o processo identificador ou processo nome que passa os argumentos para a API do cliente.

Para criar a API do cliente vamos criar um módulo a parte `lib/client.ex`, com o seguinte código:

```elixir
defmodule ClientAPI do
  ## Client API

  @doc """
  Starts the registry.
  """
  def start_link(opts) do
    # Cria um novo GenServer passando uma lista de opções
    # BucketRegistry - O módulo onde os retornos estão implementados
    # :ok            - O argumento de inicialização
    # opts           - Uma lista de opções que podem ser passadas ao criar o GenServer
    # especificando coisas como o nome do servidor etc.
    GenServer.start_link(BucketRegistry, :ok, opts)
  end

  @doc """
  Looks up the bucket pid for `name` stored in `server`.

  Returns `{:ok, pid}` if the bucket exists, `:error` otherwise.
  """
  #Responsável por enviar a requisição solicitando um processo pelo nome
  def lookup(server, name) do
    GenServer.call(server, {:lookup, name})
  end

  @doc """
  Ensures there is a bucket associated with the given `name` in `server`.
  """
  #Responsável por enviar uma requisição solicitando a criação de um processo e passando o nome dele
  def create(server, name) do
    GenServer.cast(server, {:create, name})
  end
end
```

Pronto, agora nosso sistema está criando agentes de forma dinâmica com nomes passados pelo próprio cliente.

Para isso basta compilar e criar uma sessão do iex dentro do projeto:

```
> cd caminho\para\projeto_sist_distrib # Caso não esteja dentro do projeto
> mix compile
> iex -S mix
> iex.bat -S mix # caso no powershell
``` 

Em seguida iniciamos o servidor:

```elixir
iex> {:ok, servidor} = ClientAPI.start_link([])
```

Depois de criar o servidor podemos começar a criar nossos processos e alterá-los.

```elixir
# Criando um processo chamado "compras"
iex> ClientAPI.create(servidor, "compras")
:ok

# Recupera o processo pelo nome
iex> {:ok, compras} = ClientAPI.lookup(servidor, "compras")

# Agora temos o processo e podemos alterá-lo
iex> Bucket.put(compras, "leite", 5)
:ok

iex> Bucket.get(compras, "leite")
5

# Mas não precisamos nos restringir a um processo
iex> ClientAPI.create(servidor, "shopping")
:ok

iex> {:ok, shopping} = ClientAPI.lookup(servidor, "shopping")
{:ok, #PID<0.150.0>}

iex> Bucket.put(shopping, "roupa", 1)
:ok

iex> Bucket.get(shopping, "roupa")
1
```

E assim toda uma comunicação cliente-servidor foi estabelecida, funcionando em qualquer ambiente no qual esteja executando com o Elixir.

Existe muito mais a ser feito, mas o que foi passado até agora é o suficiente para mostrar as possibilidades do Elixir na área de Sistemas Distribuídos.