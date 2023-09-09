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

A prepared image can be obtained from my [Docker Hub](https://hub.docker.com/r/madtracki/dynv6-updater).

### Build

The image can be created with the following command:

```bash
docker build . -t dynv6-updater
```

## Run

I recommend using `docker-compose`.
See example [docker-compose.yml](https://github.com/MadTracki/dynv6-updater/blob/dev/docker-compose.yml).
Adjust the environment variables to match your use case and then just start the image with `docker compose up -d`.

### Docker tags

<https://hub.docker.com/r/madtracki/dynv6-updater/tags>

| Tag      | Description                                                                                                                                                                    |
| -------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| latest   | This tag points to the latest version build from the latest commit that is tagged in git. See [releases](https://github.com/MadTracki/dynv6-updater/releases).               |
| _vX.Y.Z_ | There is a tag for each [release](https://github.com/MadTracki/dynv6-updater/releases).                                                                                      |

### Configuration

To use this image, the following environment variables are available:

| Variable                | Description                                                                                                                                                                                                                                       | Type       | Default value |
| ----------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------- | ------------- |
| DYNV6_TOKEN             | Enter the token for using the API here. You can find the token under `Account` -> `Keys` -> `HTTP Tokens` -> `Token` -> Button `Details`.                                                                                                         | _required_ |               |
| DYNV6_ZONES             | Enter the list of zones to be updated here. If several zones are to be updated, the list must be separated by commas. At least one fully qualified zone must be specified (Example: `myzone.dynv6.net` or `myzone1.dynv6.net,myzone2.dynv6.net`). | _required_ |               |
| DYNV6_NETWORK_DEVICE    | Enter the name of your network interface. You can find it with `ip a`.                                                                                                                                                                            | _required_ |               |
| DYNV6_IP_ADDRESS_FILTER | A string that is used with grep to filter the result of `ip -6 addr show "$DYNV6_NETWORK_DEVICE"`.                                                                                                                                                | optional   |               |
| DYNV6_USE_AUTO          | Calls the api with parameters set to `auto`.                                                                                                                                                                                                      | optional   | false         |

## Credits

Appreciation to

- [SaraSmith](https://github.com/SaraSmiseth/)
- [corny](https://gist.github.com/corny)
- [pulsar256](https://gist.github.com/pulsar256)
- [nephilim75](https://gist.github.com/nephilim75)
- [R. Fuehrer](https://github.com/rfuehrer)

whose adaptations and inspirations are included in the image and script.

In reference to gists:

[https://gist.github.com/corny/7a07f5ac901844bd20c9](https://gist.github.com/corny/7a07f5ac901844bd20c9)
[https://gist.github.com/pulsar256/42313fcb2d3ae805805f](https://gist.github.com/pulsar256/42313fcb2d3ae805805f)

## Fork

Forked from [SaraSmiseth/dynv6-updater](https://github.com/SaraSmiseth/dynv6-updater).

## License

Licensed under MIT. See [LICENSE](LICENSE).
