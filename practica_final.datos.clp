; Autor: Víctor Manuel Rodríguez Navarro
; Fecha: 27/05/19
(deftemplate Exploracion
	(field NombrePaciente)
	(multifield SintomasPaciente (default ?NONE));Campo obligatorio
	(multifield Diagnostico);Se editará posteriormente
	(multifield EspecialistasAsignados);Lista de especialistas que tratarán al paciente
    (multifield MedicamentosNecesarios);Medicamentos para tratar las multiples enfermedades
    (multifield MedicamentosRecetados);Medicamentos que se irán recetando
)

(deftemplate Enfermedad
	(field NombreEnfermedad)
	(multifield Sintomas)
	(multifield Tratamiento)
)

(deftemplate Doctor
	(field Especialidad)
	(multifield Pacientes)
	(multifield Medicamentos)
)

(deffacts HechosIniciales
    (Enfermedad (NombreEnfermedad Gripe) (Sintomas tos cansancio fiebre dolor) (Tratamiento Jarabe Contrex Vacuna))
    (Enfermedad (NombreEnfermedad Rubeola) (Sintomas fiebre escalofrios jaqueca secrecion) (Tratamiento Vacuna Pastilla))
    (Enfermedad (NombreEnfermedad Malaria) (Sintomas diarrea fiebre ictericia escalofrios) (Tratamiento Vacuna))
    (Enfermedad (NombreEnfermedad Hepatitis) (Sintomas diarrea nauseas ictericia) (Tratamiento Vacuna Pastilla))
    (Enfermedad (NombreEnfermedad Tuberculosis) (Sintomas tos cansancio fiebre escalofrios) (Tratamiento Pastilla))
    (Enfermedad (NombreEnfermedad Anemia) (Sintomas cansancio nauseas apatia) (Tratamiento Vitamina))
    (Doctor (Especialidad Otorrino) (Medicamentos Jarabe Contrex))
    (Doctor (Especialidad Nutricionista) (Medicamentos Vitamina))
    (Doctor (Especialidad MedicoGeneral) (Medicamentos Vacuna Pastilla))
    (Doctor (Especialidad Endocrinologo) (Medicamentos Vacuna))
)