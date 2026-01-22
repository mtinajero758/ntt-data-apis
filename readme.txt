===============================================================
# Automatización de API PetStore con Karate Framework - NTT DATA
===============================================================
Desarrollado por: MATC

Este proyecto contiene la automatización de pruebas para la API de **PetStore** (Swagger), cubriendo el ciclo de vida completo de una mascota: creación, consulta, actualización y filtrado por estado.
------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------
## 1. Prerrequisitos
------------------------------------------------------------------------------------------------------------------
* Java JDK: 17
* Framework Karate v1.4.1.
* Motor de Pruebas: JUnit 4.13.2
* Herramienta de Construcción: Maven Versión 3.8.x o superior (Configurado en variables de entorno).
* IDE Sugerido: IntelliJ IDEA 2025.3 con el plugin de Karate instalado.
------------------------------------------------------------------------------------------------------------------
2. Comandos de instalación
------------------------------------------------------------------------------------------------------------------
* Asegurarse de tener configurada la variable de entorno JAVA_HOME apuntando al JDK 17.
* Tener Maven instalado y configurado en el PATH del sistema.
* Ejecute los siguientes comandos en la terminal desde la raíz del proyecto para descargar las dependencias:
* git clone <URL_DEL_REPOSITORIO>
* cd apis
* mvn clean install -DskipTests
------------------------------------------------------------------------------------------------------------------
3. Instrucciones para ejecutar los test
------------------------------------------------------------------------------------------------------------------
Opción A: Desde IntelliJ IDEA
    1. Localice la clase PetStoreRunner.java en la ruta src/test/java/petstore/.

    2. Haga clic derecho y seleccione "Run 'PetStoreRunner'".

Opción B: Desde la Terminal (Consola de comandos o Terminal de IntelliJ)
    1. Abra una terminal en la carpeta raíz del proyecto.

    2. Ejecute el comando:
        mvn test -Dtest=PetStoreRunner
------------------------------------------------------------------------------------------------------------------
4. Información adicional
------------------------------------------------------------------------------------------------------------------
Visualización de Reportes: Karate genera reportes nativos en formato HTML. Al finalizar la ejecución, abra el siguiente archivo en su navegador: target/karate-reports/karate-summary.html

Configuración: La URL base y los timeouts están centralizados en el archivo karate-config.js.

Escenarios: Se validó el flujo completo asegurando que el ID generado en el POST sea el mismo consultado en el GET, garantizando la integridad de los datos.

Aserciones: Se utilizan validaciones de tipo match para asegurar que los cambios de estatus a 'sold' sean procesados correctamente por la API.
------------------------------------------------------------------------------------------------------------------
Referencia: https://docs.github.com/es/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-readmes
Recordar que un readme correcto debe tener la extensión .md y debe estar dentro del proyecto.
