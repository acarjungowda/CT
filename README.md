# Cloud Resource recommendation using Custom Template Composition.

## I. Custom Template Project

This is a Custom Template Java Struts 2 web project and the files uploaded here are the eclipse project code. As said we have used Struts 2 framework for the implementation of this web project. Struts 2 is a java MVC framework for enterprise web applications.

For the client side i.e. user interface has been developed using JSP and CSS Bootstrap has been used for the look and feel of the application. Client side validations are implemented using java script and server side validations is java code written in the presentation layer of the project.

User uses the GUI for requirement specification and up on submission of user 
requirements the data is transfered to the business layer which has the logic for comparing the user requirements with available cloud resources from multiple vendors and resources are recommended for the users.

Like any other enterprise web application our's is multi tier web application with the  following layers/tiers

a. Client/Presentation GUI Layer
	In struts 2, each JSP can have a backend java class which controls the presentation of  data on page. Java Script is used for client validations and java backend class handles the server validations.
	
b. Business Logic Layer	This is the core of the project which has the logic to handle the data. The user inputs are compared with the RSpace and eligible resources are identified in each component i.e network, storage and compute. These are called MacOps and then solution with all possible combinations of the MacOps from each component is constructed and are inserted into the Catalog(repository of the templates). Here, before insertion, we check whether the template is already present in the catalog are not and only unique ones are inserted. Then, we use KNN algorithm to get the 3 closest templates to the user requirements from the catalog and present them for the user. KNN uses the Euclidean distance to check for the closeness of the templates in the catalog and the user requirement. 
	We also use weights derived from user preferences using AHP while calculating the distance. Up on user selecting a template the deployment manager will deploy the resources on GENI.
	
c. Data Layer
	This layer is responsible for getting data from the MySQL tables and present it to the business layer. This layer handles all the database connections and other stuff.
