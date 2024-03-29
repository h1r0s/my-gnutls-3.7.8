# Modifications to GnuTLS to build on Android.
# Copyright (C) 2023 Free Software Foundation, Inc.

# These modifications are part of GNU Emacs.

# GNU Emacs is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or (at
# your option) any later version.

# GNU Emacs is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with GNU Emacs.  If not, see <https://www.gnu.org/licenses/>.

LOCAL_PATH := $(call my-dir)

# Static libgnutls_alg module.
include $(CLEAR_VARS)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/../../gl $(LOCAL_PATH)/../includes \
  $(LOCAL_PATH)/.. $(LOCAL_PATH)/../unistring

# Import sources from Makefile.am.
libgnutls_alg_la_SOURCES = cert_types.c ciphers.c ciphersuites.c \
	ecc.c kx.c mac.c protocols.c publickey.c secparams.c sign.c \
	groups.c

LOCAL_SRC_FILES := $(call libgnutls_filter_sources,$(libgnutls_alg_la_SOURCES))
LOCAL_MODULE := libgnutls_alg
LOCAL_CFLAGS := $(libgnutls_common_CFLAGS)
LOCAL_SHARED_LIBRARIES := libtasn1
include $(BUILD_STATIC_LIBRARY)
