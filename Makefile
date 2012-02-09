BOOTSTRAP_LESS = ./bootstrap/less/bootstrap.less
BOOTSTRAP_JS = ./bootstrap/js
BOOTSTRAP_RESPONSIVE_LESS = ./bootstrap/less/responsive.less

LESS_COMPRESSOR ?= `which lessc`
WATCHR ?= `which watchr`


all:
	lessc ${BOOTSTRAP_LESS} public/css/bootstrap.css
	lessc --compress ${BOOTSTRAP_LESS} public/css/bootstrap.min.css
	lessc ${BOOTSTRAP_RESPONSIVE_LESS} public/css/bootstrap-responsive.css
	lessc --compress ${BOOTSTRAP_RESPONSIVE_LESS} public/css/bootstrap-responsive.min.css
	cat ${BOOTSTRAP_JS}/* > public/js/bootstrap.js

