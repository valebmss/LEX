# Proyecto LEX

Este proyecto de LEX está organizado en cinco carpetas numeradas del 1 al 5. Cada carpeta contiene archivos para la implementación de distintos analizadores léxicos. Este archivo `README.md` proporciona instrucciones paso a paso para descargar, ejecutar, modificar y compilar el proyecto.

## Estructura del Proyecto

Cada carpeta en el proyecto contiene los siguientes archivos:

- `fb1-1.l`: Archivo fuente de LEX.
- `lex.yy.c`: Archivo de código C generado por LEX.
- `lexer`: Ejecutable generado.

## Instrucciones

### 1. Descargar el Proyecto

1. **Clonar el Repositorio:**

   Primero, clona el repositorio a tu máquina local usando Git:

   ```bash
   git clone ttps://github.com/valebmss/LEX.git
   cd LEX
2. **Descargar el Proyecto como un Archivo ZIP:**

Si prefieres no usar Git, puedes descargar el proyecto como un archivo ZIP desde la página del repositorio en GitHub. Descomprime el archivo ZIP en tu máquina local.
### 2. Navega a una carpeta
```bash
   cd 1

```


### 3. Ejecutar LEX

1. **Generar el Código C:**

   Utiliza el comando `lex` para procesar el archivo `fb1-1.l` y generar el archivo `lex.yy.c`:

   ```bash
   lex fb1-1.l

1. **Compilar el Código C:**

Compila el archivo `lex.yy.c` usando gcc para crear el ejecutable lexer:

   ```bash
   gcc -o lexer lex.yy.c -lfl
 ```
### 4. Ejecutar el Analizador Léxico

Una vez compilado, puedes ejecutar el analizador léxico:

```bash
./lexer
```

### 5. Modificar el Código

Para modificar el código fuente:

1. **Edita el Archivo `fb1-1.l`:**

   Utiliza tu editor de texto favorito para hacer cambios en el archivo `fb1-1.l`.

2. **Regenera el Código C y Recompila:**

   Después de realizar cambios, repite los pasos para generar el código C y compilar:

   ```bash
   lex fb1-1.l
   gcc -o lexer lex.yy.c -lfl
   ```
     3. **Ejecuta el Analizador Léxico Modificado:**
Vuelve a ejecutar el analizador para probar los cambios:


   ```bash
   ./lexer
  

### 6. Problemas Comunes

- **`lex` No Encontrado:** Asegúrate de que `lex` y `gcc` están instalados en tu sistema. Puedes instalar `flex` y `gcc` usando tu gestor de paquetes. En sistemas basados en Debian/Ubuntu, puedes usar:

  ```bash
  sudo apt-get install flex gcc

