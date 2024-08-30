import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Terms extends StatelessWidget {
  const Terms({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title:
            const Text('Termos de Uso', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              Text(
                'Bem-vindo ao nosso aplicativo. Estes termos de uso regem o uso do aplicativo e de seus serviços. Por favor, leia-os cuidadosamente.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                '1. Aceitação dos Termos:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Ao acessar ou utilizar a Plataforma de qualquer forma, você concorda em cumprir estes Termos de Uso e todas as políticas e diretrizes incorporadas por referência. Se você não concordar com estes termos, por favor, não utilize o aplicativo.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                '2. Privacidade:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Ao utilizar o aplicativo, você reconhece e concorda com a coleta, uso e divulgação de suas informações pessoais de acordo com nossa Política de Privacidade. Essas informações podem incluir, mas não estão limitadas a, seu nome, email, telefone.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                '3. Responsabilidade do Usuário:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Você é o único responsável por todas as atividades realizadas através de sua conta no aplicativo. É proibido compartilhar sua senha ou permitir que terceiros acessem sua conta.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                '4. Propriedade Intelectual:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Todo o conteúdo disponibilizado no Aplicativo, incluindo textos, imagens, vídeos, gráficos, logotipos, marcas registradas, software e outros materiais, é de propriedade do aplicativo ou de seus licenciadores e está protegido por leis de propriedade intelectual.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                '5. Restrições de Uso:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Você concorda em não utilizar o aplicativo para qualquer finalidade ilegal ou não autorizada, nem violar quaisquer leis em sua jurisdição. Você também concorda em não acessar ou tentar acessar áreas protegidas do aplicativo, nem interferir no seu funcionamento ou segurança.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                '6. Modificações nos Termos:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Reservamo-nos o direito de modificar estes Termos de Uso a qualquer momento, mediante aviso prévio razoável. O uso continuado do aplicativo após a publicação de tais modificações constituirá sua aceitação dos novos termos.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                '7. Rescisão:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Podemos rescindir ou suspender sua conta e acesso ao aplicativo imediatamente, sem aviso prévio ou responsabilidade, por qualquer motivo, incluindo violação destes Termos de Uso.',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
