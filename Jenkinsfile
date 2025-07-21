pipeline {
    agent {
        node {
            label 'AGENT-1'
        }
    }
    options {
        timeout(time: 1, unit: 'HOURS')
        disableConcurrentBuilds()
        ansiColor('xterm')
    }

    // build
    stages {
        stage('VPC') {
            steps {
                sh """
                    cd 01-vpc
                    terraform init -reconfigure
                    terraform apply -auto-approve
                """
            }
        }
        stage('SG') {
            steps {
                sh """
                    cd 02-sg
                    terraform init -reconfigure
                    terraform apply -auto-approve
                """
            }
        }
        stage('VPN') {
            steps {
                sh """
                    cd 03-vpn
                    terraform init -reconfigure
                    terraform apply -auto-approve
                """
            }
        }
        stage('DB ALB') {
            parallel {
                stage('DB') {
                    steps {
                        sh """
                        cd 04-database
                        terraform init -reconfigure
                        terraform apply -auto-approve
                    """
                    }
                }
                stage('APP ALB') {
                    steps {
                        sh """
                        cd 05-app-alb
                        terraform init -reconfigure
                        terraform apply -auto-approve
                    """
                    }
                }
            }
        }
        stage('Plan') {
            steps {
                sh """
                    cd 01-vpc
                    terraform plan
                """
            }
        }
        stage('Deploy') {
            when {
                expression {
                    params.action == 'apply'  
                }   
             }
            input {
                message "Should we continue?"
                ok "Yes, we should."
                // submitter "alice,bob"
                // parameters {
                //     string(name: 'PERSON', defaultValue: 'Mr Jenkins', description: 'Who should I say hello to?')
                // }
            }
            steps {
                sh """
                    cd 01-vpc
                    terraform apply -auto-approve
                """
            }
        }
    }

    // post build
    post { 
        always { 
            echo 'I will always say Hello again!'
        }
        failure {
            echo 'this runs when pipeline is failed, used to send some alerts'
        }
        success {
            echo 'I will say Hello when pipeline is success'
        }
    }
}