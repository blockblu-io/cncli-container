amd64:
	docker build \
		--platform linux/amd64 \
		--build-arg CNCLI_VERSION=${CNCLI} \
		--no-cache \
		--pull \
		-t "blockblu/cncli:${CNCLI}_amd64" .
	docker push "blockblu/cncli:${CNCLI}_amd64"

arm64:
	docker build \
		--platform linux/arm64/v8 \
		--build-arg CNCLI_VERSION=${CNCLI} \
		--no-cache \
		--pull \
		-t "blockblu/cncli:${CNCLI}_arm64" .
	docker push "blockblu/cncli:${CNCLI}_arm64"

manifest:
	docker manifest create "blockblu/cncli:${CNCLI}" \
			"blockblu/cncli:${CNCLI}_amd64" \
			"blockblu/cncli:${CNCLI}_arm64"
	docker manifest push --purge "blockblu/cncli:${CNCLI}"

manifest-latest:
	docker manifest create "blockblu/cncli" \
			"blockblu/cncli:${CNCLI}_amd64" \
			"blockblu/cncli:${CNCLI}_arm64"
	docker manifest push --purge "blockblu/cncli"

all: amd64 arm64 manifest