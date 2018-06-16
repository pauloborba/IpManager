Feature: Relatorios 
As a professor or an assistant
I want to require informations about former classes
So that i can see and compare with the actual class

Scenario: relatorio de turmas anteriores
Given eu estou logado como professor "paulo"
And existe uma turma registrada como "2017.2" com o aluno "tharcio" com notas "7", "7", "8", "8" nas lista e "8", "7" nas provas, e "80%" de presen�a e com o aluno �nikolas� com notas "8", "8", "8", "8" nas lista e "8", "8" nas provas, e "75%" de presen�a
And existe uma turma registrada como "2017.1" com o aluno "marcilio" com notas "7", "7", "8", "8" nas lista e "8", "7" nas provas, e "90%" de presen�a e com a aluno �lavinia� com notas "9", "9", "8", "8" nas lista e "8", "9" nas provas, e "95%" de presen�a
When eu pe�o o relatorio das turmas 
Then o sistema retorna um relatorio com uma turma registrada como "2017.2" com o aluno
�tharcio�, com media �7.5� ,"80%" de presen�a, e status �aprovado� com o aluno
�nikolas�, com media �8� ,"75%" de presen�a, e status �aprovado�
And o sistema retorna um relatorio com uma turma registrada como "2017.1" com o aluno
�marcilio�, com media �7.5�, "90%" de presen�a, e status �aprovado� com a aluna
�lavinia�, com media �8.5� ,"95%" de presen�a, e status �aprovado�

Scenario : relatorio de turmas anteriores (GUI)
Given eu estou na pagina de relatorios
And existe uma turma registrada como "2017.2" com o aluno "tharcio" com notas "7", "7", "8", "8" nas lista e "8", "7" nas provas, e "80%" de presen�a
And existe uma turma registrada como "2017.1" com o aluno "marcilio" com notas "7", "7", "8", "8" nas lista e "8", "7" nas provas, e "90%" de presen�a
when eu pe�o o relatorio de turmas anteriores
Then aparece o relatorio da turma "2017.2" com o aluno �tharcio�, com media �7.5�, "90%" de presen�a e status �aprovado�
And aparece o relatorio da turma "2017.1" com o aluno �marcilio�, com media �7.5�, "90%" de presen�a e status �aprovado�

Scenario: relatorio de turmas anteriores sem turmas anteriores
Given eu estou na pagina de relatorios
And n�o existe uma turma registrada 
When eu pe�o o relatorio de turmas anteriores
Then o sistema retorna uma mensagem indicando ausencia de turmas anteriores

Scenario: relatorio da turma atual (GUI)
Given eu estou na pagina de relatorios
And existe o aluno "tharcio" com notas "7", "7", "8", "8" nas lista e "8", "7" nas provas, e "80%" de presen�a
when eu pe�o os relatorios individuais de alunos
Then aparece o relatorio com o aluno "tharcio", media �7.5�, presen�a "80%" e status "aprovado"

Scenario: relatorio da turma atual com reprova��o por nota (GUI)
Given eu estou na pagina de relatorios
And existe o aluno "tharcio" com notas "7", "7", "8", "8" nas lista e "8", "7" nas provas, e "80%" de presen�a
And existe o aluno "marcilio" com notas "2", "2", "3", "3" nas lista e "2", "2" nas provas e "75%" de presen�a
When eu pe�o os relatorios individuais de alunos
Then aparece o relatorio com o aluno "tharcio", media �7.5�, presen�a "80%" e status "aprovado"
And o aluno "marcilio", media "2", presen�a "75%" e status "reprovado"

Scenario: relatorio da turma atual com reprova��o por falta (GUI)
Given eu estou na pagina de relatorios
And existe o aluno "tharcio" com notas "7", "7", "8", "8" nas lista e "8", "7" nas provas, e "66%" de presen�a
And existe o aluno "marcilio" com notas "7", "7", "8", "8" nas lista e "8", "7" nas provas e "75%" de presen�a
when eu pe�o os relatorios individuais de alunos
Then aparece o relatorio com o aluno "tharcio", media �F�, presen�a "66%" e status "reprovado por falta"
And o aluno "marcilio", media "7,5", presen�a "75%" e status "aprovado"

Scenario: relatorios da turma atual com alunos sem notas
Given eu estou na pagina de relatorios
And existe o aluno "tharcio" com notas "7", "7", "8", "8" nas lista e "8", "7" nas provas, e "80%" de presen�a
And existe o aluno "marcilio" com notas "4", "8", "6", "9" nas lista e "4", "" nas provas e "75%" de presen�a
When eu pe�o os relatorios individuais de alunos
Then o sistema retorna um relatorio com o aluno "tharcio",media �7.5�, presen�a "80%" e status "aprovado"
And o aluno "marcilio", media "", presen�a "75%" e status ""

