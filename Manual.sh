#------------Change email for future commits------------
#Go to the git bash terminal
#Go to the folder with the repository
cd C:\\PathToYourRepo\\RepoFolderName

#Getting the user name for sending
git config user.name
#Getting the user email for sending
git config user.email

#Change email for future commits, name similarly
git config user.email "NewName@NewDomain.com"
#Change email globally, all commits from the machine will be under this email
git config --global user.email "NewName@NewDomain.com"

#View all variables
git config --list
#---------------------------------------------------------


#------------Change email for existing commits------------
#For each branch we perform the following actions
#Set branch
git checkout BRANCHNAME

#Throw in the authors' changes. In the if condition the original email, in the code block the new email
git filter-branch -f --commit-filter '
	if [ "$GIT_COMMITTER_EMAIL" = "Name@Domain.com" ];
        then
                GIT_COMMITTER_NAME="NewName";
                GIT_AUTHOR_NAME="NewName";
                GIT_COMMITTER_EMAIL="NewName@Domain.com";
                GIT_AUTHOR_EMAIL="NewName@Domain.com";
        fi;
        if [ "$GIT_COMMITTER_EMAIL" = "AnotherName@Domain.com" ];
        then
                GIT_COMMITTER_NAME="AnotherNewName";
                GIT_AUTHOR_NAME="AnotherNewName";
                GIT_COMMITTER_EMAIL="AnotherNewName@Domain.com";
                GIT_AUTHOR_EMAIL="AnotherNewName@Domain.com";
        fi;
	git commit-tree "$@"' HEAD
#GIT_COMMITTER_NAME & GIT_AUTHOR_NAME may be optional?

#Pushing changes to the branch
git push -f origin
#--------------------------------------------------------
