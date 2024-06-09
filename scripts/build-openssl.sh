#!/bin/bash

cd lib/openssl

export PATH=/usr/bin:/usr/aarch64-linux-gnu:$PATH

if [ "$1" = "shared" ]; then
    if [ ! -f "libcrypto.so" ] || [ ! -f "libssl.so" ]; then
        # configure OpenSSL
        ./Configure linux-aarch64 -fPIC shared --release --cross-compile-prefix=aarch64-linux-gnu-

        # build OpenSSL
        make -j$(nproc)
    fi
elif [ "$1" = "no-shared" ]; then
    if [ ! -f "libcrypto.a" ] || [ ! -f "libssl.a" ]; then
        # configure OpenSSL
        ./Configure linux-aarch64 -fPIC no-shared --release --cross-compile-prefix=aarch64-linux-gnu-   

        # build OpenSSL
        make -j$(nproc)
    fi
fi
