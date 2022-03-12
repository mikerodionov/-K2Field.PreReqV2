# Prerequisites Information from official product documentation

[Prerequisites List from official K2 5.5 documentation](https://help.nintex.com/en-US/k2five/icg/5.5/default.htm#Plan/WinSvrRolesFeatures.htm?tocpath=Prepare|Supporting%20Components%20Configuration|_____9)

| Role             | Role Service/Feature               | Feature Category        | Sub Feature                 | Name Server 2019          |
|------------------|------------------------------------|-------------------------|-----------------------------|---------------------------|
| Web Server (IIS) | Web Server                         | Common HTTP Features    | Default Document            | Web-Default-Doc           |
| Web Server (IIS) | Web Server                         | Common HTTP Features    | HTTP Errors                 | Web-Http-Errors           |
| Web Server (IIS) | Web Server                         | Common HTTP Features    | HTTP Redirection            | Web-Http-Redirect         |
| Web Server (IIS) | Web Server                         | Common HTTP Features    | Static Content              | Web-Static-Content        |
| Web Server (IIS) | Web Server                         | Performance             | Dynamic Content Compression | Web-Dyn-Compression       |
| Web Server (IIS) | Web Server                         | Performance             | Static Content Compression  | Web-Static-Content        |
| Web Server (IIS) | Web Server                         | Security                | Request Filtering           | Web-Filtering             |
| Web Server (IIS) | Web Server                         | Security                | URL Authorization           | Web-Url-Auth              |
| Web Server (IIS) | Web Server                         | Security                | Windows Authentication      | Web-Windows-Auth          |
| Web Server (IIS) | Web Server                         | Application Development | .Net Extensibility 3.5      | Web-Net-Ext               |
| Web Server (IIS) | Web Server                         | Application Development | .Net Extensibility 4.7      | Web-Net-Ext45             |
| Web Server (IIS) | Web Server                         | Application Development | Application Initialization  | Web-AppInit               |
| Web Server (IIS) | Web Server                         | Application Development | ISAPI Extensions            | Web-ISAPI-Ext             |
| Web Server (IIS) | Web Server                         | Application Development | ISAPI Filters               | Web-ISAPI-Filter          |
| Web Server (IIS) | Web Server                         | Application Development | ASP                         | Web-ASP                   |
| Web Server (IIS) | Web Server                         | Application Development | ASP.NET 3.5                 | Web-Asp-Net               |
| Web Server (IIS) | Web Server                         | Application Development | ASP.NET 4.7                 | Web-Asp-Net45             |
| Web Server (IIS) | Web Server                         | Management Tools        | IIS Management Console      | Web-Mgmt-Console          |
| Web Server (IIS) | Web Server                         | Management Tools        | Management Service          | Web-Mgmt-Service          |
|                  | .NET Framework 3.5 Features        |                         | HTTP Activation             | NET-HTTP-Activation       |
|                  | .NET Framework 4.7 Features        |                         | .NET Framework 4.7          | NET-Framework-45-Core     |
|                  | .NET Framework 4.7 Features        |                         | .ASP.NET 4.7                | NET-Framework-45-ASPNET   |
|                  | .NET Framework 4.7 Features        |                         | .WCF Services               | NET-WCF-Services45        |
|                  | .NET Framework 4.7 Features        |                         | .HTTP Activation            | NET-WCF-HTTP-Activation45 |
|                  | Windows Process Activation Service |                         | .NET Environment            | WAS-NET-Environment       |
|                  | Windows Process Activation Service |                         | Configuration APIs          | WAS-Config-APIs           |
|                  | Windows Process Activation Service |                         | Process Model               | WAS-Process-Model         |

# Prerequisites installed by this script

Features to be installed by this script should depend on K2 (e.g. MSMQ is only required for older version) version and sometimes Windows version (e.g. Application Server role deprecated in Windows Server 2012 R2). Current implementation will be extended to detect K2 and Windows Server versions and K2 version and install required prerequisites list.

## Windows Server 2012R2/2016/2019 + K2 Five switch

* Starting from K2 5.0 MSMQ is replaced with an internal K2 queue (Memory Queue) which persists through server crash - we will not install MSMQ
* Windows Server 2012 has Application Server role deprecated in 2012R2 - we will factor this in

| FeatureName               | FeatureCategory                    | FeatureDisplayName          |
|---------------------------|------------------------------------|-----------------------------|
| Web-Default-Doc           | Common HTTP Features               | Default Document            |
| Web-Http-Errors           | Common HTTP Features               | HTTP Errors                 |
| Web-Http-Redirect         | Common HTTP Features               | HTTP Redirection            |
| Web-Static-Content        | Common HTTP Features               | Static Content              |
| Web-Dyn-Compression       | Performance                        | Dynamic Content Compression |
| Web-Static-Content        | Performance                        | Static Content Compression  |
| Web-Filtering             | Security                           | Request Filtering           |
| Web-Url-Auth              | Security                           | URL Authorization           |
| Web-Windows-Auth          | Security                           | Windows Authentication      |
| Web-Net-Ext               | Application Development            | .Net Extensibility 3.5      |
| Web-Net-Ext45             | Application Development            | .Net Extensibility 4.7      |
| Web-AppInit               | Application Development            | Application Initialization  |
| Web-ISAPI-Ext             | Application Development            | ISAPI Extensions            |
| Web-ISAPI-Filter          | Application Development            | ISAPI Filters               |
| Web-ASP                   | Application Development            | ASP                         |
| Web-Asp-Net               | Application Development            | ASP.NET 3.5                 |
| Web-Asp-Net45             | Application Development            | ASP.NET 4.7                 |
| Web-Mgmt-Console          | Management Tools                   | IIS Management Console      |
| Web-Mgmt-Service          | Management Tools                   | Management Service          |
| NET-HTTP-Activation       | .NET Framework 3.5 Features        | HTTP Activation             |
| NET-Framework-45-Core     | .NET Framework 4.7 Features        | .NET Framework 4.7          |
| NET-Framework-45-ASPNET   | .NET Framework 4.7 Features        | .ASP.NET 4.7                |
| NET-WCF-Services45        | .NET Framework 4.7 Features        | .WCF Services               |
| NET-WCF-HTTP-Activation45 | .NET Framework 4.7 Features        | .HTTP Activation            |
| WAS-NET-Environment       | Windows Process Activation Service | .NET Environment            |
| WAS-Config-APIs           | Windows Process Activation Service | Configuration APIs          |
| WAS-Process-Model         | Windows Process Activation Service | Process Model               |

## Windows Server 2012 + K2 Five Switch

K2 5.0 - 5.2 Supports windows Server 2012
* Starting from K2 5.0 MSMQ is replaced with an internal K2 queue (Memory Queue) which persists through server crash - we will not install MSMQ
* Windows Server 2012 has Application Server role deprecated in 2012R2 - we will factor this in

| FeatureName               | FeatureCategory                    | FeatureDisplayName          |
|---------------------------|------------------------------------|-----------------------------|
| Web-Default-Doc           | Common HTTP Features               | Default Document            |
| Web-Http-Errors           | Common HTTP Features               | HTTP Errors                 |
| Web-Http-Redirect         | Common HTTP Features               | HTTP Redirection            |
| Web-Static-Content        | Common HTTP Features               | Static Content              |
| Web-Dyn-Compression       | Performance                        | Dynamic Content Compression |
| Web-Static-Content        | Performance                        | Static Content Compression  |
| Web-Filtering             | Security                           | Request Filtering           |
| Web-Url-Auth              | Security                           | URL Authorization           |
| Web-Windows-Auth          | Security                           | Windows Authentication      |
| Web-Net-Ext               | Application Development            | .Net Extensibility 3.5      |
| Web-Net-Ext45             | Application Development            | .Net Extensibility 4.7      |
| Web-AppInit               | Application Development            | Application Initialization  |
| Web-ISAPI-Ext             | Application Development            | ISAPI Extensions            |
| Web-ISAPI-Filter          | Application Development            | ISAPI Filters               |
| Web-ASP                   | Application Development            | ASP                         |
| Web-Asp-Net               | Application Development            | ASP.NET 3.5                 |
| Web-Asp-Net45             | Application Development            | ASP.NET 4.7                 |
| Web-Mgmt-Console          | Management Tools                   | IIS Management Console      |
| Web-Mgmt-Service          | Management Tools                   | Management Service          |
| NET-HTTP-Activation       | .NET Framework 3.5 Features        | HTTP Activation             |
| NET-Framework-45-Core     | .NET Framework 4.7 Features        | .NET Framework 4.7          |
| NET-Framework-45-ASPNET   | .NET Framework 4.7 Features        | .ASP.NET 4.7                |
| NET-WCF-Services45        | .NET Framework 4.7 Features        | .WCF Services               |
| NET-WCF-HTTP-Activation45 | .NET Framework 4.7 Features        | .HTTP Activation            |
| WAS-NET-Environment       | Windows Process Activation Service | .NET Environment            |
| WAS-Config-APIs           | Windows Process Activation Service | Configuration APIs          |
| WAS-Process-Model         | Windows Process Activation Service | Process Model               |

## Windows Server 2012R2/2016 + K2 Legacy Switch

K2 4.7 supports Windows Server 2012/2012R2/2016
* K2 4.7 Uses MSMQ - we will install this
* Application Server role deprecated in 2012R2 - we will factor this in

| FeatureName               | FeatureCategory                    | FeatureDisplayName            |
|---------------------------|------------------------------------|-------------------------------|
| Web-Default-Doc           | Common HTTP Features               | Default Document              |
| Web-Http-Errors           | Common HTTP Features               | HTTP Errors                   |
| Web-Http-Redirect         | Common HTTP Features               | HTTP Redirection              |
| Web-Static-Content        | Common HTTP Features               | Static Content                |
| Web-Dyn-Compression       | Performance                        | Dynamic Content Compression   |
| Web-Static-Content        | Performance                        | Static Content Compression    |
| Web-Filtering             | Security                           | Request Filtering             |
| Web-Url-Auth              | Security                           | URL Authorization             |
| Web-Windows-Auth          | Security                           | Windows Authentication        |
| Web-Net-Ext               | Application Development            | .Net Extensibility 3.5        |
| Web-Net-Ext45             | Application Development            | .Net Extensibility 4.7        |
| Web-AppInit               | Application Development            | Application Initialization    |
| Web-ISAPI-Ext             | Application Development            | ISAPI Extensions              |
| Web-ISAPI-Filter          | Application Development            | ISAPI Filters                 |
| Web-ASP                   | Application Development            | ASP                           |
| Web-Asp-Net               | Application Development            | ASP.NET 3.5                   |
| Web-Asp-Net45             | Application Development            | ASP.NET 4.7                   |
| Web-Mgmt-Console          | Management Tools                   | IIS Management Console        |
| Web-Mgmt-Service          | Management Tools                   | Management Service            |
| NET-HTTP-Activation       | .NET Framework 3.5 Features        | HTTP Activation               |
| NET-Framework-45-Core     | .NET Framework 4.7 Features        | .NET Framework 4.7            |
| NET-Framework-45-ASPNET   | .NET Framework 4.7 Features        | .ASP.NET 4.7                  |
| NET-WCF-Services45        | .NET Framework 4.7 Features        | .WCF Services                 |
| NET-WCF-HTTP-Activation45 | .NET Framework 4.7 Features        | .HTTP Activation              |
| WAS-NET-Environment       | Windows Process Activation Service | .NET Environment              |
| WAS-Config-APIs           | Windows Process Activation Service | Configuration APIs            |
| WAS-Process-Model         | Windows Process Activation Service | Process Model                 |
| MSMQ-Server               | Message Queuing Services           | Message Queuing Server        |
| MSMQ-Directory            | Message Queuing Services           | Directory Service Integration |

## Windows Server 2012 + K2 Legacy Switch

K2 4.7 supports Windows Server 2012/2012R2/2016
* K2 4.7 Uses MSMQ - we will install this
* Application Server role deprecated in 2012R2 - we will factor this in

| FeatureName               | FeatureCategory                    | FeatureDisplayName            |
|---------------------------|------------------------------------|-------------------------------|
| Web-Default-Doc           | Common HTTP Features               | Default Document              |
| Web-Http-Errors           | Common HTTP Features               | HTTP Errors                   |
| Web-Http-Redirect         | Common HTTP Features               | HTTP Redirection              |
| Web-Static-Content        | Common HTTP Features               | Static Content                |
| Web-Dyn-Compression       | Performance                        | Dynamic Content Compression   |
| Web-Static-Content        | Performance                        | Static Content Compression    |
| Web-Filtering             | Security                           | Request Filtering             |
| Web-Url-Auth              | Security                           | URL Authorization             |
| Web-Windows-Auth          | Security                           | Windows Authentication        |
| Web-Net-Ext               | Application Development            | .Net Extensibility 3.5        |
| Web-Net-Ext45             | Application Development            | .Net Extensibility 4.7        |
| Web-AppInit               | Application Development            | Application Initialization    |
| Web-ISAPI-Ext             | Application Development            | ISAPI Extensions              |
| Web-ISAPI-Filter          | Application Development            | ISAPI Filters                 |
| Web-ASP                   | Application Development            | ASP                           |
| Web-Asp-Net               | Application Development            | ASP.NET 3.5                   |
| Web-Asp-Net45             | Application Development            | ASP.NET 4.7                   |
| Web-Mgmt-Console          | Management Tools                   | IIS Management Console        |
| Web-Mgmt-Service          | Management Tools                   | Management Service            |
| NET-HTTP-Activation       | .NET Framework 3.5 Features        | HTTP Activation               |
| NET-Framework-45-Core     | .NET Framework 4.7 Features        | .NET Framework 4.7            |
| NET-Framework-45-ASPNET   | .NET Framework 4.7 Features        | .ASP.NET 4.7                  |
| NET-WCF-Services45        | .NET Framework 4.7 Features        | .WCF Services                 |
| NET-WCF-HTTP-Activation45 | .NET Framework 4.7 Features        | .HTTP Activation              |
| WAS-NET-Environment       | Windows Process Activation Service | .NET Environment              |
| WAS-Config-APIs           | Windows Process Activation Service | Configuration APIs            |
| WAS-Process-Model         | Windows Process Activation Service | Process Model                 |
| MSMQ-Server               | Message Queuing Services           | Message Queuing Server        |
| MSMQ-Directory            | Message Queuing Services           | Directory Service Integration |

