rackspace_cloud - Lasso SDK for the Rackspace Cloud Files API
#############################################################

Read the article `rackspace_cloud - Lasso SDK for the Rackspace Cloud Files API
<http://www.stevepiercy.com/articles/rackspace_cloud-lasso-sdk-for-the-rackspace-cloud-files-api/>`_.

Introduction
============

Rackspace Cloud Files is one of over a dozen cloud services offered by
Rackspace on its cloud platform `OpenStack <http://www.openstack.org/>`_.
OpenStack was founded by Rackspace Hosting and NASA, and is now a global
collaboration of developers and cloud computing technologists producing the
ubiquitous open source cloud computing platform for public and private clouds.

The "cloud" is simply the virtualization of servers. It's marketing. Cloud
services reduce costs and provide reliable and fast service. When a hard drive
crashes or any other hardware issue arises, it is possible to remotely flip a
switch to redeploy your cloud server to another machine. The days of
babysitting hardware are over for developers, and we can get some much
deserved rest.

And when I say reduce costs, I mean `seriously reduce costs
<http://www.rackspace.com/cloud/public-pricing/#cloud-files>`_. At the time of
this writing, the first terabyte of data storage costs 10¢ per gigabyte per
month, and the first ten terabytes of bandwidth over content delivery network
(CDN) is 12¢ per gigabyte.

The Rackspace Cloud Files API has a very rich feature set. Through this API,
developers can interact with cloud storage services to manage, host, and serve
files, as well as upload, delete, and assign permissions.

As a side note, I have a particular fondness for Rackspace because they are a
huge contributor to free and open source software, especially with Python and
being a leader in the OpenStack platform. Additionally I provide `Rackspace
services <{filename}/pages/services.rst>`_ for my clients.

Description
===========

``rackspace_cloud`` is a type in Lasso 8 that allows a developer to send a
request to the Rackspace Identity API to request an authentication token. In
turn this token is used to send a second request to perform actions using the
Rackspace Cloud Files API. The response for reach request is either in JSON or
XML format, or the HTTP response headers are parsed.

You can `hire me <{filename}/pages/contact.rst>`_ or `send me a
GitTip <https://www.gittip.com/stevepiercy/>`_ to create a version for Lasso
9 or add features to the Lasso 8 version. You can create your own version and
`contribute it to the project
<https://github.com/stevepiercy/rackspace_cloud>`_. I have released the code
under a free and open source software license.

Demo
====

A demo file `rackspace_demo.lasso
<https://github.com/stevepiercy/rackspace_cloud/blob/master/rackspace_demo.lasso>`_
is available in the GitHub repo. Follow the installation instructions below to
install the ``rackspace_cloud`` Lasso type and its dependencies, then place
the demo file in your website and load it in a web browser.

There is no online demo available at this time.

Installation and Requirements
=============================

Requirements
------------

A `Rackspace Cloud account <https://cart.rackspace.com/cloud/>`_ is required.
Sign up is free, but service usage is charged accordingly.

A Rackspace Username and API Key are required for configuring the type
``rackspace_cloud``.

This type requires `shell
<http://www.lassosoft.com/tagswap/detail/shell>`_ and `response_localfolder
<http://www.lassosoft.com/tagswap/detail/response_localfolder/>`_.

Additionally the ``os_proccess`` module must be installed and configured.
Consult the `Lasso Professional 8.6 Language Guide
<http://www.lassosoft.com/usercontent/pdfs/Lasso_8.6_Setup_Guide.pdf>`_,
Chapter 38, `Process and Shell Support` for instructions.

Installation
------------

It is assumed that you have already satisfied or installed and configured the
above requirements.

Download or clone the `rackspace_cloud
<https://github.com/stevepiercy/rackspace_cloud>`_ type.

Edit the file ``rackspace_cloud.lasso`` to use your Rackspace Username and API
Key in the configuration settings, and save.

.. code-block:: lasso

    // Configure credentials to get an authentication token.
    local('credentials') = map(
        'username' = 'XXXXXXXXX',
        'apiKey' = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
        );

Install the file ``rackspace_cloud.lasso`` where you think is best. Either
place it in your Lasso Server's or Instances's ``LassoStartup`` directory,
restarting the appropriate scope as needed. I recommend Lasso Instance
``LassoStartup``.

