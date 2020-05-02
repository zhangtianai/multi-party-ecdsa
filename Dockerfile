FROM rustlang/rust:nightly as build
WORKDIR multi-party-ecdsa
COPY ./ ./
RUN cargo build --release --examples

cp target/release/examples/sm_manager .
cp target/release/examples/gg18_keygen_client .
cp target/release/examples/gg18_sign_client .

# FROM ubuntu:18.04
# WORKDIR multi-party-ecdsa
# COPY --from=build /multi-party-ecdsa/target/release/examples/sm_manager .
# COPY --from=build /multi-party-ecdsa/target/release/examples/gg18_keygen_client .
# COPY --from=build /multi-party-ecdsa/target/release/examples/gg18_sign_client .
# COPY --from=build /multi-party-ecdsa/ .

EXPOSE 8001 
