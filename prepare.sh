#!/bin/bash

CP="/bin/cp"
PT="secp256k1/Classes/secp256k1"

$CP "$PT/src/modules/ecdh/main_impl.h" "$PT/src/ecdh_main_impl.h"
$CP "$PT/src/modules/recovery/main_impl.h" "$PT/src/recovery_main_impl.h"

sed -i".bak" 's,#include "include/,#include ",g' \
    "$PT/src/secp256k1.c" \
    "$PT/src/ecdh_main_impl.h" \
    "$PT/src/recovery_main_impl.h"

sed -i".bak" 's,modules/ecdh/main_impl.h,ecdh_main_impl.h,g' "$PT/src/secp256k1.c"
sed -i".bak" 's,modules/recovery/main_impl.h,recovery_main_impl.h,g' "$PT/src/secp256k1.c"
