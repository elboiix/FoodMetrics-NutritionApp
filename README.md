<div align="center">

# 🍏 FoodMetrics

*Desarrollo de una aplicación móvil multiplataforma para la gestión inteligente del diario nutricional*.

[![Desarrollo](https://img.shields.io/badge/Desarrollo-FlutterFlow%20%7C%20Dart-blue.svg)](#)
[![Backend](https://img.shields.io/badge/Backend-Supabase%20%7C%20PostgreSQL-3ECF8E.svg)](#)
[![API](https://img.shields.io/badge/API-OpenFoodFacts-orange.svg)](#)
[![Plataforma](https://img.shields.io/badge/Plataforma-iOS_Optimized-lightgrey.svg)](#)

</div>

---

## 📖 Sobre el Proyecto

El control de la ingesta diaria suele ser un proceso complejo y tedioso, lo que lleva a muchos usuarios a abandonar el hábito al tener que leer etiquetas y calcular macronutrientes manualmente. **FoodMetrics** es una herramienta móvil orientada a simplificar el registro de alimentos mediante el uso de un escáner integrado y su conexión a bases de datos nutricionales.

Este proyecto nace como Proyecto Intermodular para el Ciclo Formativo de Grado Superior en Desarrollo de Aplicaciones Multiplataforma (DAM).

---

## ✨ Características Principales (MVP)

* 📸 **Escáner Inteligente (1D):** Integración de la cámara del dispositivo para leer códigos EAN-13 y mapear productos en menos de 8 segundos.
* 📊 **Dashboard Nutricional en Tiempo Real:** Cálculo automático de calorías y macronutrientes totales consumidos en el día con gráficos circulares de progreso.
* 🎯 **Onboarding Personalizado:** Configuración inicial para establecer metas de pérdida de peso, mantenimiento o ganancia muscular.
* 🔍 **Catálogo de Alimentos:** Conexión asíncrona a la API externa de *OpenFoodFacts* y opción de creación manual de productos y recetas locales.
* 🔒 **Privacidad Total:** Gestión de concurrencia y seguridad de datos a nivel de fila (RLS) en PostgreSQL, garantizando que cada usuario solo accede a su propia información.

---

## 🛠️ Stack Tecnológico

| Capa | Tecnología | Descripción |
| :--- | :--- | :--- |
| **Frontend** | **FlutterFlow / Dart** | Plataforma visual basada en Flutter para compilar código nativo, gestionando la interfaz de usuario y el estado local (App State). |
| **Backend & Base de Datos** | **Supabase / PostgreSQL** | Arquitectura BaaS (Backend as a Service) que proporciona una base de datos relacional robusta y sistema de autenticación seguro mediante JWT. |
| **Integración (APIs)** | **OpenFoodFacts REST API** | Base de datos abierta utilizada para la ingesta de datos nutricionales a partir del código de barras. |
| **Gestión y Control** | **GitHub / Trello** | Repositorio central para control de versiones y tablero Kanban para la organización de hitos ágiles. |

---

## 🏛️ Arquitectura del Sistema

FoodMetrics emplea una arquitectura **Cliente-Servidor (BaaS)** estructurada en capas claramente diferenciadas:

> 1. **Capa de Presentación:** Aplicación nativa iOS procesando UI/UX de forma asíncrona.
> 2. **Capa de Servicios:** Supabase Auth y lógica de acceso (Row Level Security).
> 3. **Capa de Integración:** Peticiones HTTP REST externas a la API de OpenFoodFacts para la consulta de productos.
> 4. **Capa de Datos:** Clúster centralizado de PostgreSQL para almacenamiento de historiales y perfiles.

---

## 📱 Capturas de Pantalla

*(Añade aquí las imágenes de tu carpeta `/assets` del repositorio)*

| Autenticación | Dashboard & Progreso | Escáner & Diario |
| :---: | :---: | :---: |
| <img src="https://i.imgur.com/O5Dktn0.png" width="200" alt="Pantalla Login"> | <img src="ruta/a/tu/imagen_dashboard.png" width="200" alt="Pantalla Dashboard"> | <img src="ruta/a/tu/imagen_diario.png" width="200" alt="Pantalla Diario"> |

---

## 🚀 Instalación y Despliegue

### Requisitos Previos

* **Dispositivo:** Apple iPhone 8 o superior (Arquitectura ARM64 / Chip A11+).
* **Sistema Operativo:** iOS 14.0 o superior.
* **Conectividad:** Conexión a Internet activa (Wi-Fi/4G/5G) indispensable para autenticación (Supabase) y consultas externas.

### Configuración del Entorno Local

1. Clona este repositorio:
   ```bash
   git clone [https://github.com/tu-usuario/foodmetrics.git](https://github.com/tu-usuario/foodmetrics.git)
