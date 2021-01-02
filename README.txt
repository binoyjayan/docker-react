
Multi stage build process
------------------------------------------------------------

Create reactos project
------------------------------------------------------------
npx create-react-app web
cd web
npm run build

Remove node_modules
------------------------------------------------------------
rm -rf node_modules

Create Dockerfile in web/
------------------------------------------------------------

Build docker image
------------------------------------------------------------
docker build .

Run nginx based container
------------------------------------------------------------
docker run -p 8080:80 2f6d6be65150


