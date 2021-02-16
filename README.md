# dynv6-updater

## Purpose

This Docker Image is used to update all zones of a DYNv6 account with the current public IP. For example, if you are using several services behind a private router that are accessed via zones of Dynv6, this image resp. the included script helps to update all zones in one go. The script is executed every minute by time control. An update is performed if a new public IP address is detected.

## Advantages

This image offers the following advantages and additions compared to the original script approach:

- platform-independent execution as Docker Container
- use the update method recommended by Dynv6
- support for multiple zone updates
- time-controlled execution and updating
- update when the public IP address changes
- configuration via two Docker environment variables

## Notes

This image is for use in a private network behind a router. Make sure that the system running the container is used in the network segment that uses the intended public IP address. Especially for routers using split tunneling with e.g. VPN connections, this can lead to incorrect addresses under certain circumstances.

## Installation

A prepared image can be obtained from my Docker Hub: [https://hub.docker.com/r/rfuehrer/dynv6-updater](https://hub.docker.com/r/rfuehrer/dynv6-updater)

### Build

The image can be created with the following command:

```bash
docker build --pull -t dynv6/dynv6-updater .
```

### Run

After the image has been created, the container can be started with the following command. For the required environment variables, see boitte under `Configuration`.

```bash
docker run -e DYNV6_TOKEN="<token>" -e DYNV6_ZONES="<zones>" -d dynv6/dyn6-updater
```

## Configuration

To use this image, the following environment variables must be set:

```DYNV6_TOKEN=<token>```

Enter the token `<token>` for using the API here. You can find the token under `Account` -> `Keys` -> `HTTP Tokens` -> `Token` -> Button `Details`.

```DYNV6_ZONES=<zones>```

Enter the list of zones (`<zones>`) to be updated here. If several zones are to be updated, the list must be separated by commas. At least one fully qualified zone must be specified (Example: `myzone.dynv6.net` or `myzone1.dynv6.net,myzone2.dynv6.net`).

## Intended enhancements

The following functions are conceivable for later versions, but were not implemented due to current requirements and the time available. If you are interested in a further development, please write an issue or make a pull request with the appropriate enhancement:

- Verbose mode
- Reduction of the image
- Renouncement of the Python:3 image
- ...

## Credits

Appreciation to  

- [corny](https://gist.github.com/corny)
- [pulsar256](https://gist.github.com/pulsar256)
- [nephilim75](https://gist.github.com/nephilim75)
- [R. Fuehrer](https://github.com/rfuehrer)

whose adaptations and inspirations are included in the image and script. 

In reference to gists:

[https://gist.github.com/corny/7a07f5ac901844bd20c9](https://gist.github.com/corny/7a07f5ac901844bd20c9)
[https://gist.github.com/pulsar256/42313fcb2d3ae805805f](https://gist.github.com/pulsar256/42313fcb2d3ae805805f)

## Fork

Forked from [rfuehrer/dynv6-updater](https://github.com/rfuehrer/dynv6-updater).

## License

Licensed under MIT. See [LICENSE](LICENSE).
