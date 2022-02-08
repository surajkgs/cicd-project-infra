node{
			  //def RepositoryName  = params.RepositoryName
			  def RepositoryName  = "https://github.com/surajkul/cicd-project-infra"			  
			  //def Branch = params.BranchName
			  def Branch = "main"
			  def credentialsIds = 'github_creds'
			  def DeployEnv = "dev"
			BUILD_NUMBER_stage()
		    //checkoutProject(Branch, RepositoryName, credentialsIds)
		    //Clean_stage()

        
}

def BUILD_NUMBER_stage(){
			stage('BUILD_NUMBER_stage') { 
                echo "pwd ==>"
                sh 'pwd'
                echo "ls ==>"
                sh 'ls'
				echo "build number -----> ${env.BUILD_NUMBER}"								
							}
}				
// def checkoutProject(Branch, RepositoryName, credentialsIds) {
// 		stage('Checkout Stage')
// 		{
// 			checkout([$class: 'GitSCM',branches:[[name: Branch]], doGenerateSubmoduleConfigurations: false, extensions: [[$class:'CloneOption', depth: 0, noTags: false, reference: '', shallow: false, timeout: 60]], gitTool: 'Default', submoduleCfg: [], userRemoteConfigs: [[credentialsId: credentialsIds, url: RepositoryName ]]])  
// 		}
// }

// def Clean_stage(){
// 			stage('BUILD_NUMBER_stage'){ 
// 			    cleanWs()  
// 			}
// }