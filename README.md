# Bangkit-C22-PS353-CloudComputing
Repository for Cloud Computing Team

**CLOUD COMPUTING**

First, we create the database schema in local Mysql workbench, with a few tables in it :
![image](https://user-images.githubusercontent.com/99556251/173281531-c180f4bf-5393-4878-ad2f-59090f1e3526.png)

Then we store the database to the Cloud Storage Bucket and import it to Sql instance MySQL Type : 
![image](https://user-images.githubusercontent.com/99556251/173295193-38255960-a3c6-4d54-802a-6e6880f114f4.png)

Second, we build an API using Node.js :
(ss nodejsnya)

before deploy it on GCP, we test it on local first. The API is then deployed using APP Engine:
(ss deploy app engine nya)

Lastly, we used the Vertex AI to deploy machine learning model and deploy the model into Endpoint, which gonna used it to build batch prediction.
(ss)
