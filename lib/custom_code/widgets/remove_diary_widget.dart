// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class RemoveDiaryWidget extends StatefulWidget {
  const RemoveDiaryWidget({
    Key? key,
    this.width,
    this.height,
    this.onCancel,
    this.onRemove,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Future Function()? onCancel;
  final Future Function()? onRemove;

  @override
  _RemoveDiaryWidgetState createState() => _RemoveDiaryWidgetState();
}

class _RemoveDiaryWidgetState extends State<RemoveDiaryWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  // Evita que el usuario pulse los botones dos veces mientras se anima
  bool _isProcessing = false;

  @override
  void initState() {
    super.initState();

    // Configuración de la animación
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _animController,
        curve: Curves.easeOutBack, // Efecto rebote suave al entrar
        reverseCurve: Curves.easeIn, // Efecto acelerado al salir
      ),
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animController, curve: Curves.easeInOut),
    );

    // Inicia la animación de entrada
    _animController.forward();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  // Función para manejar el botón "Remove"
  Future<void> _handleRemove() async {
    if (_isProcessing) return;
    setState(() => _isProcessing = true);

    // Reproduce la animación de salida (encoger y desaparecer)
    await _animController.reverse();

    // Ejecuta la acción de FlutterFlow
    if (widget.onRemove != null) {
      await widget.onRemove!();
    }
  }

  // Función para manejar el botón "Cancel"
  Future<void> _handleCancel() async {
    if (_isProcessing) return;
    setState(() => _isProcessing = true);

    await _animController.reverse();

    if (widget.onCancel != null) {
      await widget.onCancel!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacityAnimation,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          width: widget.width ?? 340,
          padding: const EdgeInsets.all(28),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 32,
                spreadRadius: 0,
                offset: const Offset(0, 12),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Icono de la papelera
              Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Color(0xFFFDECEA), // Rojo muy clarito (fondo)
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.delete_outline_rounded,
                  color: Color(0xFFE53935), // Rojo intenso
                  size: 32,
                ),
              ),
              const SizedBox(height: 20),

              // Título
              const Text(
                'Remove from diary',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF111111),
                  fontFamily: 'Inter', // Cambia a tu fuente si es necesario
                ),
              ),
              const SizedBox(height: 12),

              // Subtítulo principal
              const Text(
                'Are you sure you want to remove this item from today\'s diary?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF555555),
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 12),

              // Texto secundario
              const Text(
                'You can add it again anytime.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF888888),
                ),
              ),
              const SizedBox(height: 28),

              // Botones
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _handleCancel,
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        side: const BorderSide(
                          color: Color(0xFFE0E0E0),
                          width: 1.5,
                        ),
                        foregroundColor: Colors.grey[800], // Efecto ripple
                      ),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          color: Color(0xFF111111),
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _handleRemove,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF04438), // Rojo botón
                        foregroundColor: Colors.white, // Efecto ripple
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Remove',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
