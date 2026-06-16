<div align="center">

# 🍏 FoodMetrics

[cite_start]*Desarrollo de una aplicación móvil multiplataforma para la gestión inteligente del diario nutricional*[cite: 13].

[![Desarrollo](https://img.shields.io/badge/Desarrollo-FlutterFlow%20%7C%20Dart-blue.svg)](#)
[![Backend](https://img.shields.io/badge/Backend-Supabase%20%7C%20PostgreSQL-3ECF8E.svg)](#)
[![API](https://img.shields.io/badge/API-OpenFoodFacts-orange.svg)](#)
[![Plataforma](https://img.shields.io/badge/Plataforma-iOS_Optimized-lightgrey.svg)](#)

</div>

---

## 📖 Sobre el Proyecto

[cite_start]El control de la ingesta diaria suele ser un proceso complejo y tedioso, lo que lleva a muchos usuarios a abandonar el hábito al tener que leer etiquetas y calcular macronutrientes manualmente[cite: 71]. [cite_start]**FoodMetrics** es una herramienta móvil orientada a simplificar el registro de alimentos mediante el uso de un escáner integrado y su conexión a bases de datos nutricionales[cite: 68, 69].

[cite_start]Este proyecto nace como Proyecto Intermodular para el Ciclo Formativo de Grado Superior en Desarrollo de Aplicaciones Multiplataforma (DAM)[cite: 14].

---

## ✨ Características Principales (MVP)

* [cite_start]📸 **Escáner Inteligente (1D):** Integración de la cámara del dispositivo para leer códigos EAN-13 y mapear productos en menos de 8 segundos[cite: 77, 157, 181].
* [cite_start]📊 **Dashboard Nutricional en Tiempo Real:** Cálculo automático de calorías y macronutrientes totales consumidos en el día con gráficos circulares de progreso[cite: 159, 173].
* [cite_start]🎯 **Onboarding Personalizado:** Configuración inicial para establecer metas de pérdida de peso, mantenimiento o ganancia muscular[cite: 132, 929].
* [cite_start]🔍 **Catálogo de Alimentos:** Conexión asíncrona a la API externa de *OpenFoodFacts* y opción de creación manual de productos y recetas locales[cite: 263, 264, 335].
* [cite_start]🔒 **Privacidad Total:** Gestión de concurrencia y seguridad de datos a nivel de fila (RLS) en PostgreSQL, garantizando que cada usuario solo accede a su propia información[cite: 174, 814].

---

## 🛠️ Stack Tecnológico

| Capa | Tecnología | Descripción |
| :--- | :--- | :--- |
| **Frontend** | **FlutterFlow / Dart** | [cite_start]Plataforma visual basada en Flutter para compilar código nativo, gestionando la interfaz de usuario y el estado local (App State)[cite: 226, 256, 258, 291]. |
| **Backend & Base de Datos** | **Supabase / PostgreSQL** | [cite_start]Arquitectura BaaS (Backend as a Service) que proporciona una base de datos relacional robusta y sistema de autenticación seguro mediante JWT[cite: 233, 260, 261, 793, 1092]. |
| **Integración (APIs)** | **OpenFoodFacts REST API** | [cite_start]Base de datos abierta utilizada para la ingesta de datos nutricionales a partir del código de barras[cite: 238, 243, 264]. |
| **Gestión y Control** | **GitHub / Trello** | [cite_start]Repositorio central para control de versiones y tablero Kanban para la organización de hitos ágiles[cite: 277, 278, 279]. |

---

## 🏛️ Arquitectura del Sistema

[cite_start]FoodMetrics emplea una arquitectura **Cliente-Servidor (BaaS)** estructurada en capas claramente diferenciadas[cite: 207, 789]:

> [cite_start]1. **Capa de Presentación:** Aplicación nativa iOS procesando UI/UX de forma asíncrona[cite: 791, 811].
> [cite_start]2. **Capa de Servicios:** Supabase Auth y lógica de acceso (Row Level Security)[cite: 234, 235, 236].
> [cite_start]3. **Capa de Integración:** Peticiones HTTP REST externas a la API de OpenFoodFacts para la consulta de productos[cite: 244, 250, 794].
> [cite_start]4. **Capa de Datos:** Clúster centralizado de PostgreSQL para almacenamiento de historiales y perfiles[cite: 247, 356].

---

## 📱 Capturas de Pantalla

*(Añade aquí las imágenes de tu carpeta `/assets` del repositorio)*

| Autenticación & Perfil | Dashboard & Progreso | Escáner & Diario |
| :---: | :---: | :---: |
| <img src="ruta/a/tu/imagen_login.png" width="200" alt="Pantalla Login"> | <img src="ruta/a/tu/imagen_dashboard.png" width="200" alt="Pantalla Dashboard"> | <img src="ruta/a/tu/imagen_diario.png" width="200" alt="Pantalla Diario"> |

---

## 🚀 Instalación y Despliegue

### Requisitos Previos

* [cite_start]**Dispositivo:** Apple iPhone 8 o superior (Arquitectura ARM64 / Chip A11+)[cite: 178, 179].
* [cite_start]**Sistema Operativo:** iOS 14.0 o superior[cite: 183].
* [cite_start]**Conectividad:** Conexión a Internet activa (Wi-Fi/4G/5G) indispensable para autenticación (Supabase) y consultas externas[cite: 198, 199].

### Configuración del Entorno Local

1. Clona este repositorio:
   ```bash
   git clone [https://github.com/tu-usuario/foodmetrics.git](https://github.com/tu-usuario/foodmetrics.git)
