amd64:
	docker build \
		--platform linux/amd64 \
		--build-arg CNCLI_VERSION=${CNCLI_VERSION} \
		--no-cache \
		--pull \
		-t "adalove/cncli:${CNCLI_VERSION}_amd64" .
	docker push "adalove/cncli:${CNCLI_VERSION}_amd64"

arm:
	docker build \
		--platform linux/arm/v7 \
		--build-arg CNCLI_VERSION=${CNCLI_VERSION} \
		--no-cache \
		--pull \
		-t "adalove/cncli:${CNCLI_VERSION}_arm" .
	docker push "adalove/cncli:${CNCLI_VERSION}_arm"

arm64:
	docker build \
		--platform linux/arm64/v8 \
		--build-arg CNCLI_VERSION=${CNCLI_VERSION} \
		--no-cache \
		--pull \
		-t "adalove/cncli:${CNCLI_VERSION}_arm64" .
	docker push "adalove/cncli:${CNCLI_VERSION}_arm64"

manifest:
	docker manifest create "adalove/cncli:${CNCLI_VERSION}" \
			"adalove/cncli:${CNCLI_VERSION}_amd64" \
			"adalove/cncli:${CNCLI_VERSION}_arm" \
			"adalove/cncli:${CNCLI_VERSION}_arm64"
	docker manifest push --purge "adalove/cncli:${CNCLI_VERSION}"

manifest-latest:
	docker manifest create "adalove/cncli" \
			"adalove/cncli:${CNCLI_VERSION}_amd64" \
			"adalove/cncli:${CNCLI_VERSION}_arm" \
			"adalove/cncli:${CNCLI_VERSION}_arm64"
	docker manifest push --purge "adalove/cncli"