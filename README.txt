
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
docker run -p 8080:80 2f6d6be65150

Build and run development docker
------------------------------------------------------------
run build -f Dockerfile.dev
docker run -it 18988e2c38be  npm run test                  # This waits for user commands
docker run -it 18988e2c38be  npm run test -- --coverage    # Returns after test

Prepare for deployment
------------------------------------------------------------
Add docker-react to github
Link repo to the travis account
Add travis.yml file

Reference
------------------------------------------------------------
https://docs.docker.com/engine/reference/run/#env-environment-variables


