Para probar este aplicativo debe ejecutar en mysql el archivo inicializar_db.sql

Que hace el programa:

1. Muestra una página de inicio para que un usuario inicie una sesión. Usar el usuario de prueba:
    admin@hospital.com //
    contraseña: 1234  //
3. Despliega un menú sencillo con las opcines:
  2.1. Medico:: Lista los medicos en la base de datos
       - Permite eliminar un médico siempre y cuando no tenga citas asociadas
       - Permite editar la información del médico, permite agendar una cita médica eligiendo paciente, fechaHora de la cita
          y permite cancelar la cita médica programada.
       - Permite agregar un nuevo médico
   2.2. Paciente: Lista los pacientes en la base de datos
       - Permite eliminar un paciente siempre y cuando no tenga citas asociadas
       - Permite editar la información del paciente, permite agendar una cita médica eligiendo médico, fechaHora de la cita
         y permite cancelar la cita médica programada.
       - Permite agregar un nuevo paciente
   2.3. Citas: Lista las citas según la fecha elegida y permite cancelar citas.
   2.4. Salir: este botón redirecciona a la página de inicio.

   Nota: una vez agendada una cita está no se puede eliminar, solo cancelar.
