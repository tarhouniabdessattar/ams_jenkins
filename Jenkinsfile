pipeline {
    agent any

    stages {
        stage('Salutation à tout le monde devops') {
            steps {
                echo 'Bonjour tout le monde'
            }
        }

        stage('Début du pipeline ...') {
            steps {
                echo 'Chargement'
            }
        }

        stage('Création image Docker') {
            steps {
                script {
                    // Vérifier si Docker est installé
                    sh 'docker --version'

                    // Construire l'image Docker
                    sh 'docker build -t tarhouni_ams_2024 .'
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline terminé.'
        }
        success {
            echo 'Pipeline exécuté avec succès.'
        }
        failure {
            echo 'Pipeline échoué.'
        }
    }
}
