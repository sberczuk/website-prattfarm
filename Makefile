build:
	hugo
site-run:
	hugo server

deploy: build
ifeq ($(origin WWW_USER), undefined)
      $(info WWW_USER is not set)
else
	pushd public && rsync -av --exclude='.*/' .  ${WWW_USER}@www.berczuk.com:~/public_html/prattfarmsoftware.com
endif

gha-deploy: build
ifeq ($(origin WWW_USER), undefined)
      $(info WWW_USER is not set)
else
	cd public && rsync -av --exclude='.*/' .  ${WWW_USER}@www.berczuk.com:~/public_html/prattfarmsoftware.com
endif



## Test the connection
test-server-connection:
ifeq ($(origin WWW_USER), undefined)
	      $(info WWW_USER is not set)
else
		ssh ${WWW_USER}@www.berczuk.com ls /usr/home/sberczuk2014/public_html/prattfarmsoftware.com
endif