
Multi stage build process
------------------------------------------------------------

Create reactos project
------------------------------------------------------------
npx create-react-app docker-react
cd react-react
npm run build

Remove node_modules
------------------------------------------------------------
rm -rf node_modules

Create Dockerfile in docker-react
------------------------------------------------------------

Build docker image
------------------------------------------------------------
docker build .

Run nginx based container
------------------------------------------------------------
docker run -p 80:80 2f6d6be65150

Build and run development docker
------------------------------------------------------------
run build -f Dockerfile.dev
docker run -it 18988e2c38be  npm run test                  # This waits for user commands
docker run -it 18988e2c38be  npm run test -- --coverage    # Returns after test

Prepare for deployment
------------------------------------------------------------
Add docker-react as a repo to github
Link repo to the travis account
Add .travis.yml file (note the dot[.] in the file name)

Elastic Beanstalk environment
------------------------------------------------------------
Select 'Docker running on 64bit Amazon Linux'

IAM setup
------------------------------------------------------------
Add the following user in 'IAM' service provided by AWS.
 - 'docker1-travis-ci'
 - Enable 'Programmatic access'
 - Do not enable AWS Management Console Access
 - Attach existing polcies directly - 'AWSElasticBeanstalkFullAccess'
 - Click 'Create User' to complete the process
 - Note down AWS_ACCESS_KEY and AWS_SECRET_KEY

Travis-CI Settings
------------------------------------------------------------
 - Navigate to Settings -> 'More options' -> Environment Variables
 - Add AWS_ACCESS_KEY and AWS_SECRET_KEY ] and do not enable display in build log
 - Add access_key_id and secret_access_key to .travis.yml


Debug AWS deployment failures
------------------------------------------------------------
 - Use destination folder for docker COPY command to look like './' instead of '.'
 - Recreate the Elastic Beanstalk environment with 'Docker running on 64bit Amazon Linux'
 - Upgrade t2.micro to to t2.small instance


Expose ports for deployment
------------------------------------------------------------
Add line 'EXPOSE 80' in Dockerfile

Reference
------------------------------------------------------------
https://docs.docker.com/engine/reference/run/#env-environment-variables
https://docs.travis-ci.com/user/migrate/open-source-repository-migration#migrating-a-repository


