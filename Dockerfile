# Use the Wormhole Foundation Guardiand image
FROM ghcr.io/wormhole-foundation/guardiand:latest

RUN echo "GUARDIAN_ENV is set to ${GUARDIAN_ENV}"

# Set the entrypoint to the guardiand binary
ENTRYPOINT ["/guardiand"]

# Set the CMD to use the environment variable for --env
CMD ["spy", "--nodeKey", "/node.key", "--spyRPC", "[::]:7073", "--env", "${GUARDIAN_ENV}"]

# Expose the port
EXPOSE 7073
