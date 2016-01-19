# $FreeBSD$

PORTNAME=	lua51-apr
PORTVERSION=	0.23.2
PORTREVISION=	
CATEGORIES=	devel

USE_GITHUB=	yes
GH_ACCOUNT=	xolox
GH_PROJECT=	lua-apr
#GH_TAGNAME=	

MAINTAINER=	snarkyclark@agileanteater.com
COMMENT=	Lua Apache Portable Runtime binding

USES=		lua:51 gmake
ALL_TARGET=	default

LIB_DEPENDS=	libapr-1.so:${PORTSDIR}/devel/apr1 \
		libapreq2.so:${PORTSDIR}/www/libapreq2
	
.include <bsd.port.mk>
