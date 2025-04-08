pipeline {
    agent any

    environment {
        ROBOT_REPORTS = 'results'
        OUTPUT_XML = 'results/output.xml'
    }

    stages {
        stage('Install Dependencies') {
            steps {
                echo '🔧 Installing dependencies...'
                sh '''
                    pip install --upgrade pip
                    pip install robotframework robotframework-seleniumlibrary
                '''
            }
        }

        stage('Run Robot Tests') {
            steps {
                echo '🚀 Running Robot Framework tests...'
                sh '''
                    mkdir -p $ROBOT_REPORTS
                    robot --output $OUTPUT_XML tests/
                '''
            }
        }

        stage('Upload to Xray') {
            steps {
                echo '📡 Uploading results to Xray...'

                withCredentials([string(credentialsId: 'XRAY_API_TOKEN', variable: 'XRAY_TOKEN')]) {
                    sh '''
                        echo '📤 Envoi en cours...'
                        RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" \
                          -H "Content-Type: text/xml" \
                          -X POST \
                          -H "Authorization: Bearer $XRAY_TOKEN" \
                          --data @$OUTPUT_XML \
                          "https://xray.cloud.getxray.app/api/v2/import/execution/robot?projectKey=POEI20252")

                        if [ "$RESPONSE" = "200" ]; then
                            echo "✅ Résultats envoyés avec succès à Xray."
                        else
                            echo "❌ Échec de l'envoi à Xray. Code HTTP: $RESPONSE"
                            exit 1
                        fi
                    '''
                }
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: 'results/*.xml', allowEmptyArchive: true
        }
    }
}
