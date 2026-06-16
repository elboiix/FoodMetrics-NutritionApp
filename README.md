# 🍏 FoodMetrics

**FoodMetrics** es una aplicación móvil multiplataforma orientada a simplificar el registro de alimentos y la gestión inteligente del diario nutricional[cite: 1]. 

Desarrollada para solucionar el problema del registro manual tedioso, la aplicación integra un escáner que permite identificar productos rápidamente y calcular automáticamente su aporte calórico y de macronutrientes[cite: 1].

## ✨ Funcionalidades Principales

*   **📷 Escáner de Códigos de Barras (1D):** Identificación automática de productos utilizando la cámara del dispositivo y conectándose al catálogo público de OpenFoodFacts[cite: 1].
*   **📊 Dashboard en Tiempo Real:** Visualización del progreso diario mediante anillos gráficos para carbohidratos, proteínas y grasas, así como el balance de calorías consumidas frente a las restantes[cite: 1].
*   **📖 Diario de Comidas Interactivo:** Gestión de la ingesta distribuida por comidas (desayuno, almuerzo, cena) con opciones de búsqueda o introducción manual de nuevos alimentos[cite: 1].
*   **🎯 Metas Biométricas Personalizadas:** Configuración de objetivos nutricionales adaptados al usuario (perder peso, mantener o ganar músculo) y cálculo automático del metabolismo basal[cite: 1].
*   **🔒 Privacidad y Seguridad:** Autenticación de usuarios mediante Tokens JWT y aislamiento total de los datos de cada perfil[cite: 1].

## 🛠️ Tecnologías y Arquitectura

El proyecto está construido bajo una arquitectura cliente-servidor (BaaS) modular[cite: 1]:

*   **Frontend / UI:** Construido con **FlutterFlow** y **Dart**, generando un paquete compilado de alto rendimiento nativo (.ipa) optimizado para entornos iOS[cite: 1].
*   **Backend y Base de Datos:** **Supabase** funcionando como motor de base de datos relacional (**PostgreSQL**)[cite: 1].
*   **Seguridad:** Uso de **Supabase Auth** y políticas estrictas de **Row Level Security (RLS)** para garantizar la estanqueidad y privacidad de la información por usuario[cite: 1].
*   **APIs Externas:** Consumo asíncrono vía REST API de **OpenFoodFacts**, parametrizando las peticiones para optimizar el rendimiento y reducir el consumo de datos[cite: 1].
*   **Gestión del Proyecto:** Metodología ágil (Kanban) con **Trello** y control de versiones en **GitHub**[cite: 1].

## 🗄️ Estructura de Datos (Supabase)

La base de datos relacional está normalizada y se divide en entidades clave para asegurar la integridad referencial[cite: 1]:
*   `Profiles`: Credenciales, datos biométricos y objetivos del usuario[cite: 1].
*   `Daily_logs`: Agrupación de la ingesta de un usuario por día[cite: 1].
*   `Meal_entries`: Tabla transaccional central que relaciona diarios con alimentos consumidos[cite: 1].
*   `Products`: Catálogo maestro de alimentos y macronutrientes[cite: 1].

## 🚀 Estado del Proyecto

Actualmente, el proyecto se encuentra en la fase de Producto Mínimo Viable (MVP) completamente funcional, testeado en dispositivos físicos de Apple y superando con éxito las pruebas de estabilidad de hardware (autoenfoque de cámara) y concurrencia[cite: 1]. 

*Líneas futuras:* Refactorización del diseño responsive para su empaquetado y distribución en dispositivos Android (.AAB), e integración con plataformas como Apple Health o Google Fit[cite: 1].

---
**Autor:** Adrián Boix del Castillo | Desarrollador de Aplicaciones Multiplataforma (DAM)[cite: 1]
