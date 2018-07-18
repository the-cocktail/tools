pipeline {
    environment {
	    // First steps to prepare Jenkins environment.
    }

    agent any
    
    options {
	    // Plugins options
    }
    
    stages {
        stage('Preparation') {
            steps {
                echo 'Preparation...'
                // Steps necesaries to start a build
            }
        }
        stage('Build & Dependencies') {
            steps {
                echo 'Building...'
		        // Building proyect and check dependencies
            }
        }
        stage('Test') {
            steps {
                echo 'Testing...'
                // Pass all tests: unit, integration, functional
            }
        }
        stage('Code Review') {
            steps {
                echo 'Code reviewing...'
                // Check if your code is as clean as you need
            }
        }
        stage('Documentation & Reports') {
            steps {
		        echo 'Generating doc & reports'               
		        // Generate html reports, graphics, metrics
            }
        }
        stage('Deploy in ENV') {
            when {
                branch 'ENV'
            }
            steps {
        		echo 'Deploying at ENV...'
        		// Make deploy for selected environment
            }
        }
    }
    post {
        always {
	        // Clean up Jenkins
        }
        aborted {
            // Aborted build process
        }
        failure {
	        // Failed build process
	    }
        success {
            // Successed build process
        }
    }
}
