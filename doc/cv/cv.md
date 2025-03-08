---
pagetitle: Nick Mazurkin – cv
---

# Nick Mazurkin — Software Engineer, Team Lead, Staff Engineer

**New York City, USA**, greencard, [+13477203170](tel:+13477203170), [career@mazurk.in](mailto:career@mazurk.in), [LinkedIn](https://www.linkedin.com/in/mazurkin/), [GitHub](https://github.com/mazurkin/), [Resume](https://mazurk.in/#resume)

**Java**, **Python**, **Web**, **DB**, **No-SQL**, **Linux**, **ML**, **AI**, **Cloud**, **K8S**

Software development professional with years of experience crafting
web applications and backend services using Java and Python. I am skilled in search and machine
learning technologies, web technologies, application architecture, database design,
and Linux system administration.

# Experience

## PulsePoint, New York, USA

[PulsePoint.com](https://www.pulsepoint.com/), AdTech, OpenRTB Exchange, DSP, DMP

Java · Spring Framework · Project Reactor · Lucene · JUnit · Jetty · Netty · Disruptor · Ant · Maven ·
Linux · Kubernetes · Docker · Graphite · Graphana · Kibana · Prometheus · Git ·
Python · Jupyter · Jupyter · NumPy · Scikit-Learn · Luigi · ETL
Redis · Cassandra · Hive · No-SQL · Presto · Vertica ·
AWS S3 · AWS EC · AWS SageMaker · Google Cloud BigQuery · Google Cloud Storage ·
Algorithms · Algorithm Design · Data Structures ·
Machine Learning Algorithms · Real-Time Bidding (RTB) ·
Multi-Threading · Concurrency

###  Director, Data Science and Engineering team (Apr 2020 — Mar 2025)

Led a team of 6 data scientists and 3 Java/Python engineers (DSE) working across 5 time zones, responsible
for planning, performance tracking, coordination, and agile management. Proven ability to lead and mentor teams,
manage projects, and deliver results on time and within budget.

- Successfully delivered 3 new internal services and 5 new ML models as a team leader.
- Successfully completed 20 quarterly plans with the team in research, development, and deployment.
- Successfully migrated DSE projects to the new data center.
- Provided interviewing, on-boarding, and mentoring for new team members.
- Successfully coordinated and communicated with other teams and team leaders on numerous projects.
- Successfully maintained an iterative Agile framework, including scrum, retrospectives, and prioritization of tasks.

### Senior Software Engineer with Expertise in Java, Python, and ML (Feb 2019 — present, full-time employee)
### Senior Software Engineer with Expertise in Java, Python, and ML (Feb 2017 — 2019, full-time contractor)

Experienced software engineer with a proven track record of developing and deploying high-performance applications
using Java, Python, ML, Linux, and web technologies. Expertise in building and scaling distributed systems,
implementing machine learning models, and optimizing performance for large-scale data processing.

- Developed an asynchronous web crawler/fetcher for /ads.txt and /app-ads.txt web resources,
providing and enhancing transparency and trust for the SSP and DSP partners of our Exchange platform
(processing ~500K domains daily, Java, Spring, Netty).
- Developed a supply prediction system for RTB traffic, enabling clients to switch to a cheaper self-serving platform
(processing 24M documents daily using Lucene, Spring Framework and ML/CatBoost).
- Implemented a scoring model to effectively throttle proxy processing of incoming supply, selecting only 20% of
the most profitable RTB requests and blocking 80% of the least profitable supply. This resulted in a 50% reduction
in the number of required servers.
- Designed and implemented a DMP platform using asynchronous Java, gRPC, Cassandra, and Redis. This platform provides
the effective solutions for targeting and optimization algorithms, accessing 30 billion entities with a p99 latency of
5ms and a p50 latency of 1ms.
- Developed a standalone service for domain attribution, enabling efficient domain and application bundle
targeting (achieving 100k/sec QPS using gRPC and REST).
- Developed a client-side balancing library using the JSQ algorithm and circuit-breakers, significantly
reducing client-server communication latency from p95=6ms to p95=1ms.
- Containerized and deployed a cluster of DoubleVerify service instances, achieving 300k/sec QPS in peak. Implemented
custom client-side balancing and a low-latency custom client-to-cluster connection HTTP/REST library, enabling faster
and easier deployments with efficient access.
- Developed a dockerized test infrastructure for custom configuration of Redis and Cassandra, similar to TestContainers,
which facilitated the execution of integration tests.
- Developed a hierarchy of docker images for ~20 projects written in Python, Java, and Jupyter, significantly reducing
the time required to create new projects.
- Developed an audience builder for 15 audiences, enabling our client to target very specific audiences with focus
either on volume or accuracy (using Luigi, Hive, and ETL).
- Successfully resolved 2-3 support issues daily as part of a periodical 3rd-line technical on-call support rotation.
- Implemented several dozen RTB changes in the application stack, including improvements, new features, deployments,
fixes, and monitoring (using Java, Netty, and Linux).
- Developed an engine for internal reports with embedded alerting, enabling transparent and quick monitoring of
important pipelines and services (using Python, Hive, Impala, and Jupyter). Created 6 internal engineering reports.
- Implemented 7 ETL pipelines in Python using Luigi, Docker, Hive, and Presto.
- Improved video-completion rate model by making it more accurate and stable (Python, Scikit-learn)
- Implemented and delivered to production the look-alike audience model (Python, Catboost, Luigi, K8S)
- Developed a model to predict the quality of NPI attribution, enabling clients to select the confidence level
for HCP targeting.
- Developed a model to predict the quality of ICD10 attribution based on obfuscated and aggregated clean-room
prescription data, enabling clients to select DTC audiences based on condition probability.
- Developed a secure facade to access and process obfuscated clean-room data, providing
a secure and efficient interface to private data (Python, Flask, Gunicorn, Google Cloud API).
- Implemented and delivered the gender prediction model (Python, Sklearn)

## Deutsche Bank

[Deutsche Bank Technology Center](https://careers.db.com/explore-the-bank/careers-in-technology/), Moscow, RU

### Senior Software Java Engineer, AVP (Jun 2016 — Feb 2017)

Java · Linux · Spring Framework · Angular · Solace · KDB

- Implemented several new algorithms, code and concurrency improvements to the dbCAP project achieving
the required performance of the solution (exchange events messaging on Solace System message broker, KDB+, java).
- Successfully implemented the test suite for the legacy projects allowing to extend the life-time and reliability of
the legacy projects (process control, runtime log analyzers, TeamCity, environment settings).
- Improved the internal messaging framework based on Solace Systems message broker (achieved up to 160000 messages/sec
stored reliably to the disk), introduced solutions for the performance metering.
- Designed and implemented the multithreaded and garbage-less algorithms and structures (Java)
for message acknowledgement in complex environments to provide effective processing without long GC pauses.
- Implemented a modern front-end build toolchain for the legacy project, added the required UI features for the project
(Angular 2, NPM, RxJs, TypeScript, TSLint, System.js, Rollup, jQuery, Bootstrap).

## OK.ru

[OK.ru](https://ok.ru), Moscow, RU, the one of the largest social networks (54 MAU)

### Senior Software Java Developer (Oct 2012 — May 2016)

Java · Linux · Lucene · Cassandra · Kafka · Spring Framework · jQuery · ML · LVS

- Implemented a multiple features in the searching infrastructure of the OK.ru service: backend services, data storages,
relevancy customization, indexation, replication (Apache Lucene, Spring Framework, Web Services, SQL/noSQL, Linux)
- Fixed multiple legacy issues in L12N infrastructure for the OK.ru service including the resources editor,
Java frameworks and workflow process, achieved resource propagation to ~2000 servers.
- Make significant contribution to the moderation and antispam services, architecture and implementation,
implemented NSFW detector, spam detector (based on naive bayes detector),
UGC filter cluster (near real-time voting-quorum service).
- Successfully designed, implemented and run the MVP for the startup project (Tinder-alike) in very short time (3 months),
created the architecture of the service including SOA, custom search service, asynchronous binary client protocol,
push service (GCM), photo uploading/processing/distribution service, statistics and analytics
(apache netty, apache cassandra, kafka, queues, messaging, mobile apps, python, machine learning).

## Internet Lotto Ltd

The social network, Yoshkar-Ola, RU

### Team lead, Software developer (Sep 2008 — Jun 2010)

Java · J2EE · Linux · Nginx · Apache HTTPd · Apache Tomcat · Apache ActiveMQ · Terracotta · MySQL ·
Spring Core · Spring WS · Spring WebFlow · Spring Modules · Spring AOP · Sphinx · EhCache · Quartz ·
iBatis · Velocity · JSP&JSTL · JMX · DWR · JUnit · EasyMock · Apache Lucene/Solr · Apache Ant ·
JScript · jQuery · jQuery UI · Amazon S3 · Jetty · ImageMagick · MEncoder

- Architecture and implementation of social network for poker players
- Coding
- Database design and administration (MySQL)
- Transparent integration with payment system moneta.ru
- Integration with poker rooms (statistics, promo links)
- Team management (2 members)

## Moneta.ru

[Moneta.ru](https://www.moneta.ru), Yoshkar-Ola, RU, the online financial service

### Software developer (Mar 2007 — Sep 2008)

Payment/billing system «moneta.ru»

Java · J2EE · ORACLE & PL/SQL · Spring Core · Spring WebFlow · XSLT

- Database schema design and implementation
- Stored procedures implementation and meta-data management
- DAO layer implementation
- Unit and integration test suites

## Chromatec SCB LLC

[Chromatec.ru](https://chromatec.ru/), Yoshkar-Ola, RU, the gas chromatography equipment and software manufacturer

### Team lead, Software Developer, Electronics Engineer (1996 — 2007)

Delphi · Borland C/C++ · MS C/C++ · XML/XSLT · Firebird SQL Server · MS Access · MS Visual Basic ·
Win32 API · CVS · ASM · i8051

- Desktop software for chemical industry working with hardware devices
- Digital electronic systems on i8051 architecture (schemes, printboards, software)
- Real-time embedded i8051-software with C and Assembler.

# Open Source projects

## net-crusher (2016)

TCP/UDP proxy library for automated and manual connectivity testing (used by RabbitMQ, Aerospike, Terracotta), more:
[project](https://netcrusherorg.github.io/netcrusher-java/),
[sources](https://github.com/NetCrusherOrg/netcrusher-java),
[usages](https://mvnrepository.com/artifact/com.github.netcrusherorg/netcrusher-core/usages)

## protobuf (2016)

Performance fix for the protobuf java compiler: [pull request](https://github.com/protocolbuffers/protobuf/pull/2121)

# Education

## Mari State Technical University (1994 — 1999)

Yoshkar-Ola, Russia, "Computing machines, complexes, systems, and networks",
Engineer (with honors, equivalent to a master's degree)

## Mari State University (2002 — 2003)

Yoshkar-Ola, Russia, «Anti-Crisis Management»,
Anti-Crisis Manager

## Additional

- 2024, Generative AI for Everyone, [Coursera](https://coursera.org/share/74724d743c380af897ad163fd16f89db)
- 2024, Generative AI with Large Language Models, [Coursera](https://coursera.org/share/5dca9e0666132a0ff98b14f1acdeb32a)
- 2020, Become a Manager, [LinkedIn](https://www.linkedin.com/learning/certificates/d26b46e09f65655bda807fc6ce379d231df2076aba8e1ce9d68a025a6e3711e1?trk=backfilled_certificate)
- 2016, Codility Golden Award (Vanadium 2016), [Codility](https://codility.com/cert/view/certWVTNF2-7593GUVGAGTT8AUV/)
- 2016, Algorithms: Design and Analysis, Part 2, [Coursera](https://coursera.org/share/e85aae969dc398475e574461cbac1cd4)
- 2016, Algorithms: Design and Analysis, Part 1, [Coursera](https://coursera.org/share/518037fb71bdc9259b515db2f6c8d8a8)
- 2016, Economics for non-economists, [Coursera](https://www.coursera.org/account/accomplishments/verify/M3M4APSPYAGQ)
- 2016, Game Theory, [Coursera](https://www.coursera.org/account/accomplishments/verify/LSS824H8VYMT)
- 2016, Machine Learning, [Coursera](https://www.coursera.org/account/accomplishments/verify/W3H4WHCLNQNA)
- 2016, An introduction to machine learning, [Coursera](https://www.coursera.org/account/accomplishments/verify/FB5GRZN38NVJ)

# Resume

The latest and the most detailed resume can be downloaded in different document formats at [https://mazurk.in](https://mazurk.in/#resume)

<img class="qr_resume" src="../../i/qr/resume.svg" alt="https://mazurk.in/#resume"/>