At some point in the future, Rackspace might change its API endpoint URL. If
so, you can change this line.

.. code-block:: lasso

    // Rackspace API variables
    // configure according to:
    // http://docs.rackspace.com/files/api/v1/cf-devguide/content/Retrieving_Auth_Token.html
    local('auth_endpoint') = 'https://identity.api.rackspacecloud.com/v2.0/';

Usage
=====
Parameters
----------

The type ``rackspace_cloud`` accepts the following parameters. All parameters
are optional.

``auth_endpoint``
``container``
``data``
``http_method``
``mimeheaders``
``query_params``
``region``
``request``
``response_type``
``service_type``

Methods
-------

The type ``rackspace_cloud`` has the following methods.

``getAuthToken``
    Make a request to the Rackspace API to obtain an authentication token. If
    the response is successful, then the instance variable ``region`` is set
    and the method ``setAccess`` is called with the result. If the response
    fails, then the instance variable ``fault_map`` is set and becomes
    available to the developer for troubleshooting.

    Parameters:

* ``response_type`` represents the format in which the response will be
  returned. Although the Rackspace API supports JSON or XML, only JSON is
  supported at this time in this type. Default is JSON. Optional.
* ``service_type`` represents the service type in the `Rackspace service
  catalog <http://docs.rackspace.com/auth/api/v2.0/auth-client-devguide/content/Service_Types-d1e265.html>`_.
  If provided, ``service_type`` will be set as an instance variable and used
  in subsequent calls to the method ``setAccess``. Accepts a string type.
  Optional.

``getAuthFaults``
    Used internally by the method ``getAuthToken``. Parses the result from
    ``getAuthToken`` if the response fails. Sets an instance variable
    ``fault_map``, which is a map containing the element, message, and code
    of the HTTP response.

    Currently only a JSON response type decode to a Lasso map object is
    supported. When the XML response type is implemented, then this method
    must be modified accordingly.

    Parameter:

* ``result`` accepts a map type. Required.

``setAccess``
    Used internally by the method ``getAuthToken``. Parses a successful
    ``getAuthToken`` response. Sets instance variables for making calls to a
    specific Rackspace service type's endpoints in a specific geographic
    region. The available instance variables depend on the service type. The
    currently implemented instance variables are ``auth_token`` (using the
    authentication token from the result of ``getAuthToken``), ``region``
    (using the default region, none is provided), ``internalURL``,
    ``publicURL``, ``versionInfo``, ``versionList``, and ``versionId``.

    Parameter:

* ``result`` accepts any type. Required.

``getContainerDetailsListObjects``
    Gets container details and lists objects. Returns an array. See the
    Rackspace API documentation `"Show container details and list objects"
    <http://docs.rackspace.com/files/api/v1/cf-devguide/content/GET_listcontainerobjects_v1__account___container__containerServicesOperations_d1e000.html>`_.

    Parameters:

* ``container`` accepts a string type. Represents the name of the container on
  Rackspace cloud files. Optional.
* ``query_params`` accepts an array type. Used to filter the list of objects.
  If no query parameters are provided, then up to 10,000 names in the
  container may be returned. Each element in the array must be a pair, where
  the first element in the pair is the name of the parameter and the second
  element is its value. Optional.
* ``response_type`` accepts a string type. Represents the format in which the
  response will be returned. Although the Rackspace API supports JSON or XML,
  only JSON is supported at this time in this type. Default is JSON. Optional.

``getContainerCDNMetadata``
    Gets metadata for a CDN-enabled container. Returns a map of all the CDN
    metadata as well as the ``http_version``, ``http_response_code``, and
    ``http_response_message`` from the response.

    See the Rackspace API documentation `"List metadata for CDN-enabled container"
    <http://docs.rackspace.com/files/api/v1/cf-devguide/content/HEAD_retrieveCDNcontainermeta_v1__account___container__CDN_Container_Services-d1e2632.html>`_.

    Parameters:

* ``container`` accepts a string type. Represents the name of the container on
  Rackspace cloud files. Optional.

Examples
========

