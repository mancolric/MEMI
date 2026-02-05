## Matemáticas de la Especialidad Matemática Industrial. Curso 2025-2026

Apuntes, códigos y otro material para el curso.

### Autor y contacto

Manuel Colera Rico (Universidad Politécnica de Madrid)

El material se ha desarrollado con la intención de facilitar el estudio de la asignatura. Por favor, si encuentras cualquier errata, necesitas clarificación sobre alguno de los contenidos, o tienes cualquier sugerencia, no dudes en escribir a m.colera@upm.es.

### Instalación

**1. Instalar [MATLAB](https://es.mathworks.com/products/matlab.html)**. Después de la instalación, debe aparecer una carpeta llamada `MATLAB` dentro de la carpeta `Mis documentos` o `~/Documentos/` (la carpeta puede variar según el sistema operativo y/o el idioma).

**2 (opción 1 - inicialmente más sencilla). Descargar el material del curso de forma manual**. Descargar una carpeta comprimida a través de la pestaña `Code->Download ZIP`, y luego extraer el contenido dentro de la carpeta `MATLAB`.

**2 (opción 2 - recomendada, más cómoda cuando avance el curso). Descargar el material del curso desde la terminal**. Abrir la terminal, por ejemplo, desde el menú de inicio. A continuación, cambiar el directorio a la carpeta `MATLAB` y clonar el repositorio; es decir, ejecutar
```
cd C:\Users\<TuUsuario>\Documents\MATLAB\  
git clone https://github.com/mancolric/MEMI.git
```
para Windows, o 
```
cd /home/<TuUsuario>/Documentos/MATLAB/
git clone https://github.com/mancolric/MEMI.git
```
para Linux y MacOS, donde `<TuUsuario>` debe ser reemplazado por tu nombre de usuario. 

En el caso de usar Windows, es posible que `git` no esté instalado. En ese caso, hay que descargarlo e instalarlo desde [https://git-scm.com/install/windows](https://git-scm.com/install/windows), seleccionando la opción "Usar Git desde la ventana de comandos".  

Después del paso 2, debe haber una carpeta `MEMI` dentro de la carpeta `MATLAB`, que a su vez está ubicada en `Mis documentos` o `~/Documentos/`.

**3. Actualizar el directorio de MATLAB**. Abrir `MATLAB->Home->Preferences->SetPath`, y añadir la carpeta `MEMI` y sus subcarpetas al directorio de MATLAB. De esta forma, MATLAB podrá encontrar los archivos que hay dentro de `MEMI`.

### Recomendaciones importantes

La carpeta `MEMI` contiene los archivos oficiales del curso, y se irá actualizando progresivamente, según se avance durante el curso.

Si quieres practicar con los ejercicios propuestos y compararlos con la solución, es conveniente guardar los archivos en una carpeta diferente, por ejemplo, `MEMI_Estudiante`. Esta carpeta puede guardarse dentro de la carpeta `MATLAB`, y debe añadirse también al directorio de MATLAB de forma similar al paso 3 de la instalación.

Al mismo tiempo, si el enunciado de un ejercicio dice, por ejemplo, "implementar una función llamada `LUSolve`", se recomienda llamar a la función de una forma diferente, por ejemplo, `LUSolve_Estudiante`, para evitar que MATLAB la confunda con la función oficial que implementa la solución al ejercicio. 

Evitar espacios y caracteres especiales en los nombres de las carpetas y archivos.

### Actualizaciones 

Será necesario actualizar el material durante el curso. Para ello, hay que ejecutar nuevamente el paso 2 (opción 1) anterior, sobreescribiendo los archivos ya existentes con sus nuevas versiones.

Alternativamente, desde la terminal, simplemente hay que cambiar el directorio a la carpeta `MEMI` y ejecutar `git pull`, que automáticamente se conecta al repositorio y descarga los nuevos archivos. Es decir,
```
cd C:\Users\<TuUsuario>\Documents\MATLAB\MEMI\
git pull
```
para Windows, o 
```
cd /home/<TuUsuario>/Documentos/MATLAB/MEMI/
git pull
```
para Linux y MacOS. Se recomienda esta segunda opción.

También es posible descargar los archivos de forma individual haciendo click en el icono situado a la derecha de `Raw`.

### Citar como 

M. Colera, 2026: Apuntes de Matemáticas de la Especialidad Matemática Industrial ([https://github.com/mancolric/MEMI](https://github.com/mancolric/MEMI)).


