Feature: Chamada Eletr�nica
As a Teacher/Assistant 
I want to be able to create classes and record students attendances/absences
So that i can determine if the student attended the required number of classes

Scenario: Register attendance (GUI)
Given I am at the classes page 
And I have �Rodrigo Cunha� with login �rcs8� registered as a student
And I have the class �Aula Introdut�ria� in the list
And the attendance box for �Rodrigo Cunha� is not checked
When I try to submit the class attendance
Then the student �Rodrigo Cunha� will be marked as present in the class �Aula Introdut�ria�

Scenario: Register absence (GUI)
Given I am at the classes page 
And I have �Rodrigo Cunha� with login �rcs8� registered as a student
And I have the class �Aula Introdut�ria� in the list
And the attendance box for �Rodrigo Cunha� is checked
When I try to submit the class attendance
Then the student �Rodrigo Cunha� will be marked as absent in the class �Aula Introdut�ria�

Scenario: Calculate Presence (GUI)
Given I am at the classes page
And I have �Rodrigo Cunha� with login �rcs8� registered as a student
And I have the classes �Aula Introdut�ria�, �Acompanhamento de Projeto�, �Arrays Bidimensionais�, �Sistemas multiagentes� and �Reposit�rios�
And the student �rcs8� was marked as present on �Aula Introdut�ria� and �Acompanhamento de Projeto�
When I check his presence overall
Then I see a presence percentage of �40� percent
And he is marked as �Reprovado por Falta�
