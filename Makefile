all: push

# 0.0 shouldn't clobber any release builds
TAG = 1.8-test07
PREFIX = dhub.yunpro.cn/shenshouer/ingress-nginx

controller: controller.go
	CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -ldflags '-w' -o controller ./controller.go

container: controller
	docker build -t $(PREFIX):$(TAG) .

push: container
	docker push $(PREFIX):$(TAG)

clean:
	rm -f controller