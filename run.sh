#!/bin/bash
BUILD_NUMBER="$RANDOM"
echo "Creating entropy file"
echo ${BUILD_NUMBER} > entropy

CURRENT_BRANCH="dev"
IMAGE_BUILD_REPO="quay.io/mwpaa/tagdemo"
IMAGE_BUILD_TAG="${IMAGE_BUILD_REPO}:${BUILD_NUMBER}"

# Build the image
echo "Building ${IMAGE_BUILD_TAG}"
docker build --no-cache -q -t ${IMAGE_BUILD_TAG} .
echo

# Push the image
echo "Pushing ${IMAGE_BUILD_TAG}"
docker push ${IMAGE_BUILD_TAG}
docker tag ${IMAGE_BUILD_TAG} "${IMAGE_BUILD_REPO}:${CURRENT_BRANCH}"
docker push "${IMAGE_BUILD_REPO}:${CURRENT_BRANCH}"
echo

read -p "Promote to prod? (y/n) " choice
case "$choice" in
  y|Y )
    # Promote to prod
    IMAGE_PROD_TAG="${IMAGE_BUILD_REPO}:prod"
    docker tag ${IMAGE_BUILD_TAG} ${IMAGE_PROD_TAG}
    docker push ${IMAGE_PROD_TAG}
  ;;
  n|N ) exit;;
esac
