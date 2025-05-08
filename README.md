# Sistema de Gestión para Soluciones Eficientes S.A.S.

## Descripción General

Este proyecto es una aplicación de consola desarrollada en Java para **Soluciones Eficientes S.A.S.**, una empresa colombiana especializada en ofrecer servicios de outsourcing. El objetivo principal de la aplicación es permitir a la empresa organizar y operar eficientemente sus diversas actividades de outsourcing, tales como tecnología, administración, limpieza, atención al cliente y seguridad.

La aplicación facilita la gestión de clientes, servicios, contratos, empleados y proyectos, optimizando las operaciones internas y permitiendo a Soluciones Eficientes S.A.S. enfocarse en su actividad principal.

## Sobre Soluciones Eficientes S.A.S.

**Soluciones Eficientes S.A.S.** es una empresa colombiana dedicada a ofrecer servicios de outsourcing personalizados para optimizar las operaciones de sus clientes. Su propósito principal es permitir que las empresas se concentren en su actividad principal mientras delegan áreas críticas.

### Servicios Ofrecidos por la Empresa:
*   **Tecnología de la Información (TI):** Desarrollo de software, soporte técnico, administración de redes.
*   **Limpieza y Mantenimiento:** Servicios integrales para empresas e industrias.
*   **Seguridad:** Vigilancia física y electrónica.
*   **Administración y Recursos Humanos:** Gestión de personal, nómina y contratación.
*   **Atención al Cliente:** Call centers, gestión de quejas y reclamos.

## Características Principales de la Aplicación

La aplicación en Java implementa las siguientes funcionalidades:

1.  **Gestión de Clientes:**
    *   Registrar nuevos clientes.
    *   Listar todos los clientes con su sector y contratos activos.

2.  **Gestión de Servicios:**
    *   Registrar nuevos servicios.
    *   Consultar servicios por categoría (TI, Limpieza, Seguridad, Administración).

3.  **Gestión de Contratos:**
    *   Registrar nuevos contratos vinculados a clientes y servicios.
    *   Consultar contratos activos para un cliente específico.
    *   Finalizar contratos.

4.  **Gestión de Proyectos:**
    *   Crear nuevos proyectos para clientes.
    *   Asignar empleados a proyectos.
    *   Consultar proyectos activos y su estado (En curso, Completado, Cancelado).

5.  **Gestión de Empleados:**
    *   Registrar nuevos empleados con su especialidad (TI, Administración, Limpieza, Seguridad).
    *   Consultar empleados asignados a un proyecto.
    *   Registrar horas trabajadas por empleado en un proyecto.

6.  **Reportes:**
    *   Ver ingresos totales generados por los contratos activos.
    *   Listar los servicios más contratados.
    *   Listar los empleados con más horas trabajadas.

7.  **Manejo de Archivos de Texto:**
    *   Guardar resúmenes de contratos finalizados en archivos de texto.
    *   Consultar estos resúmenes desde el archivo.

## Modelo de Datos (Base de Datos MySQL)

La aplicación utiliza una base de datos MySQL para persistir la información. Las tablas principales son:

*   **Cliente:** Información de los clientes de Soluciones Eficientes S.A.S.
    *   *Campos clave:* ID, Nombre, Representante, Correo, Teléfono, Dirección, Sector (Enum: Tecnología, Salud, Educación, Comercio, Manufactura).
*   **Servicio:** Catálogo de servicios ofrecidos.
    *   *Campos clave:* ID, Nombre, Descripción, PrecioPorHora, Categoría (Enum: TI, Limpieza, Seguridad, Administración).
*   **Contrato:** Registros de los acuerdos con los clientes.
    *   *Campos clave:* ID, ID_Cliente, ID_Servicio, FechaInicio, FechaFin, CostoTotal, Estado (Enum: Activo, En espera, Finalizado).
*   **Empleado:** Información del personal de Soluciones Eficientes S.A.S.
    *   *Campos clave:* ID, Nombre, Cargo, Salario, Especialidad (Enum: TI, Administración, Limpieza, Seguridad), ID_Proyecto (para asignación principal o actual).
*   **Proyecto:** Gestión de los proyectos activos para los clientes.
    *   *Campos clave:* ID, ID_Cliente, Nombre, FechaInicio, FechaFin, Estado (Enum: En curso, Completado, Cancelado).
*   **Asignación:** Tabla para la relación muchos-a-muchos entre Empleados y Proyectos.
    *   *Campos clave:* ID_Empleado, ID_Proyecto, HorasTrabajadas, FechaAsignación.

## Diseño del Software

El diseño de la aplicación se basa en los siguientes componentes principales (clases Java):

*   **Cliente:** Gestiona la información y operaciones relacionadas con los clientes.
    *   *Métodos destacados:* `consultarContratos()`, `listarProyectosActivos()`.
*   **Servicio:** Representa los servicios ofrecidos.
    *   *Métodos destacados:* `calcularCostoTotal(horas)`.
*   **Contrato:** Maneja la lógica de los contratos.
    *   *Métodos destacados:* `verEstadoContrato()`, `calcularCosto()`.
*   **Empleado:** Representa a los empleados y sus asignaciones.
    *   *Métodos destacados:* `asignarProyecto()`, `registrarHorasTrabajadas()`.
*   **Proyecto:** Gestiona los proyectos y los empleados asignados.
    *   *Métodos destacados:* `listarEmpleados()`, `calcularDuración()`.

Se siguen principios y patrones de diseño para asegurar un código mantenible y escalable.

## Tecnologías Utilizadas

*   **Lenguaje de Programación:** Java
*   **Base de Datos:** MySQL
*   **Conectividad DB:** JDBC (Java Database Connectivity)
*   **Características Java:** Expresiones Lambda, Stream API
*   **Interfaz de Usuario:** Consola (CLI)
*   **Manejo de Archivos:** Operaciones con archivos de texto.

## Prerrequisitos

*   JDK (Java Development Kit) 8 o superior.
*   Servidor MySQL instalado y en ejecución.
*   (Opcional) Un IDE de Java como IntelliJ IDEA, Eclipse, o VS Code con extensiones de Java.

## Instalación y Ejecución

1.  **Clonar el Repositorio:**
    ```bash
    git clone <URL_DEL_REPOSITORIO>
    cd <NOMBRE_DEL_DIRECTORIO_DEL_PROYECTO>
    ```
2.  **Configurar la Base de Datos:**
    *   Cree una base de datos en MySQL (ej. `soluciones_eficientes_db`).
    *   Ejecute el script SQL (si se proporciona) para crear las tablas o créelas manualmente según el diseño.
    *   Configure los detalles de conexión JDBC en el archivo de configuración correspondiente de la aplicación (ej. `db.properties` o directamente en el código si es necesario): URL de la base de datos, usuario y contraseña.
3.  **Compilar el Proyecto:**
    *   Si usa un IDE, importe el proyecto y compílelo.
    *   Si usa Maven o Gradle (no especificado, pero común), use los comandos respectivos (ej. `mvn compile`).
    *   Para compilación manual: `javac -d out src/com/example/Main.java` (ajuste las rutas).
4.  **Ejecutar la Aplicación:**
    *   Desde el IDE, ejecute la clase principal.
    *   Desde la consola (después de compilar): `java -cp out com.example.Main` (ajuste las rutas y el nombre de la clase principal).

    Aparecerá un menú principal en la consola para interactuar con las diferentes funcionalidades.
***
