pipeline {
    agent any

    parameters {
        choice(
            name: 'action',
            choices: ['apply', 'destroy'],
            description: 'Terraform action to perform'
        )
    }

    stages {
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM',
                          branches: [[name: '*/master']],
                          extensions: [],
                          userRemoteConfigs: [[url: 'https://github.com/sivak243/JenkinsTerraform.git']]])
            }
        }

        stage("Terraform Init") {
            steps {
                sh 'terraform init -reconfigure'
            }
        }

        stage("Terraform Plan") {
            steps {
                sh 'terraform plan'
            }
        }

        stage("Terraform ${params.action.capitalize()}") {
            steps {
                echo "Terraform action is --> ${params.action}"
                sh "terraform ${params.action} -auto-approve -no-color"
            }
        }
    }

    post {
        failure {
            echo 'Pipeline failed.'
        }
        success {
            echo 'Pipeline completed successfully.'
        }
    }
}
