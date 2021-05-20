amd64:
	docker build \
		--platform linux/amd64 \
		--build-arg CNCLI_VERSION=${CNCLI} \
		--no-cache \
		--pull \
		-t "adalove/cncli:${CNCLI}_amd64" .
	docker push "adalove/cncli:${CNCLI}_amd64"

arm64:
	docker build \
		--platform linux/arm64/v8 \
		--build-arg CNCLI_VERSION=${CNCLI} \
		--no-cache \
		--pull \
		-t "adalove/cncli:${CNCLI}_arm64" .
	docker push "adalove/cncli:${CNCLI}_arm64"

manifest:
	docker manifest create "adalove/cncli:${CNCLI}" \
			"adalove/cncli:${CNCLI}_amd64" \
			"adalove/cncli:${CNCLI}_arm64"
	docker manifest push --purge "adalove/cncli:${CNCLI}"

manifest-latest:
	docker manifest create "adalove/cncli" \
			"adalove/cncli:${CNCLI}_amd64" \
			"adalove/cncli:${CNCLI}_arm64"
	docker manifest push --purge "adalove/cncli"

all: amd64 arm64 manifest