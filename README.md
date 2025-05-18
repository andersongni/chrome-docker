# chrome-docker

Este projeto Docker cria um ambiente Ubuntu com Google Chrome acessível via VNC. Ideal para navegação isolada, testes ou uso de browser em ambiente controlado.

## Funcionalidades
- Ubuntu 20.04 como base
- Instalação do Google Chrome
- Ambiente gráfico virtual com Xvfb
- Acesso remoto via VNC (porta 5900)
- Inicialização automática do Chrome

## Como usar

### 1. Build da imagem
Abra o terminal na pasta do projeto e execute:

```powershell
docker build -t chrome-browser .
```

### 2. Execute o container

```powershell
docker run -p 5900:5900 -it chrome-browser
```

### 3. Conecte-se via VNC
Use um cliente VNC e conecte-se a `localhost:5900`.

- Não há senha configurada por padrão.
- O Google Chrome será iniciado automaticamente.

### 4. Parar e remover o container

```powershell
docker stop chrome-browser
```
```powershell
docker rm chrome-browser
```

## Observações
- Certifique-se de ter o Docker instalado.
- Para acessar o Chrome, use um cliente VNC de sua preferência.
- Modifique o Dockerfile conforme necessário para adicionar extensões ou configurações extras.

---

**Testado com:**
- TigerVNC Viewer versão 1.15.0 ([download](https://sourceforge.net/projects/tigervnc/))

**Autor:** Seu Nome
