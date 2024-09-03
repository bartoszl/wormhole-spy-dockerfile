# Use the specified image from the GitHub Container Registry
FROM ghcr.io/wormhole-foundation/guardiand:latest

# Set up the necessary environment variables
ENV NODE_KEY_PATH=/node.key
ENV SPY_RPC="[::]:7073"
ENV NETWORK_PATH=/wormhole/mainnet/2
ENV BOOTSTRAP_NODES='/dns4/wormhole-v2-mainnet-bootstrap.xlabs.xyz/udp/8999/quic/p2p/12D3KooWNQ9tVrcb64tw6bNs2CaNrUGPM7yRrKvBBheQ5yCyPHKC,/dns4/wormhole.mcf.rocks/udp/8999/quic/p2p/12D3KooWDZVv7BhZ8yFLkarNdaSWaB43D6UbQwExJ8nnGAEmfHcU,/dns4/wormhole-v2-mainnet-bootstrap.staking.fund/udp/8999/quic/p2p/12D3KooWG8obDX9DNi1KUwZNu9xkGwfKqTp2GFwuuHpWZ3nQruS1'

# Expose the port that the service will run on
EXPOSE 7073

# Set the entrypoint to the guardiand binary
ENTRYPOINT ["/guardiand"]

# Use a shell form for CMD to ensure environment variables are expanded
CMD sh -c "spy --nodeKey $NODE_KEY_PATH --spyRPC $SPY_RPC --network $NETWORK_PATH --bootstrap $BOOTSTRAP_NODES"

