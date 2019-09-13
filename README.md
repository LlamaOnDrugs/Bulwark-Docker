# Bulwark-Docker

A collection of Dockerfiles and tools related to the [Bulwark](https://www.quantisnetcrypto.com) project.

## quantisnet

Creates a working quantisnet Linux64 node by installing quantisnetd/quantisnet-cli and setting up a user quantisnet with the needed configuration. Any parameters you add to the `run` command will be sent to quantisnetd as parameters. Also contains scripts for creating a compose file and setting up the entire Docker environment on an Ubuntu server.

## quantisnet-arm

The same as quantisnet, but for ARM processors.

## kovri

Sets up Kovri and configures a Bulwark service.

## tor

Sets up a TOR server and configures it for Bulwark.

## tor-alpine

Sets up a Tor server with Alpine Linux.
