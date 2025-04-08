pipeline {
    agent any

    environment {
        API_URL = 'https://xray.cloud.getxray.app/api/v2/authenticate'
        CLIENT_ID = 'AFC9594E0A7F469592C85F5D6BDC6EEB'
        CLIENT_SECRET = 'ae0402b7075192c2a554bde07c9ee9ff424e3ab764a1ac082fda09aa39b370f8'
        TEST_RESULT_FILE = 'output.xml'
    }

    stages {
        stage('Checkout') {
            steps {
                git credentialsId: 'login_git',
                    branch: 'master',
                    url: 'https://github.com/Amy2910/SauceDemo.git'
            }
        }

        stage('Run Robot Tests') {
            steps {
                bat 'robot -d . tests/SauceDemoTests.robot'
                // "-d ." pour générer output.xml dans le workspace
            }
        }

        stage('Get Xray Token') {
            steps {
                bat """
                    curl -H "Content-Type: application/json" ^
                    -X POST ^
                    --data "{ \\"client_id\\": \\"%CLIENT_ID%\\", \\"client_secret\\": \\"%CLIENT_SECRET%\\" }" ^
                    %API_URL% > token.txt
                """
            }
        }

        stage('Send Results to Xray') {
            steps {
                bat """
                    set /p TOKEN=<token.txt
                    curl -H "Content-Type: text/xml" ^
                    -X POST ^
                    -H "Authorization: Bearer %TOKEN%" ^
                    --data "@%TEST_RESULT_FILE%" ^
                    "https://xray.cloud.getxray.app/api/v2/import/execution/robot?projectKey=POEI20252"
                """
            }
        }
    }
}
