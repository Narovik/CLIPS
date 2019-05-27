; Autor: Víctor Manuel Rodríguez Navarro
; Fecha: 27/05/19
(defrule ExplorarPaciente
    (declare (salience 10));Damos prioridad a esta regla
    =>
    (printout t "********************************************************" crlf)
    (printout t "*   SISTEMA INTELIGENTE DE DIAGNOSIS por Victor Rguez  *" crlf)
    (printout t "*                                                      *"crlf)
    (printout t "*   INTRODUZCA LOS SINTOMAS DEL PACIENTE A EXPLORAR    *" crlf)
    (printout t "*    (no importa el orden ni mayusculas/minusculas)    *" crlf)
    (printout t "*   SE DIAGNOSTICARAN TODAS LAS POSIBLES ENFERMEDADES, *" crlf)
    (printout t "*   SE RECETARÁN LOS MEDICAMENTOS NECESARIOS           *" crlf)
    (printout t "*   Y SE ASIGNARÁ CITA CON LOS ESPECIALISTAS ADECUADOS *" crlf)
    (printout t "********************************************************" crlf)
    (printout t "Introduzca nombre del paciente: ")
    (bind ?nombre (read)) ;Leemos en una variable
    (printout t "Introduzca los sintomas (separados por espacio) " crlf "==> ")
    (bind ?sintomas (lowcase (readline))) ;Leemos en un string minuscula

    (assert (Exploracion
        (NombrePaciente ?nombre)
        (SintomasPaciente (explode$ ?sintomas)));Separamos el string en campos
    )
    (printout t "<== Exploracion de " ?nombre " guardada!" crlf)
)

(defrule Diagnosticar
    ?exp <- (Exploracion (NombrePaciente ?np) (SintomasPaciente $?sp) (Diagnostico $?diag) (MedicamentosNecesarios $?mnec));Dada una exploracion 
    (Enfermedad (NombreEnfermedad ?ne) (Sintomas $?senf) (Tratamiento $?trat));Y una enfermedad cuyos campos multifield
    (test (not (subsetp (create$ ?ne) $?diag)));Que no esté ya diagnosticada
    (test (or(subsetp $?sp $?senf) (subsetp $?senf $?sp)));se encuentren en los sintomas del paciente o viceversa
    =>
    (printout t "*** ENFERMEDAD DIAGNOSTICADA PARA " ?np  " : " ?ne" ***" crlf "*** TRATAMIENTO NECESARIO: " $?trat " ***"crlf)
    (modify ?exp (Diagnostico (insert$ $?diag 1 ?ne));Agregamos diagnostico al paciente
                (MedicamentosNecesarios (insert$ $?mnec 1 $?trat))) ; y los medicamentos necesarios

)

(defrule AsignarDoctor
   ?exp <- (Exploracion (NombrePaciente ?np) (Diagnostico $?diag) (EspecialistasAsignados $?especialistas) (MedicamentosRecetados $?recetados) (MedicamentosNecesarios $?mnec));Dada una exploracion
   (test (neq $?diag nil)) ;Que tenga diagnostico
   ?doctor <- (Doctor (Especialidad ?espDoctor) (Medicamentos $?med)(Pacientes $?pac));Dado un medico
   (test (not (subsetp (create$ ?espDoctor) $?especialistas))) ;que no esté ya asignado al paciente
   (Enfermedad (NombreEnfermedad ?enfermedad)(Tratamiento $?trat));Y una enfermedad
   (test (subsetp (create$ ?enfermedad) $?diag));Que esté diagnosticada
   (test (and(subsetp $?med $?mnec);Y Tal que el medico pueda dar los medicamentos necesarios 
            (not(subsetp $?med $?recetados)))); ;Y no estén ya recetados por otro                                                          
   (not (Doctor (Medicamentos $?med2&:(and(> (length $?med2)(length $?med))(subsetp $?med $?med2)))));Y sea el medico que pueda dar los max medicamentos necesarios
   =>
   (modify ?exp (EspecialistasAsignados (insert$ $?especialistas 1 ?espDoctor ));Asignamos el especialista al paciente
                (MedicamentosRecetados (insert$ $?recetados 1 $?med )));Y le recetamos los medicamentos
  
   (modify ?doctor (Pacientes (insert$ $?pac 1 ?np)));Insertamos el paciente en la lista de pacientes del especialista

   (printout t "*** PACIENTE " ?np " ASIGNADO AL ESPECIALISTA " ?espDoctor " ***"crlf)
)






