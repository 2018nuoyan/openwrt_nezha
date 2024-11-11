# zPonds <admin@shinenet.cn>

include $(TOPDIR)/rules.mk

PKG_NAME:=frpc
PKG_VERSION:=latest
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
	SECTION:=net
	CATEGORY:=Network
	TITLE:=A fast reverse proxy to help you expose a local server to the internet
	URL:=https://github.com/fatedier/frp
endef

define Package/$(PKG_NAME)/description
frpc is a client of frp, a fast reverse proxy to help you expose a local server to the internet.
endef

# 禁止 OpenWrt 对二进制文件进行 strip
STRIP:=true

# 根据 OpenWrt 架构定义对应的 frpc 二进制文件架构
ifeq ($(ARCH),i386)
	PKG_ARCH_FRPC:=386
endif

ifeq ($(ARCH),x86_64)
	PKG_ARCH_FRPC:=amd64
endif

ifeq ($(ARCH),mipsel)
	PKG_ARCH_FRPC:=mipsle
endif

ifeq ($(ARCH),mips)
	PKG_ARCH_FRPC:=mips
endif

ifeq ($(ARCH),arm)
	PKG_ARCH_FRPC:=arm
endif

ifeq ($(ARCH),arm64)
	PKG_ARCH_FRPC:=arm64
endif

ifeq ($(ARCH),aarch64)
	PKG_ARCH_FRPC:=arm64
endif

# 下载最新版本的 frpc 二进制文件
PKG_SOURCE:=frp_$(PKG_VERSION)_linux_$(PKG_ARCH_FRPC).tar.gz
PKG_SOURCE_URL:=https://github.com/fatedier/frp/releases/latest/download/
PKG_HASH:=skip  # 如需校验，可以通过下载文件手动计算 hash 值

TAR_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)/$(PKG_NAME)-TAR

define Build/Prepare
	mkdir -vp $(TAR_DIR)
	tar -zxvf $(DL_DIR)/$(PKG_SOURCE) -C $(TAR_DIR)
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(TAR_DIR)/frpc $(1)/usr/bin/$(PKG_NAME)
	chmod 755 $(1)/usr/bin/$(PKG_NAME)
endef

$(eval $(call BuildPackage,$(PKG_NAME)))

