import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flatbeat/utils/constants.dart';

class PerfilScreen extends StatefulWidget {
  const PerfilScreen({Key? key}) : super(key: key);

  @override
  _PerfilScreenState createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  File? _profileImage;
  final ImagePicker _picker = ImagePicker();
  final List<File> _memeFiles =
      []; // Lista dinâmica para armazenar arquivos de memes

  final TextEditingController _usernameController =
      TextEditingController(text: 'Geovanna Sodré');
  final TextEditingController _descriptionController =
      TextEditingController(text: 'Flamenguista');

  Future<void> _editProfile(BuildContext context) async {
    final TextEditingController _editUsernameController =
        TextEditingController(text: _usernameController.text);
    final TextEditingController _editDescriptionController =
        TextEditingController(text: _descriptionController.text);

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Editar Perfil'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _editUsernameController,
                decoration: const InputDecoration(labelText: 'Nome'),
              ),
              TextField(
                controller: _editDescriptionController,
                decoration: const InputDecoration(labelText: 'Descrição'),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text('Salvar'),
              onPressed: () {
                setState(() {
                  _usernameController.text = _editUsernameController.text;
                  _descriptionController.text = _editDescriptionController.text;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _pickImage(ImageSource source,
      {bool isProfileImage = false}) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        if (isProfileImage) {
          _profileImage = File(pickedFile.path);
        } else {
          _memeFiles.add(File(pickedFile.path));
        }
      });
    }
  }

  Widget _buildMemeGallery() {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _memeFiles.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.file(_memeFiles[index], fit: BoxFit.cover),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_usernameController.text),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.primaryColor, Colors.black],
          ),
        ),
        child: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 70),
                GestureDetector(
                  onTap: () =>
                      _pickImage(ImageSource.gallery, isProfileImage: true),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: _profileImage != null
                        ? FileImage(_profileImage!)
                        : null,
                    child: _profileImage == null
                        ? const Icon(Icons.camera_alt, size: 50)
                        : null,
                  ),
                ),
                const SizedBox(height: 60),
                Text(
                  _usernameController.text,
                  style: const TextStyle(color: Colors.white, fontSize: 24),
                ),
                Text(
                  _descriptionController.text,
                  style: const TextStyle(color: Colors.white70, fontSize: 16),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () => _editProfile(context),
                      child: const Text('Editar perfil'),
                    ),
                    ElevatedButton(
                      onPressed:
                          () {}, // Implemente a funcionalidade de compartilhamento
                      child: const Text('Compartilhar'),
                    ),
                  ],
                ),
                const SizedBox(height: 70),
                const Text(
                  'Galeria de memes',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                _buildMemeGallery(),
                ElevatedButton(
                  onPressed: () => _pickImage(ImageSource.gallery),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: AppColors.primaryColor,
                  ),
                  child: const Text('Adicionar Meme'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