.. code-block:: lasso

    // initialize the type
    local('rax') = rackspace_cloudfiles();

    // get CDN container metadata
    #rax->getContainerCDNMetadata(-container='MyContainerName');

    // debugging code
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

.. code-block:: text

    =>
    map:
        (X-Log-Retention)=(False),
        (http_version)=(HTTP/1.1),
        (X-Trans-Id)=(txcbcb3c6810aa45c395de5-0053b97b14dfw1),
        (X-Cdn-Enabled)=(True),
        (X-Ttl)=(259200),
        (X-Cdn-Uri)=(http://XXXXXXXXXXXXXXXXXXXX-XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX.r7.cf1.rackcdn.com),
        (X-Cdn-Ssl-Uri)=(https://XXXXXXXXXXXXXXXXXXXX-XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX.ssl.cf1.rackcdn.com),
        (Content-Type)=(text/html; charset=UTF-8),
        (X-Cdn-Streaming-Uri)=(http://XXXXXXXXXXXXXXXXXXXX-XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX.r7.stream.cf1.rackcdn.com),
        (Content-Length)=(0),
        (http_response_code)=(204),
        (X-Cdn-Ios-Uri)=(http://XXXXXXXXXXXXXXXXXXXX-XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX.iosr.cf1.rackcdn.com),
        (http_response_message)=(No Content),
        (Date)=(Sun, 06 Jul 2014 16:36:36 GMT)

    auth_endpoint: https://identity.api.rackspacecloud.com/v2.0/
    auth_token: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    container: MyContainerName
    fault_map: map
    http_method:
    internalURL:
    mimeheaders: array: (pair: (Content-type)=(application/json))
    publicURL: https://cdn1.clouddrive.com/v1/MossoCloudFS_XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX
    query_params: array
    region: DFW
    request: json
    response_type: json
    service_type: rax:object-cdn
    tenantId: MossoCloudFS_XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX
    versionInfo:
    versionList:
    versionId:

.. code-block:: lasso

    // initialize the type
    local('rax') = rackspace_cloudfiles();

    // get CDN container metadata
    #rax->getContainerDetailsListObjects(
        -container='MyContainerName',
        -query_params=array('limit' = 3));

    // debugging code (same as above, omitted for brevity)

.. code-block:: text

    =>
    array:
        (map: (name)=(image_1.jpg),
            (last_modified)=(2014-06-30T15:38:54.407730),
            (content_type)=(image/jpeg),
            (hash)=(XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX),
            (bytes)=(4937)),
        (map: (name)=(image_2.jpg),
            (last_modified)=(2014-06-30T15:38:54.458260),
            (content_type)=(image/jpeg),
            (hash)=(XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX),
            (bytes)=(4534)),
        (map: (name)=(image_3.jpg),
            (last_modified)=(2014-06-30T15:38:54.436090),
            (content_type)=(image/jpeg),
            (hash)=(XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX),
            (bytes)=(2307))

    auth_endpoint: https://identity.api.rackspacecloud.com/v2.0/
    auth_token: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    container: MyContainerName
    fault_map: map
    http_method:
    internalURL: https://snet-storage101.dfw1.clouddrive.com/v1/MossoCloudFS_XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX
    mimeheaders: array: (pair: (Content-type)=(application/json))
    publicURL: https://cdn1.clouddrive.com/v1/MossoCloudFS_XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX
    query_params: array: (pair: (limit)=(3))
    region: DFW
    request: json
    response_type: json
    service_type: object-store
    tenantId: MossoCloudFS_XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX
    versionInfo:
    versionList:
    versionId:

From the above examples, you can construct the URL to display an image.

.. code-block:: lasso

    '<img src="' + #rax->getContainerCDNMetadata(-container='MyContainerName')->find('X-Cdn-Uri')
    + '/'
    + #rax->getContainerDetailsListObjects()->get(1)->find('name')
    + '">';

Additionally you can construct the URL to use HTTPS, use iOS, or stream a
file, particularly if it is a large file or audio or video.

Notes
=====

The project `rackspace_cloud <https://github.com/stevepiercy/rackspace_cloud>`_
and its source files are hosted on GitHub.

`curl documentation <http://curl.haxx.se/docs/manpage.html>`_

