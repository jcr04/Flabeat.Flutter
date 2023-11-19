# Documentação Técnica do Flabeat

## Visão Geral

O Flabeat é um aplicativo Flutter desenvolvido para monitorar batimentos cardíacos em tempo real, conectando-se a dispositivos Bluetooth como pulseiras inteligentes. Este documento detalha a arquitetura técnica, funcionalidades e desafios enfrentados durante o desenvolvimento.

## Estrutura do Projeto

### Diretórios e Arquivos Principais

- `/lib`
  - `/models`: Contém modelos de dados como `DataModel` para representar informações estruturadas e `User` para gerenciamento de informações do usuário.
  - `/screens`: Inclui as telas principais do aplicativo, como `HomeScreen` para a tela inicial e `DeviceScreen` para a gestão de dispositivos Bluetooth.
  - `/services`: Armazena serviços como `BluetoothService`, que encapsula toda a lógica para interação Bluetooth, incluindo a descoberta e conexão com dispositivos.
  - `/utils`: Define utilitários e constantes globais, como `AppColors` para gerenciamento de cores e `Utilities` para funções auxiliares comuns.
  - `/widgets`: Widgets personalizados, incluindo `CustomButton` para botões reutilizáveis e `InfoCard` para exibição de informações em cartões.

- `/assets`: Armazena recursos gráficos e arquivos de mídia utilizados no aplicativo.

### Arquitetura

O aplicativo segue o padrão Modelo-Visão-Controlador (MVC), separando a lógica de negócios (Model) da interface do usuário (View) e da lógica de controle (Controller). Esta abordagem facilita a manutenção e a escalabilidade do código.

### Serviços Bluetooth

Utiliza a biblioteca `flutter_blue` para gerenciar a comunicação Bluetooth. Esta biblioteca oferece uma API simplificada para descobrir, conectar e interagir com dispositivos Bluetooth.

## Funcionalidades Principais

### Conexão Bluetooth

`BluetoothService` gerencia a lógica para escanear e conectar-se a dispositivos Bluetooth, usando padrões assíncronos como `async/await` para operações não-bloqueantes.

### Interface do Usuário

- **HomeScreen**: Mostra informações de batimentos cardíacos em tempo real e oferece navegação para outras telas.
- **DeviceScreen**: Permite aos usuários escanear e conectar-se a dispositivos Bluetooth disponíveis, exibindo uma lista de dispositivos detectados.

## Gerenciamento de Estado

Uso extensivo de `StatefulWidget` para gerenciar estados mutáveis, especialmente em interfaces que exibem dados dinâmicos, como as leituras de batimentos cardíacos.

## Testes

Inclui testes unitários para validar lógica de negócios e funções individuais, além de testes de widgets para garantir que os componentes da UI se comportem conforme esperado.

## Desafios e Soluções

### Conexão Bluetooth

- **Desafio**: Manter uma conexão Bluetooth estável e gerenciar diferentes estados de dispositivos.
- **Solução**: Implementação de um robusto sistema de tratamento de erros e verificações de estado para gerenciar conexões Bluetooth de forma eficiente.

## Conclusão

Esta documentação técnica oferece uma visão detalhada do desenvolvimento do Flabeat, cobrindo desde a estrutura do projeto até as soluções de desafios específicos. Para detalhes adicionais e compreensão mais profunda, recomendamos consultar os comentários no código e a documentação de cada componente e biblioteca utilizada.
