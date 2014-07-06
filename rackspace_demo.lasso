<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<title>Rackspace Cloud Files Demo</title>
</head>
<body>

<h1>Rackspace Cloud Files Demo</h1>
<h2>Instructions</h2>

<p>
<a href="http://www.stevepiercy.com/articles/">Follow installation instructions</a> to install the file <code>rackspace_cloud.lasso</code> and its dependencies.
</p>

<p>
Place this file in a web serving directory and load its URL.
</p>

<hr />

[
date;
'<br>';
'<br>';

local('rax') = rackspace_cloudfiles(
//    -service_type='object-store'
    );
#rax->getContainerCDNMetadata(-container='test')->find('X-Cdn-Uri');
'<br>';
#rax->getContainerDetailsListObjects()->get(1)->find('name');

'<br>';
'<br>';
'<strong>auth_endpoint:</strong> ' + #rax->'auth_endpoint';
'<br>';
'<strong>auth_token:</strong> ' + #rax->'auth_token';
'<br>';
'<strong>container:</strong> ' + #rax->'container';
'<br>';
'<strong>fault_map:</strong> ' + #rax->'fault_map';
'<br>';
'<strong>http_method:</strong> ' + #rax->'http_method';
'<br>';
'<strong>internalURL:</strong> ' + #rax->'internalURL';
'<br>';
'<strong>mimeheaders:</strong> ' + #rax->'mimeheaders';
'<br>';
'<strong>publicURL:</strong> ' + #rax->'publicURL';
'<br>';
'<strong>query_params:</strong> ' + #rax->'query_params';
'<br>';
'<strong>region:</strong> ' + #rax->'region';
'<br>';
'<strong>request:</strong> ' + #rax->'request';
'<br>';
'<strong>response_type:</strong> ' + #rax->'response_type';
'<br>';
'<strong>service_type:</strong> ' + #rax->'service_type';
'<br>';
'<strong>tenantId:</strong> ' + #rax->'tenantId';
'<br>';
'<strong>versionInfo:</strong> ' + #rax->'versionInfo';
'<br>';
'<strong>versionList:</strong> ' + #rax->'versionList';
'<br>';
'<strong>versionId:</strong> ' + #rax->'versionId';
'<br>';

'<img src="' + #rax->getContainerCDNMetadata(-container='test')->find('X-Cdn-Uri')
+ '/'
+ #rax->getContainerDetailsListObjects()->get(1)->find('name')
+ '">';

/* 
'<textarea rows="15" cols="80">';
shell('curl -i -X HEAD https://cdn1.clouddrive.com/v1/MossoCloudFS_XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/test -H "X-Auth-Token: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
');
'</textarea>';

 */

/* 

curl -i https://storage101.dfw1.clouddrive.com/v1/XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/test -d format=json -d limit=5 -H "X-Auth-Token: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

curl -i https://storage101.dfw1.clouddrive.com/v1/XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -d format=json -d limit=5 -H "X-Auth-Token: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

curl https://cdn1.clouddrive.com/v1/MossoCloudFS_XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/test -I -H "X-Auth-Token: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
 */
]
</body>
</html>
