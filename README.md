# About

This repository is a collection of CodeQL packs and other static analyses with the overarching goal of capturing and enforcing business requirements via static analysis.

Contrary to existing static analysis frameworks, which traditionally have been focusing on bug finding, type checking/linting, and compliance enforcement, codeography's goal
is to help teams shed light on their application ecosystem and enable them to

 - **Enforce business-mandated requirements**
 
    Sample usecases constitute:
    - Ensuring that only blessed APIs are used to talk to the database
    - Ensuring code changes do not break business-mandated requirements

 - **Map packages and services used**
  
    Sample usecases constitute:
    - What packages are being used and where?
    - What packages are business critical?
    - What PII data flows from the cloud to our databases?
    - Is there a deviation between our architecture diagrams and current codebase?
    
 - **Map code hotspots**
  
    Sample usecases constitute:
    - What parts of the codebase are the most bug-prone?
    - What code changes warrant a security review or pentest?
    
# Project Status

The codeography effort is still in its infancy. We are currently gathering requirements on features that the project ought to support, and welcome any feedback and contributions from the community
