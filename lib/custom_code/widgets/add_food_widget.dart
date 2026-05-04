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

class AddFoodWidget extends StatefulWidget {
  const AddFoodWidget({
    Key? key,
    this.width,
    this.height,
    this.foodName = 'Pechuga de pollo',
    this.onCancel,
    this.onAdd,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String foodName;
  final Future Function()? onCancel;
  final Future Function(int gramsProduct)? onAdd;

  @override
  _AddFoodWidgetState createState() => _AddFoodWidgetState();
}

class _AddFoodWidgetState extends State<AddFoodWidget>
    with SingleTickerProviderStateMixin {
  late TextEditingController _textController;
  late AnimationController _animController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: '150');

    // Configuración de la animación de entrada
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
    _scaleAnimation = CurvedAnimation(
      parent: _animController,
      curve: Curves.easeOutBack,
    );

    // Iniciar la animación al cargar
    _animController.forward();
  }

  @override
  void dispose() {
    _textController.dispose();
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: Container(
        width: widget.width ?? 340,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 24,
              spreadRadius: 0,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icono superior
            Container(
              padding: const EdgeInsets.all(14),
              decoration: const BoxDecoration(
                color: Color(0xFFE8F5E9), // Verde muy claro
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.set_meal_outlined, // Icono alternativo (muslo no nativo)
                color: Color(0xFF2E7D32),
                size: 28,
              ),
            ),
            const SizedBox(height: 16),

            // Título principal
            const Text(
              'Add product',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: Color(0xFF1E1E1E),
                fontFamily: 'Inter', // O tu fuente de Flutterflow
              ),
            ),
            const SizedBox(height: 6),

            // Nombre del alimento (Variable)
            Text(
              widget.foodName,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1B8028), // Verde oscuro
              ),
            ),
            const SizedBox(height: 8),

            // Subtítulo
            const Text(
              'How many grams are you going to eat?',
              style: TextStyle(
                fontSize: 15,
                color: Color(0xFF616161),
              ),
            ),
            const SizedBox(height: 24),

            // Campo de texto animado
            TextFormField(
              controller: _textController,
              keyboardType: TextInputType.number,
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xFF1E1E1E),
              ),
              decoration: InputDecoration(
                labelText: 'Grams',
                labelStyle: const TextStyle(
                  color: Color(0xFF1B8028),
                  fontWeight: FontWeight.w500,
                ),
                suffixText: 'g',
                suffixStyle: const TextStyle(
                  color: Color(0xFF616161),
                  fontSize: 16,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 18,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFF1B8028)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFF1B8028)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Color(0xFF1B8028),
                    width: 2,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 28),

            // Botones
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      if (widget.onCancel != null) {
                        widget.onCancel!();
                      }
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      side: const BorderSide(
                        color: Color(0xFFE0E0E0),
                        width: 1.5,
                      ),
                      foregroundColor: Colors.grey[800], // Color del ripple
                    ),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        color: Color(0xFF1E1E1E),
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (widget.onAdd != null) {
                        // Pasamos el valor del texto a la acción de FlutterFlow
                        widget.onAdd!(int.parse(_textController.text));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3B9E42), // Verde botón
                      foregroundColor: Colors.white, // Color del ripple
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Add',
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
    );
  }
}
